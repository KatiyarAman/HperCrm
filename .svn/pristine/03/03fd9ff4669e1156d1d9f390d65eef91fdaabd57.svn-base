package com.sterp.multitenant.tenant.exceltemplate.controllor;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.amazonaws.services.cloudwatch.model.InvalidFormatException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sterp.multitenant.tenant.exceltemplate.service.ExcelTemplateService;
import com.sterp.multitenant.tenant.uploadutility.entity.ExcelTemplate;

@RestController
@RequestMapping("/excelTemplate")
public class ExcelTemplateController {
	
	@Autowired
	private ExcelTemplateService excelService;
	
	@Autowired
	ObjectMapper objectMapper;
	
	@RequestMapping(value = { "/add", "/update" }, consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE }, produces = {
					MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_XML_VALUE }, method = { RequestMethod.POST, RequestMethod.PUT })
	public ResponseEntity<?> addOrUpdate(HttpServletRequest request, @RequestPart ExcelTemplate object, @RequestPart (required=false, value = "files") MultipartFile[] files)
			throws IOException, ClassNotFoundException {
		FileOutputStream fileOutputStream = new FileOutputStream("yourfile.txt");
		ObjectOutputStream objectOutputStream = new ObjectOutputStream(fileOutputStream);
		objectOutputStream.writeObject(object);
		objectOutputStream.flush();
		objectOutputStream.close();
		
		FileInputStream fileInputStream = new FileInputStream("yourfile.txt");
		ObjectInputStream objectInputStream = new ObjectInputStream(fileInputStream);
//		Company p2 = (Company) objectInputStream.readObject();
		objectInputStream.close();
		return ResponseEntity.ok(this.excelService.addOrUpdateCompany(request ,object, files));
	}

	@GetMapping(value = "/getSelectionList", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getSelectionList(HttpServletRequest request) {
		Long moduleId = Long.parseLong(request.getHeader("moduleId"));
		return ResponseEntity.ok(this.excelService.getSelectionList(false,moduleId));
	}
	
	@GetMapping(value = "/getAll", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getAll(HttpServletRequest request) {
		Long moduleId = Long.parseLong(request.getHeader("moduleId"));
		return ResponseEntity.ok(this.excelService.getAll(false,moduleId));
	}

	@GetMapping(value = "/getById/{Id}/{moduelId}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> getById(HttpServletRequest request, @PathVariable(value = "Id", required = true) Long Id,@PathVariable(value = "moduleId", required = true) Long moduleId) {
		return ResponseEntity.ok(this.excelService.getById(Id));
	}

	@GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> getList(HttpServletRequest httpServletRequest,
			@RequestParam(required = false) Map<String, Object> params){
		params.put("module_id", Long.parseLong(httpServletRequest.getHeader("moduleId")));
		return ResponseEntity.ok(this.excelService.getTemplateList(params));

	}
	
	@PostMapping(value = "/processTemplate", consumes = MediaType.MULTIPART_FORM_DATA_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> excelExtensionUtility(@RequestPart(required = false, value = "files") MultipartFile files,
			HttpServletResponse response, HttpServletRequest httpServletRequest)
			throws InvalidFormatException, IOException {
		return ResponseEntity.ok(this.excelService.processTemplate(files));
	}

}
