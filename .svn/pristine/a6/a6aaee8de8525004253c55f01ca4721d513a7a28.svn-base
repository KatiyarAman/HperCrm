package com.sterp.multitenant.tenant.compaign.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialException;

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

import com.sterp.multitenant.tenant.campaign.Campaign;
import com.sterp.multitenant.tenant.common.service.CommonService;
import com.sterp.multitenant.tenant.compaign.service.CampaignService;
@RestController
@RequestMapping(value="/compaigns")
public class CampaignController {
	@Autowired
	CommonService commonService;
	
	@Autowired
	private CampaignService campaignService;
	@RequestMapping(value = { "/add", "/update" }, consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.MULTIPART_FORM_DATA_VALUE }, produces = {
					MediaType.APPLICATION_JSON_VALUE }, method = { RequestMethod.POST, RequestMethod.PUT })
	public ResponseEntity<Map<String, Object>> addOrUpdate(HttpServletRequest request,
			@RequestPart Campaign object, @RequestPart(required = false) MultipartFile[] files) {
		return new ResponseEntity<Map<String, Object>>(this.campaignService.addOrUpdateLeadSource(request ,object, files), HttpStatus.OK);

	}

	@GetMapping(value = "/getById/{campaignId}/{moduleId}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getById(@PathVariable("campaignId") Long campaignId,@PathVariable(value = "moduleId", required = true) Long moduleId) {
		return ResponseEntity.ok(this.campaignService.getCampaignById(campaignId, false));
	}

	
	@GetMapping(value = "/getSelectionList", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getSelectionList() {
		return ResponseEntity.ok(this.campaignService.getSelectionList(false));
	}

	@GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> getList(HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> params){

		return ResponseEntity.ok(this.campaignService.getFilteredList(httpServletRequest,params));
	}
	
	@RequestMapping(value = { "/uploadDirect", }, consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.MULTIPART_FORM_DATA_VALUE }, produces = {
					MediaType.APPLICATION_JSON_VALUE }, method = { RequestMethod.POST, RequestMethod.PUT })
	public ResponseEntity<?> uploadDirect(HttpServletRequest request,
			@RequestPart Map<String, Object> object, @RequestPart(required = false) MultipartFile[] files) throws SerialException, SQLException {
		return ResponseEntity.ok(this.campaignService.uploadFile(object,files,request));

	}
	
	@RequestMapping(value = { "/moduleDocuments", }, consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.MULTIPART_FORM_DATA_VALUE }, produces = {
					MediaType.APPLICATION_JSON_VALUE }, method = { RequestMethod.POST, RequestMethod.PUT })
	public ResponseEntity<?> moduleDocuments(HttpServletRequest request,
			@RequestParam Map<String, Object> object) throws SerialException, SQLException {
		return ResponseEntity.ok(this.campaignService.moduleDocuments(object,request));

	}
}
