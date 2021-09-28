package com.sterp.multitenant.tenant.exceltemplate.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.uploadutility.dto.ExcelResponse;
import com.sterp.multitenant.tenant.uploadutility.entity.ExcelTemplate;

public interface ExcelTemplateService {

	public Map<String, Object> addOrUpdateCompany(HttpServletRequest request, ExcelTemplate object, MultipartFile[] files);

	public ExcelTemplate getById(Long id);

	public Map<String, Object> getSelectionList(boolean iscacheable, Long moduleId);

	public Map<String, Object> getTemplateList(Map<String, Object> params);

	public List<ExcelResponse> processTemplate(MultipartFile files) throws IOException;

	public Map<String, Object> getAll(boolean b, Long moduleId);

}
