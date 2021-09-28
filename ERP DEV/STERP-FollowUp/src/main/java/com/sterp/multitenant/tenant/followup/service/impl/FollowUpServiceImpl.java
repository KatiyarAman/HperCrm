package com.sterp.multitenant.tenant.followup.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.common.service.CommonService;
import com.sterp.multitenant.tenant.core.services.AppService;
import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.dto.CommonPagingResponse;
import com.sterp.multitenant.tenant.employee.entity.Employee;
import com.sterp.multitenant.tenant.entity.UserEntity;
import com.sterp.multitenant.tenant.exceptionhandler.ResourceNotFoundException;
import com.sterp.multitenant.tenant.followup.entity.EventManagement;
import com.sterp.multitenant.tenant.followup.entity.FollowUps;
import com.sterp.multitenant.tenant.followup.repository.FollowUpRepository;
import com.sterp.multitenant.tenant.followup.service.FollowUpService;
import com.sterp.multitenant.tenant.leads.Lead;
import com.sterp.multitenant.tenant.settings.smtp.dto.MailBody;
import com.sterp.multitenant.tenant.settings.smtp.service.EmailService;
import com.sterp.multitenant.tenant.uploadutility.entity.Documents;

@Service
public class FollowUpServiceImpl implements FollowUpService {
	@Autowired
	private AppService appService;
	@Autowired
	private CommonService commonService;
	@Autowired
	private FollowUpRepository followUpRepository;
	@Autowired
	private EmailService emailService;

