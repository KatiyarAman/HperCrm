package com.sterp.multitenant.tenant.followup.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.followup.entity.FollowUps;

public interface FollowUpService {

	Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, FollowUps object, MultipartFile[] files, Long moduleId);

	FollowUps getFollowUpById(Long followUpId, Long moduleId, boolean b);

	Map<String,Object> getSelectionList(boolean b);

	Map<String,Object> getFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params);

	Map<String, Object> getCustomFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params);
	
	Resource download(Long id, Long vid);

}
