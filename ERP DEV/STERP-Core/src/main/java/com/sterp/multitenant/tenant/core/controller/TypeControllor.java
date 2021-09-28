package com.sterp.multitenant.tenant.core.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.sterp.multitenant.tenant.core.services.TypeService;
import com.sterp.multitenant.tenant.dto.TypeRequestDTO;
import com.sterp.multitenant.tenant.settings.template.entity.dto.ScreenFilterDTO;

@RestController
@RequestMapping("/type")
public class TypeControllor {

	@Autowired
	TypeService typeService;

	@RequestMapping(value = { "/add", "/update" }, consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.MULTIPART_FORM_DATA_VALUE }, produces = {
					MediaType.APPLICATION_JSON_VALUE }, method = { RequestMethod.POST, RequestMethod.PUT })
	public ResponseEntity<?> addOrUpdate(@RequestPart TypeRequestDTO object, HttpServletRequest request) {
		return ResponseEntity.ok(this.typeService.saveOrUpdateType(object));
	}

	@GetMapping(value = { "/getById/{typeId}/{moduleId}" }, produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getById(@PathVariable("typeId") Long typeId,@PathVariable(value = "moduleId", required = true) Long moduleId) {
		return ResponseEntity.ok(this.typeService.getTypeById(typeId, false));
	}

	@GetMapping(value = { "/getSelectionList" }, produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getSelectionList(HttpServletRequest request, @RequestParam Map<String, Object> params) {
		System.out.println(request.getHeader("moduleId"));
		Long moduleId = 0L;
		for (Map.Entry<String, Object> entry : params.entrySet()) {
			if (((String) entry.getKey()).contains("moduleId")) {
				moduleId = Long.parseLong(entry.getValue().toString());
			} 
		}
		
		return ResponseEntity.ok(this.typeService.getSelectionList(false, moduleId));
	}
	
	@GetMapping("/list")
	public ResponseEntity<?> getTypeListByModule(@RequestParam  Map<String, Object> params) throws JsonParseException, JsonMappingException, IOException {
		return ResponseEntity.ok(this.typeService.getTypeList(params));
	}

}
