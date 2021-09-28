package com.sterp.multitenant.tenant.contactbook.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.branch.entity.ContactDetails;

public interface ContactBookService {

	Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, ContactDetails object, MultipartFile[] files);

	ContactDetails getContactDetailsById(Long contactDetailsId, boolean b);

	Map<String, Object> getSelectionList(boolean b);

	Map<String, Object> getCustomFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params);

}
