package com.sterp.multitenant.tenant.modules.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.sterp.multitenant.tenant.modules.entity.Actions;
import com.sterp.multitenant.tenant.modules.service.ActionService;

@RestController
@RequestMapping("/actions")
public class ActionController {

	@Autowired
	private ActionService actionService;
	
	@GetMapping("/getSelectionList")
	public ResponseEntity<Map<String, Object>> getSelectionList() {
		return ResponseEntity.ok(actionService.getSelectionList());
	}
	
	@GetMapping(value = "/getById/{Id}/{moduleId}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> getById(HttpServletRequest request, @PathVariable(value = "Id", required = true) Long Id,@PathVariable(value = "moduleId", required = true) Long moduleId) {
		return ResponseEntity.ok(this.actionService.getActionById(Id));
	}
	
	
	@GetMapping(path = "/list", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> getButtonList(HttpServletRequest httpServletRequest,
			@RequestParam(required = false) Map<String, Object> params){
		params.put("module_id", Long.parseLong(httpServletRequest.getHeader("moduleId")));
		return ResponseEntity.ok(this.actionService.getActionList(params));
	}
	
	
	@RequestMapping(
			path = {"/add","/update"},
			method = {RequestMethod.PUT, RequestMethod.POST},
			consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE},
			produces = {MediaType.APPLICATION_JSON_VALUE}
	)
	public ResponseEntity<Map<String, Object>> saveOrUpdate(HttpServletRequest request,@RequestPart Actions object, @RequestPart(required = false) MultipartFile[] files) throws IOException {
		FileOutputStream fileOutputStream = new FileOutputStream("yourfile.txt");
		ObjectOutputStream objectOutputStream = new ObjectOutputStream(fileOutputStream);
		objectOutputStream.writeObject(object);
		objectOutputStream.flush();
		objectOutputStream.close();
		
		FileInputStream fileInputStream = new FileInputStream("yourfile.txt");
		ObjectInputStream objectInputStream = new ObjectInputStream(fileInputStream);
		objectInputStream.close();
		return ResponseEntity.ok(this.actionService.saveOrUpdate(request, object, files));
	}
}
