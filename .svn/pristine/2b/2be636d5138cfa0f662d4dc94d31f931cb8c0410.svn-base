package com.sterp.multitenant.tenant.modules.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.common.service.CommonService;
import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.exceptionhandler.ResourceNotFoundException;
import com.sterp.multitenant.tenant.modules.entity.Actions;
import com.sterp.multitenant.tenant.modules.repository.ActionsRepository;
import com.sterp.multitenant.tenant.modules.service.ActionService;

@Service
public class ActionServiceImpl implements ActionService {

	@Autowired
	private ActionsRepository actionsRepository;
	
	@Autowired
	private CommonService commonService;
	
	@Override
	public Map<String, Object> getSelectionList() {
		Map<String, Object> response = new HashMap<String, Object>();
		List<CommonDropdownResponseDataTravelObject> data = this.actionsRepository.getSelectionList(2L);
		if (data.isEmpty())
			throw new ResourceNotFoundException("No Active Action Found");
		response.put("data", data);
		return response;
	}

	@Override
	public Actions getActionById(Long id) {
		Actions action = this.actionsRepository.findById(id).get();
		return action;
	}

	@Override
	public Map<String, Object> getActionList(Map<String, Object> params) {
		Map<String, Object> response = new HashMap<String, Object>();
		response.put("data", this.commonService.getCommonFilteredList(Actions.class, params));
		return response;
	}

	@Override
	public Map<String, Object> saveOrUpdate(HttpServletRequest request, Actions object, MultipartFile[] files) {
		Map<String, Object> response = new HashMap<>();
		request.setAttribute("moduleId", request.getHeader("moduleId"));
		response = this.commonService.addUpdate(request, object, files);
		return response;
	}

}
