package com.sterp.multitenant.tenant.leadchecklist.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.leadchecklist.LeadCheckList;

public interface LeadCheckListService {

	Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, LeadCheckList object, MultipartFile[] files);

	LeadCheckList getLeadChecklistById(Long leadCkecklistId, boolean b);

	Map<String, Object> getSelectionList(boolean b);

	Map<String, Object> getFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params);

}
