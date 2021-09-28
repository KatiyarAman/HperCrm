package com.sterp.multitenant.tenant.contactbook.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.branch.entity.ContactDetails;
import com.sterp.multitenant.tenant.common.service.CommonService;
import com.sterp.multitenant.tenant.contactbook.repository.ContactBookRepository;
import com.sterp.multitenant.tenant.contactbook.service.ContactBookService;
import com.sterp.multitenant.tenant.core.services.AppService;
import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.exceptionhandler.ResourceNotFoundException;

@Service
public class ContactBookServiceImpl implements ContactBookService {
	
	@Autowired
	private CommonService commonService;
	@Autowired
	private ContactBookRepository contactBookRepository;

	@Override
	public Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, ContactDetails object,
			MultipartFile[] files) {
		Map<String, Object> response = new HashMap<String, Object>();
		request.setAttribute("moduleId", request.getHeader("moduleId"));
		response.put("data", this.commonService.addUpdate(request, object, files));
		return response;
	}

	@Override
	public ContactDetails getContactDetailsById(Long contactDetailsId, boolean b) {
		ContactDetails contactBook = contactBookRepository.findById(contactDetailsId).get();
		if (contactBook != null) {
			return contactBook;
		}
		return null;
	}

	@Override
	public Map<String, Object> getSelectionList(boolean b) {
		Map<String, Object> response = new HashMap<String, Object>();
		List<CommonDropdownResponseDataTravelObject> contactBooks = contactBookRepository.getSelectionList();
		if (contactBooks.size() == 0) {
			throw new ResourceNotFoundException("No Active ContactBooks Found");
		}
		response.put("data", contactBooks);
		return response;
	}

	@Override
	public Map<String, Object> getCustomFilteredList(HttpServletRequest httpServletRequest,
			Map<String, Object> params) {
		Map<String, Object> response = new HashMap<String, Object>();
		Long moduleId = null;
		Long refDoc = null;
		for (Map.Entry<String, Object> entry : params.entrySet()) {
			if (((String) entry.getKey()).contains("moduleId")) {
				moduleId = Long.parseLong(entry.getValue().toString());
			} else if (((String) entry.getKey()).contains("refDoc")) {
				refDoc = Long.parseLong(entry.getValue().toString());
			}
		}
		List<ContactDetails> contacts = new ArrayList<>();
		if(moduleId != null && refDoc != null) {
			contacts = this.contactBookRepository.getCustomFilterList(moduleId,refDoc);
		}else if(moduleId != null) {
			contacts = this.contactBookRepository.getCustomFilterList(moduleId);
		}
		if(contacts.size()>0) {
			response.put("data", contacts);
		}
		
		return response;
	}

}
