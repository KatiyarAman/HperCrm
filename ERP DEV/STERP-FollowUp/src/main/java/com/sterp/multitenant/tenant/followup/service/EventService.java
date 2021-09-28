package com.sterp.multitenant.tenant.followup.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.followup.entity.EventManagement;

public interface EventService {

	Map<String, Object> addOrUpdateEvent(HttpServletRequest request, EventManagement object, MultipartFile[] files,
			Long moduleId);

	EventManagement getById(Long followUpId, boolean isCacheable);

	Map<String, Object> getSelectionList(boolean isCacheable);
	
	Map<String,Object> getFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params);

	Map<String, Object> getCustomFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params);

	Map<String,Object> getAll(HttpServletRequest httpServletRequest, Map<String, Object> params);

}
