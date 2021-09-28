package com.sterp.multitenant.tenant.productmaster.controller;

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

import com.sterp.multitenant.tenant.product.Product;
import com.sterp.multitenant.tenant.productmaster.service.ProductMasterService;

@RestController
@RequestMapping(value="/productMaster")
public class ProductMasterController {

	@Autowired
	private  ProductMasterService productMasteService;
	@RequestMapping(value = { "/add", "/update" }, consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.MULTIPART_FORM_DATA_VALUE }, produces = {
					MediaType.APPLICATION_JSON_VALUE }, method = { RequestMethod.POST, RequestMethod.PUT })
	public ResponseEntity<Map<String, Object>> addOrUpdate(HttpServletRequest request,
			@RequestPart Product object, @RequestPart(required = false) MultipartFile[] files) {
		return new ResponseEntity<Map<String, Object>>(this.productMasteService.addOrUpdateLeadSource(request ,object, files), HttpStatus.OK);

	}

	@GetMapping(value = "/getById/{producId}/{moduleId}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getById(@PathVariable("producId") Long producId,@PathVariable(value = "moduleId", required = true) Long moduleId) {
		return ResponseEntity.ok(this.productMasteService.getProductById(producId, false));
	}

	
	@GetMapping(value = "/getSelectionList", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getSelectionList() {
		return ResponseEntity.ok(this.productMasteService.getSelectionList(false));
	}

	@GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> getList(HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> params){
		return ResponseEntity.ok(this.productMasteService.getFilteredList(httpServletRequest,params));
	}
}
