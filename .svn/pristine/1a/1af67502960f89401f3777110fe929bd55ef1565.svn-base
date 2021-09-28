package com.sterp.multitenant.tenant.leads.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.cloudwatch.model.InvalidFormatException;
import com.sterp.multitenant.tenant.leads.Lead;
import com.sterp.multitenant.tenant.leads.service.LeadService;

@RestController
@RequestMapping(value = "/lead")
public class LeadController {


	@Autowired
	private LeadService leadService;

	@RequestMapping(value = { "/add", "/update" }, consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.MULTIPART_FORM_DATA_VALUE }, produces = {
					MediaType.APPLICATION_JSON_VALUE }, method = { RequestMethod.POST, RequestMethod.PUT })
	public ResponseEntity<Map<String, Object>> addOrUpdate(HttpServletRequest request, @RequestPart Lead object,
			@RequestPart(required = false) MultipartFile[] files) {
		return new ResponseEntity<Map<String, Object>>(this.leadService.addOrUpdateLeadSource(request, object, files),
				HttpStatus.OK);

	}

	@GetMapping(value = "/getById/{leadId}/{moduleId}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getById(HttpServletRequest request,@PathVariable("leadId") Long leadId,@PathVariable(value = "moduleId", required = true) Long moduleId) {
//		Long moduleId = Long.parseLong(request.getHeader("moduleId"));
		return ResponseEntity.ok(this.leadService.getLeadById(leadId,moduleId, false));
	}
	@GetMapping(value = "/getByName/{name}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getByName(@PathVariable("name") String name) {
		return ResponseEntity.ok(this.leadService.getLeadByName(name, false));
	}

	@GetMapping(value = "/getSelectionList", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getSelectionList() {
		return ResponseEntity.ok(this.leadService.getSelectionList(false));
	}

	@GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> getList(HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> params) {
		return ResponseEntity.ok(this.leadService.getFilteredList(httpServletRequest,params));
	}
	
	@PostMapping(value = "/processTemplate", consumes = MediaType.MULTIPART_FORM_DATA_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> excelExtensionUtility(@RequestPart(required = false, value = "files") MultipartFile files,
			HttpServletResponse response, HttpServletRequest httpServletRequest)
			throws InvalidFormatException, IOException {
		return ResponseEntity.ok(this.leadService.processTemplate(files));
	}
	
	@GetMapping(value = "/files/{id}/{vid}")
    @ResponseBody
    public ResponseEntity<Resource> downloadFile(@PathVariable Long id, @PathVariable Long vid) throws IOException {
        Resource file = this.leadService.download(id,vid);
        Path path = file.getFile().toPath();

        return ResponseEntity.ok()
                             .header(HttpHeaders.CONTENT_TYPE, Files.probeContentType(path))
                             .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFilename() + "\"")
                             .body(file);
    }
}
