package com.sterp.multitenant.tenant.leads.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.leads.Lead;
import com.sterp.multitenant.tenant.uploadutility.dto.ExcelResponse;

public interface LeadService {

	Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, Lead object, MultipartFile[] files);

	Lead getLeadById(Long leadId, Long moduleId, boolean b);

	Map<String,Object> getSelectionList(boolean b);

	Map<String,Object> getFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params);

	public List<ExcelResponse> processTemplate(MultipartFile files) throws IOException;

	Lead getLeadByName(String name, boolean b);

	Resource download(Long id, Long vid);

}
