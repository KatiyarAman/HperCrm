package com.sterp.multitenant.tenant.settings.smtp.controller;

import java.io.IOException;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sterp.multitenant.tenant.settings.smtp.dto.MailBody;
import com.sterp.multitenant.tenant.settings.smtp.dto.SMTPSettingsDto;
import com.sterp.multitenant.tenant.settings.smtp.entity.SMTPSettings;
import com.sterp.multitenant.tenant.settings.smtp.service.EmailService;

@RestController
@RequestMapping("/smtpSettings")
public class EmailController {

	@Autowired
	ObjectMapper objectMapper;
	
	@Autowired
	EmailService emailService;

	@RequestMapping(value = "/send", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.MULTIPART_FORM_DATA_VALUE }, produces = {
					MediaType.APPLICATION_JSON_VALUE }, method = { RequestMethod.POST, RequestMethod.PUT })
	public ResponseEntity<?> sendMail(HttpServletRequest request, @RequestPart MailBody object, @RequestPart(required = false) MultipartFile[] multipartfile)
			throws MessagingException, IOException {
		return ResponseEntity.ok(this.emailService.composeMail(request,object, multipartfile));
		
	}

	@RequestMapping(value = { "/add", "/update" }, consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.MULTIPART_FORM_DATA_VALUE }, produces = {
					MediaType.APPLICATION_JSON_VALUE }, method = { RequestMethod.POST, RequestMethod.PUT })
	public ResponseEntity<?> configEmail(HttpServletRequest request, @RequestPart SMTPSettings object,
			@RequestPart(required = false) MultipartFile[] multipartfile) {
		return ResponseEntity.ok(this.emailService.sendConfigurationTestMail(request,object,multipartfile));
	}
	
	@GetMapping(value = "/getById/{id}/{moduleId}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getById(@PathVariable("id") Long id,@PathVariable(value = "moduleId", required = true) Long moduleId) {
		return ResponseEntity.ok(this.emailService.getById(id, false));
	}

	
	@GetMapping(value = "/getSelectionList", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getSelectionList() {
		return ResponseEntity.ok(this.emailService.getSelectionList(false));
	}

	@GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> getList(HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> params){
		return ResponseEntity.ok(this.emailService.getFilteredList(httpServletRequest,params));
	}

//	@GetMapping(value = "/list", produces = "application/json")
//	public ResponseEntity<?> getClientLists(@RequestParam Map<String, Object> params,
//			HttpServletRequest httpServletRequest) throws JsonParseException, JsonMappingException, IOException {
//		int page = 1;
//		int limit = 10;
//		String search = null;
//		String sort = null;
//		String order = null;
//		boolean filterRemove = false;
//		for (Map.Entry<String, Object> entry : params.entrySet()) {
//			if (((String) entry.getKey()).contains("_page")) {
//				page = Integer.parseInt(entry.getValue().toString());
//			} else if (((String) entry.getKey()).contains("_limit")) {
//				limit = Integer.parseInt(entry.getValue().toString());
//			} else if (((String) entry.getKey()).contains("_order")) {
//				order = (String) entry.getValue();
//			} else if (((String) entry.getKey()).contains("_sort")) {
//				sort = (String) entry.getValue();
//			} else if (((String) entry.getKey()).contains("_search")) {
//				search = (String) entry.getValue();
//			} else if (((String) entry.getKey()).contains("_like")) {
//				search = (String) entry.getValue();
//			}
//		}
//		int screenId = Integer.parseInt(httpServletRequest.getHeader("screenId"));
//		Map<String, Object> response = this.emailService.getSMTPConfigList(page, limit, search, sort, order,
//				filterRemove, screenId);
//		return ResponseEntity.ok(response);
//	}
}
