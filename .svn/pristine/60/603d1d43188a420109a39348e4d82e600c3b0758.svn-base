package com.sterp.multitenant.tenant.company.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.company.dto.CompanyDTO;
import com.sterp.multitenant.tenant.company.entity.Company;

public interface CompanyService {
	public Long getCount();

	public Map<String, Object> addOrUpdateCompany(HttpServletRequest request ,Company company, MultipartFile[] files);

	public Map<String, Object> getActiveCompanies(String wildCard); 

	public Company getCompnayById(Long id,Long moduleId);

	public Map<String, Object> getCompanyList(Map<String, Object> params);

	public Resource download(Long id, Long vid);
}
