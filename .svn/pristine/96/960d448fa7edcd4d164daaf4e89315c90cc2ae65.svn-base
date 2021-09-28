package com.sterp.multitenant.tenant.followup.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.followup.entity.FollowUps;
import com.sterp.multitenant.tenant.followup.service.FollowUpService;

@RestController
@RequestMapping(value="/followups")
public class FollowUPController {
	
	@Autowired
	private FollowUpService followUpService;
	
	@RequestMapping(value = { "/add", "/update" }, consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.MULTIPART_FORM_DATA_VALUE }, produces = {
					MediaType.APPLICATION_JSON_VALUE }, method = { RequestMethod.POST, RequestMethod.PUT })
	public ResponseEntity<Map<String, Object>> addOrUpdate(HttpServletRequest request,
			@RequestPart FollowUps object, @RequestPart(required = false) MultipartFile[] files,@RequestPart(required = false) Long moduleId) {
		return new ResponseEntity<Map<String, Object>>(this.followUpService.addOrUpdateLeadSource(request ,object, files,moduleId), HttpStatus.OK);

	}

	@GetMapping(value = "/getById/{followUpId}/{moduleId}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getById(HttpServletRequest request, @PathVariable("followUpId") Long followUpId, @PathVariable("moduleId") Long moduleId) {
//		Long moduleId = Long.parseLong(request.getHeader("moduleId"));
		return ResponseEntity.ok(this.followUpService.getFollowUpById(followUpId,moduleId, false));
	}

	
	@GetMapping(value = "/getSelectionList", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getSelectionList() {
		return ResponseEntity.ok(this.followUpService.getSelectionList(false));
	}

	@GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> getList(HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> params){
		return ResponseEntity.ok(this.followUpService.getFilteredList(httpServletRequest,params));
	}
	
	@GetMapping(value = "/filteredList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> getFilteredList(HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> params){
		return ResponseEntity.ok(this.followUpService.getCustomFilteredList(httpServletRequest,params));
	}
	
	@GetMapping(value = "/files/{id}/{vid}")
    @ResponseBody
    public ResponseEntity<Resource> downloadFile(@PathVariable Long id, @PathVariable Long vid) throws IOException {
        Resource file = this.followUpService.download(id,vid);
        Path path = file.getFile().toPath();

        return ResponseEntity.ok()
                             .header(HttpHeaders.CONTENT_TYPE, Files.probeContentType(path))
                             .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFilename() + "\"")
                             .body(file);
    }
}
