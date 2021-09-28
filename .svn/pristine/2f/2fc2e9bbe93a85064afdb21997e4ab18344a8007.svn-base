package com.sterp.multitenant.tenant.settings.template.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.settings.template.entity.Buttons;

@Service
public interface ButtonsService {
	Map<String, Object> getSelectionList();
	Map<String, Object> getButtonList(Map<String, Object> param);
	Map<String, Object> saveOrUpdate(HttpServletRequest request ,Buttons object, MultipartFile[] files);
	Object getButtonById(Long id);
}
