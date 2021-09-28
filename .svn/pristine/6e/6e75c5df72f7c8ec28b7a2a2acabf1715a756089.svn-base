package com.sterp.multitenant.tenant.unitmaster.controller;

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
import com.sterp.multitenant.tenant.unitmaster.Unit;
import com.sterp.multitenant.tenant.unitmaster.service.UnitService;

@RestController
@RequestMapping(value="/unit")
public class UnitController {
	@Autowired
	CommonService commonService;
	
	@Autowired
	private UnitService unitService;
	@RequestMapping(value = { "/add", "/update" }, consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.MULTIPART_FORM_DATA_VALUE }, produces = {
					MediaType.APPLICATION_JSON_VALUE }, method = { RequestMethod.POST, RequestMethod.PUT })
	public ResponseEntity<Map<String, Object>> addOrUpdate(HttpServletRequest request,
			@RequestPart Unit object, @RequestPart(required = false) MultipartFile[] files) {
		return new ResponseEntity<Map<String, Object>>(this.unitService.addOrUpdateLeadSource(request ,object, files), HttpStatus.OK);

	}

	@GetMapping(value = "/getById/{unitId}/{moduleId}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getById(@PathVariable("unitId") Long unitId,@PathVariable(value = "moduleId", required = true) Long moduleId) {
		return ResponseEntity.ok(this.unitService.getUnitById(unitId, false));
	}

	
	@GetMapping(value = "/getSelectionList", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getSelectionList() {
		return ResponseEntity.ok(this.unitService.getSelectionList(false));
	}

	@GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> getList(HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> params){
		Map<String,Object> response=new HashMap<String, Object>();
		params.put("module_id", Long.parseLong(httpServletRequest.getHeader("moduleId")));
		response.put("data", this.commonService.getCommonFilteredList(Unit.class, params));
		return ResponseEntity.ok(response);
	}
}
