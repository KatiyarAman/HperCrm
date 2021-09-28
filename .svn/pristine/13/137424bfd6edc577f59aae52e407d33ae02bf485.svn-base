package com.sterp.multitenant.tenant.modules.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.modules.entity.Actions;

public interface ActionService {
	Map<String, Object> getSelectionList();

	Actions getActionById(Long id);

	Map<String, Object> getActionList(Map<String, Object> params);

	Map<String, Object> saveOrUpdate(HttpServletRequest request, Actions object, MultipartFile[] files);
}
