package com.sterp.multitenant.tenant.oppurtunities.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.oppurtunities.Oppurtunity;

public interface OppurtunityService {

	Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, Oppurtunity object, MultipartFile[] files);

	Oppurtunity getOppurtunityById(Long oppurtunityId, boolean b);

	Map<String, Object> getSelectionList(boolean b);

	Map<String, Object> getFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params);

}
