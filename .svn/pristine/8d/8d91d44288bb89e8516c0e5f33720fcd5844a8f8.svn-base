package com.sterp.multitenant.tenant.oppurtunities.service.impl;

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
import com.sterp.multitenant.tenant.oppurtunities.Oppurtunity;
import com.sterp.multitenant.tenant.oppurtunities.repository.OppurtunityRepository;
import com.sterp.multitenant.tenant.oppurtunities.service.OppurtunityService;

@Service
public class OppurtunityServiceImpl implements OppurtunityService {
	@Autowired
	private AppService appService;
	@Autowired
	private CommonService commonService;
	@Autowired
	private OppurtunityRepository oppurtunityRepository;

	@Override
	public Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, Oppurtunity object,
			MultipartFile[] files) {
		Map<String, Object> response = new HashMap<String, Object>();
		UserEntity currentUser = appService.getCurrentUser();
//		if(object.getId() == null) {
//			object.setCreatedBy(currentUser.getId());
//		}
		object.setModifiedBy(currentUser.getId());
		object.setCompanyId(currentUser.getCompanyId());
		object.setBranchId(currentUser.getBranchId());
		response.put("data", this.commonService.addUpdate(request, object, files));
		return response;
	}

	@Override
	public Oppurtunity getOppurtunityById(Long oppurtunityId, boolean b) {
		Oppurtunity oppurtunity = oppurtunityRepository.findById(oppurtunityId).get();
		if (oppurtunity != null) {
			return oppurtunity;
		}
		return null;
	}

	@Override
	public Map<String, Object> getSelectionList(boolean b) {
		Map<String, Object> response = new HashMap<String, Object>();
		List<CommonDropdownResponseDataTravelObject> oppurtunities = oppurtunityRepository.getSelectionList();
		if (oppurtunities.size() == 0) {
			throw new ResourceNotFoundException("No Active Oppurtunities found");
		}
		response.put("data", oppurtunities);

		return response;
	}

	@Override
	public Map<String, Object> getFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params) {
		Map<String, Object> response = new HashMap<String, Object>();
		params.put("module_id", Long.parseLong(httpServletRequest.getHeader("moduleId")));
		response.put("data",this.commonService.getCommonFilteredList(Oppurtunity.class, params));
		return response;
	}

}
