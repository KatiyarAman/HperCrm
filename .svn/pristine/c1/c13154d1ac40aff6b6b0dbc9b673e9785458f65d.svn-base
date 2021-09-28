package com.sterp.multitenant.tenant.leadsource.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.leadsource.entity.LeadSource;

public interface LeadSourceService {

	 Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, LeadSource leadSource, MultipartFile[] files);

	 LeadSource getLeadSourceById(Long employeeId, boolean b);

	 Map<String, Object> getSelectionList(boolean b);

	Map<String,Object> getFilteredList(HttpServletRequest request,Map<String, Object> params);

	LeadSource getLeadByName(String name, boolean b);

}
