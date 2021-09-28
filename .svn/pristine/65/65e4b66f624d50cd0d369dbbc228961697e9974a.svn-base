package com.sterp.multitenant.tenant.followup.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.common.service.CommonService;
import com.sterp.multitenant.tenant.core.services.AppService;
import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.dto.CommonPagingResponse;
import com.sterp.multitenant.tenant.entity.UserEntity;
import com.sterp.multitenant.tenant.exceptionhandler.ResourceNotFoundException;
import com.sterp.multitenant.tenant.followup.entity.EventManagement;
import com.sterp.multitenant.tenant.followup.entity.FollowUps;
import com.sterp.multitenant.tenant.followup.repository.EventRepository;
import com.sterp.multitenant.tenant.followup.service.EventService;
import com.sterp.multitenant.tenant.settings.smtp.service.EmailService;

@Service
public class EventServiceImpl implements EventService {
	@Autowired
	private AppService appService;
	@Autowired
	private CommonService commonService;
	@Autowired
	private EventRepository eventRepo;
	@Autowired
	private EmailService emailService;

	@Override
	public Map<String, Object> addOrUpdateEvent(HttpServletRequest request, EventManagement object,
			MultipartFile[] files, Long moduleId) {
		Map<String, Object> response = new HashMap<String, Object>();
		UserEntity currentUser = appService.getCurrentUser();
		request.setAttribute("moduleId", moduleId);
		response = this.commonService.addUpdate(request, object, files);
		return response;
	}

	@Override
	public EventManagement getById(Long eventId, boolean isCacheable) {
		EventManagement followUP = eventRepo.findById(eventId).get();
//		List<Documents> documents = this.commonService.getDocuments(eventId,moduleId);
//		followUP.setDocuments(documents);
		return followUP;
	}

	@Override
	public Map<String, Object> getSelectionList(boolean isCacheable) {
		Map<String, Object> response = new HashMap<String, Object>();
		List<CommonDropdownResponseDataTravelObject> followUps = eventRepo.getSelectionList();
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
		CommonPagingResponse<EventManagement> followups = this.commonService.getCommonFilteredList(EventManagement.class, params);
		Map<String, Object> entity = new HashMap<>();
		response.put("data",followups);
		return response;
	}

	@Override
	public Map<String, Object> getCustomFilteredList(HttpServletRequest httpServletRequest,
			Map<String, Object> params) {
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
		List<EventManagement> followUps = new ArrayList<>();
		if(moduleId != null && refDoc != null && id != null) {
			followUps = this.eventRepo.getCustomFilterList(moduleId,refDoc,id);
		}else if(moduleId != null && refDoc != null) {
			followUps = this.eventRepo.getCustomFilterList(moduleId,refDoc);
		}
		if(followUps.size()>0) {
			
			response.put("data", followUps.get(0));
		}
		
		return response;
	}

	@Override
	public Map<String, Object> getAll(HttpServletRequest httpServletRequest, Map<String, Object> params) {
		Map<String, Object> response = new HashMap<String, Object>();
		response.put("data", this.eventRepo.findAll());
		return response;
	}

}