	@Override
	public Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, FollowUps object,
			MultipartFile[] files,Long moduleId) {
		Map<String, Object> response = new HashMap<String, Object>();
		UserEntity currentUser = appService.getCurrentUser();
		if(object.getModuleId() == 227) {
			Lead lead = this.commonService.getById(Lead.class, object.getRefDoc());
			lead.setStatus(object.getRefDocStatus());
			lead.setFinalOrderValue(object.getFinalOrderValue());
			lead.setOrderValueforQuote(object.getOrderValueforQuote());
			lead.setOrderValueonTechnoCommercial(object.getOrderValueonTechnoCommercial());
			request.setAttribute("moduleId", object.getModuleId());
			MultipartFile[] file = null;
			this.commonService.addUpdate(request,lead,file);
		}
		request.setAttribute("moduleId", moduleId);
		response = this.commonService.addUpdate(request, object, files);
		FollowUps t = new FollowUps();
		for (Map.Entry<String, Object> entry : response.entrySet()) {
			if (((String) entry.getKey()).contains("data")) {
				t = (FollowUps) entry.getValue();
			}
		}

		if(t.getNextFollowup()) {
			EventManagement event = new EventManagement();
			String eventTitle = "";
			switch (t.getNextFollowupType().toString()) {
				case "1":
					eventTitle = "Phone";
					break;
				case "2":
					eventTitle = "Email";
					break;
				case "3":
					eventTitle = "Confrence Cal";
					break;
				case "4":
					eventTitle = "Visit";
					break;
				case "5":
					eventTitle = "Meeting";
					break;
			}
			if(t.getModuleId() == 227) {
				Lead lead = this.commonService.getById(Lead.class, object.getRefDoc());
				eventTitle += " against lead no "+lead.getLeadCode();
			}
			event.setEventTitle(eventTitle);
			event.setEventDate(t.getNextFollowupDate());
			event.setEventEndDate(t.getNextFollowupDate());
			event.setEventStartTime(t.getNextFollowupStartTime());
			event.setEventEndTime(t.getNextFollowupEndTime());
			event.setEventType(t.getNextFollowupType());
			event.setModuleId(moduleId);
			event.setLeadTime(t.getLeadNotificationTime());
			event.setLeadUnit(t.getLeadNotificationUnit());
			event.setInvitees(t.getInvitees());
			event.setRefDoc(t.getId());
			event.setRemarks(t.getNextFollowupRemarks());
			event.setStatus(4L);
			request.setAttribute("moduleId", 9);
			MultipartFile[] file = null;
			this.commonService.addUpdate(request, event, file);
			if(object.isSendMail()) {
				MailBody mailBody = new MailBody();
				String mailContent = "Dear Sir/Madam,<br>";
				mailContent +=t.getMailContent()+"<br>Regards,<br>";
				Employee employee = this.commonService.getById(Employee.class, currentUser.getEmployeeId());
				if(employee != null) {
					mailContent +=employee.getFirstName();
					if(employee.getMiddleName()!=null && !employee.getMiddleName().equals("")) {
						mailContent +=" "+employee.getMiddleName();
					}
					if(employee.getLastName()!=null && !employee.getLastName().equals("")) {
						mailContent +=" "+employee.getLastName();
					}
				}
				mailBody.setBody(mailContent);
				mailBody.setRecipient(event.getInvitees());
				mailBody.setCopyRecipent(currentUser.getEmail());
				mailBody.setSubject(event.getEventTitle());
				this.emailService.composeMail(request, mailBody, files);
			}
			
			
		}
		return response;
	}

	@Override
	public FollowUps getFollowUpById(Long followUpId, Long moduleId, boolean b) {
		FollowUps followUP = followUpRepository.findById(followUpId).get();
		List<Documents> documents = this.commonService.getDocuments(followUpId,moduleId);
		followUP.setDocuments(documents);
		return followUP;
	}

	@Override
	public Map<String, Object> getSelectionList(boolean b) {
		Map<String, Object> response = new HashMap<String, Object>();
		List<CommonDropdownResponseDataTravelObject> followUps = followUpRepository.getSelectionList();
		if (followUps.size() == 0) {
			throw new ResourceNotFoundException("No Active FollowUps found");
		}
		response.put("data", followUps);
		return response;
	
	}

	@Override
	public Map<String, Object> getFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params) {
		Map<String, Object> response = new HashMap<String, Object>();
		params.put("module_id", Long.parseLong(params.get("module_id").toString()));
		CommonPagingResponse<FollowUps> followups = this.commonService.getCommonFilteredList(FollowUps.class, params);
		Map<String, Object> entity = new HashMap<>();
		for (FollowUps x : followups.getContent()) {
			switch (x.getFollowupType().toString()) {
				case "1":
					x.setPrevfollowType("Phone");
					break;
				case "2":
					x.setPrevfollowType("Email");
					break;
				case "3":
					x.setPrevfollowType("Confrence Cal");
					break;
				case "4":
					x.setPrevfollowType("Visit");
					break;
				case "5":
					x.setPrevfollowType("Meeting");
					break;
			}
			entity = new HashMap<>();
			if(x.getModuleId() == 227) {
				entity.put("name", x.getLead().getLeadCode());
				x.setEntity(entity);
			}
		}
		response.put("data",followups);
		return response;
	}
	
	@Override
	public Map<String, Object> getCustomFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params) {
		Map<String, Object> response = new HashMap<String, Object>();
		Long moduleId = null;
		Long refDoc = null;
		Long id = null;
		for (Map.Entry<String, Object> entry : params.entrySet()) {
			if (((String) entry.getKey()).contains("moduleId")) {
				moduleId = Long.parseLong(entry.getValue().toString());
			} else if (((String) entry.getKey()).contains("refDoc")) {
				refDoc = Long.parseLong(entry.getValue().toString());
			} else if (((String) entry.getKey()).contains("id")) {
				try{
					id = Long.parseLong(entry.getValue().toString());
				}catch (Exception e) {
					
				}
				
			}
		}
		List<FollowUps> followUps = new ArrayList<>();
		if(moduleId != null && refDoc != null && id != null) {
			followUps = this.followUpRepository.getCustomFilterList(moduleId,refDoc,id);
		}else if(moduleId != null && refDoc != null) {
			followUps = this.followUpRepository.getCustomFilterList(moduleId,refDoc);
		}
		if(followUps.size()>0) {
			switch (followUps.get(0).getFollowupType().toString()) {
				case "1":
					followUps.get(0).setPrevfollowType("Phone");
					break;
				case "2":
					followUps.get(0).setPrevfollowType("Email");
					break;
				case "3":
					followUps.get(0).setPrevfollowType("Conference Call");
					break;
				case "4":
					followUps.get(0).setPrevfollowType("Visit");
					break;
				case "5":
					followUps.get(0).setPrevfollowType("Meeting");
					break;
			}
			response.put("data", followUps.get(0));
		}
		
		return response;
	}

	@Override
	public Resource download(Long id, Long vid) {
		// TODO Auto-generated method stub
		return this.commonService.download(id, vid);
	}

}
