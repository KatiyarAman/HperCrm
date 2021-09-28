package com.sterp.multitenant.tenant.leadsource.controller;

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

import com.sterp.multitenant.tenant.common.service.CommonService;
import com.sterp.multitenant.tenant.employee.entity.Employee;
import com.sterp.multitenant.tenant.leadsource.entity.LeadSource;
import com.sterp.multitenant.tenant.leadsource.service.LeadSourceService;

@RestController
@RequestMapping(value="/leadSource")
public class LeadSourceController {
	@Autowired
	CommonService commonService;
	
	@Autowired
	private LeadSourceService leadSourceService;
	@RequestMapping(value = { "/add", "/update" }, consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.MULTIPART_FORM_DATA_VALUE }, produces = {
					MediaType.APPLICATION_JSON_VALUE }, method = { RequestMethod.POST, RequestMethod.PUT })
	public ResponseEntity<Map<String, Object>> addOrUpdate(HttpServletRequest request,
			@RequestPart LeadSource object, @RequestPart(required = false) MultipartFile[] files) {
		return new ResponseEntity<Map<String, Object>>(this.leadSourceService.addOrUpdateLeadSource(request ,object, files), HttpStatus.OK);

	}

	@GetMapping(value = "/getById/{leadSourceId}/{moduleId}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getById(@PathVariable("leadSourceId") Long leadSourceId,@PathVariable(value = "moduleId", required = true) Long moduleId) {
		return ResponseEntity.ok(this.leadSourceService.getLeadSourceById(leadSourceId, false));
	}

	
	@GetMapping(value = "/getSelectionList", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getSelectionList() {
		return ResponseEntity.ok(this.leadSourceService.getSelectionList(false));
	}

	@GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> getList(HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> params){
		return ResponseEntity.ok(this.leadSourceService.getFilteredList(httpServletRequest,params));
	}
	
	@GetMapping(value = "/getByName/{name}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getByName(@PathVariable("name") String name) {
		return ResponseEntity.ok(this.leadSourceService.getLeadByName(name, false));
	}

}
