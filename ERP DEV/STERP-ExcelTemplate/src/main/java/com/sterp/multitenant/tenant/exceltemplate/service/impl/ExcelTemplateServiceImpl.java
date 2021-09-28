package com.sterp.multitenant.tenant.exceltemplate.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.common.service.CommonService;
import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.exceltemplate.repository.ExcelTemplateLinesRepository;
import com.sterp.multitenant.tenant.exceltemplate.repository.ExcelTemplateRepository;
import com.sterp.multitenant.tenant.exceltemplate.service.ExcelTemplateService;
import com.sterp.multitenant.tenant.exceptionhandler.ResourceNotFoundException;
import com.sterp.multitenant.tenant.uploadutility.dto.ExcelResponse;
import com.sterp.multitenant.tenant.uploadutility.entity.ExcelTemplate;
import com.sterp.multitenant.tenant.uploadutility.entity.ExcelTemplateLines;

@Service
public class ExcelTemplateServiceImpl implements ExcelTemplateService {
	
	@Autowired
	private ExcelTemplateRepository excelRepo;
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private ExcelTemplateLinesRepository excelLineRepo;

	@Override
	public Map<String, Object> addOrUpdateCompany(HttpServletRequest request, ExcelTemplate object,
			MultipartFile[] files) {
		Map<String, Object> response = new HashedMap<String, Object>();
		if ( object.getId() ==null) {
			if (excelRepo.findByTemplateName(object.getTemplateName()) != null)
				throw new DuplicateKeyException("Template Already Exist!");
		}
		List<ExcelTemplateLines> lines = object.getExcelTemplateLines();
		object.setExcelTemplateLines(new ArrayList<ExcelTemplateLines>());
		request.setAttribute("moduleId", request.getHeader("moduleId"));
		response = commonService.addUpdate(request ,object,files);
		ExcelTemplate t = new ExcelTemplate();
		for (Map.Entry<String, Object> entry : response.entrySet()) {
			if (((String) entry.getKey()).contains("data")) {
				t = (ExcelTemplate) entry.getValue();
			}
		}
		for (ExcelTemplateLines excelTemplateLines : lines) {
			excelTemplateLines.setExcelTemplateId(t.getId());
			this.excelLineRepo.save(excelTemplateLines);
//			commonService.addUpdate(request,excelTemplateLines,files);
		}
		return response;
	}

	@Override
	public ExcelTemplate getById(Long id) {
		ExcelTemplate excelTemplate = this.excelRepo.findById(id).get();
		return excelTemplate;
	}

	@Override
	public Map<String, Object> getSelectionList(boolean iscacheable, Long moduleId) {
		Map<String, Object> response = new HashedMap<String, Object>();
		List<CommonDropdownResponseDataTravelObject> type = (moduleId == null)
				? this.excelRepo.getSelectionList(2L)
				: this.excelRepo.getSelectionListByModuleId(2L, moduleId);
		if (type.size() == 0) {
			throw new ResourceNotFoundException("No Active Area found");
		}
		response.put("data", type);
		return response;
	}

	@Override
	public Map<String, Object> getTemplateList(Map<String, Object> params) {
		Map<String, Object> response = new HashMap<String, Object>();
		response.put("data", this.commonService.getCommonFilteredList(ExcelTemplate.class, params));
		return response;
	}

	@Override
	public List<ExcelResponse> processTemplate(MultipartFile files) throws IOException {
		
		String fileName = files.getOriginalFilename();
			return this.commonService.callReadFile(files, fileName);
//		throw new CustomException("No project is assigned to you. Please contact system administrator");
	}

	@Override
	public Map<String, Object> getAll(boolean b, Long moduleId) {
		// TODO Auto-generated method stub
		Map<String, Object> response = new HashedMap<String, Object>();
		response.put("data", this.excelRepo.findByModuleId(moduleId));
		return response;
	}

}
