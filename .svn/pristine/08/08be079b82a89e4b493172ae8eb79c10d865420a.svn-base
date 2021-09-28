package com.sterp.multitenant.tenant.contactbook.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.branch.entity.ContactDetails;
import com.sterp.multitenant.tenant.common.service.CommonService;
import com.sterp.multitenant.tenant.contactbook.service.ContactBookService;

@RestController
@RequestMapping(value = "/contactBook")
public class ContactBookController {
	@Autowired
	CommonService commonService;

	@Autowired
	private ContactBookService contactBookService;

	@RequestMapping(value = { "/add", "/update" }, consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.MULTIPART_FORM_DATA_VALUE }, produces = {
					MediaType.APPLICATION_JSON_VALUE }, method = { RequestMethod.POST, RequestMethod.PUT })
	public ResponseEntity<Map<String, Object>> addOrUpdate(HttpServletRequest request,
			@RequestPart ContactDetails object, @RequestPart(required = false) MultipartFile[] files) {
		return new ResponseEntity<Map<String, Object>>(
				this.contactBookService.addOrUpdateLeadSource(request, object, files), HttpStatus.OK);

	}

	@GetMapping(value = "/getById/{contactBookId}/{moduleId}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getById(@PathVariable("contactBookId") Long contactBookId,@PathVariable(value = "moduleId", required = true) Long moduleId) {
		return ResponseEntity.ok(this.contactBookService.getContactDetailsById(contactBookId, false));
	}

	@GetMapping(value = "/getSelectionList", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getSelectionList() {
		return ResponseEntity.ok(this.contactBookService.getSelectionList(false));
	}

	@GetMapping(value = "/list", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getList(HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> params) {
		Map<String, Object> response = new HashMap<String, Object>();
		params.put("module_id",Long.parseLong(httpServletRequest.getHeader("moduleId")));
		response.put("data", this.commonService.getCommonFilteredList(ContactDetails.class, params));
		return ResponseEntity.ok(response);
	}
	
	@GetMapping(value = "/filteredList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> getFilteredList(HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> params){
		return ResponseEntity.ok(this.contactBookService.getCustomFilteredList(httpServletRequest,params));
	}
}
