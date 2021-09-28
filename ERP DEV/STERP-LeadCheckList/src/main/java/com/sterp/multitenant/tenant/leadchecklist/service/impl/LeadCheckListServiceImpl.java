package com.sterp.multitenant.tenant.leadchecklist.service.impl;

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
import com.sterp.multitenant.tenant.entity.UserEntity;
import com.sterp.multitenant.tenant.exceptionhandler.ResourceNotFoundException;
import com.sterp.multitenant.tenant.leadchecklist.LeadCheckList;
import com.sterp.multitenant.tenant.leadchecklist.repository.LeadCheckListRepository;
import com.sterp.multitenant.tenant.leadchecklist.service.LeadCheckListService;

@Service
public class LeadCheckListServiceImpl implements LeadCheckListService {
	@Autowired
	private AppService appService;
	@Autowired
	private CommonService commonService;
	@Autowired
	private LeadCheckListRepository leadCheckListRepository;

	@Override
	public Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, LeadCheckList object,
			MultipartFile[] files) {
		Map<String, Object> response = new HashMap<String, Object>();
		UserEntity currentUser = appService.getCurrentUser();
		if(object.getId() == null) {
			object.setCreatedBy(currentUser.getId());
		}
		object.setModifiedBy(currentUser.getId());
		object.setCompanyId(currentUser.getCompanyId());
		object.setBranchId(currentUser.getBranchId());
		request.setAttribute("moduleId", request.getHeader("moduleId"));
		response.put("data", this.commonService.addUpdate(request, object, files));
		return response;
	}

	@Override
	public LeadCheckList getLeadChecklistById(Long leadCkecklistId, boolean b) {
		LeadCheckList leadCheckList = leadCheckListRepository.findById(leadCkecklistId).get();
		if (leadCheckList != null) {
			return leadCheckList;
		}
		return null;
	}

	@Override
	public Map<String, Object> getSelectionList(boolean b) {
		Map<String, Object> response = new HashMap<String, Object>();
		List<CommonDropdownResponseDataTravelObject> leadChecklists = leadCheckListRepository.getSelectionList();
		if (leadChecklists.size() == 0) {
			throw new ResourceNotFoundException("No Active leadChecklist found");
		}
		response.put("data", leadChecklists);
		return response;
	}

	@Override
	public Map<String, Object> getFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params) {
		Map<String, Object> response = new HashMap<String, Object>();
		params.put("module_id",Long.parseLong(httpServletRequest.getHeader("moduleId")));
		response.put("data",this.commonService.getCommonFilteredList(LeadCheckList.class, params));
		return response;
	}

}
