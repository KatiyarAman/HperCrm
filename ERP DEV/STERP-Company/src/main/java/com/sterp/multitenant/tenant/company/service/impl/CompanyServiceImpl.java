package com.sterp.multitenant.tenant.company.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.common.service.CommonService;
import com.sterp.multitenant.tenant.company.dto.CompanyDTO;
import com.sterp.multitenant.tenant.company.entity.Company;
import com.sterp.multitenant.tenant.company.repository.CompanyRepository;
import com.sterp.multitenant.tenant.company.service.CompanyService;
import com.sterp.multitenant.tenant.core.services.AppService;
import com.sterp.multitenant.tenant.core.services.ScreenFilterService;
import com.sterp.multitenant.tenant.entity.UserEntity;
import com.sterp.multitenant.tenant.uploadutility.entity.Documents;
import com.sterp.multitenant.tenant.uploadutility.service.DocumentUploadService;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	CompanyRepository companyRepository;

	@Autowired
	AppService appService;

	@Autowired
	CommonService commonService;

	@Autowired
	ScreenFilterService screenFilterService;

	@Autowired
	ModelMapper modelMapper;
	
	@Autowired
	DocumentUploadService documentUploadService;

	@Override
	public Long getCount() {
		return this.companyRepository.count();
	}

	@Override
	public Map<String, Object> addOrUpdateCompany(HttpServletRequest request ,Company company, MultipartFile[] files) {
		Map<String, Object> response = new HashedMap<String, Object>();
//		long moduleId = Long.parseLong(request.getHeader("moduleId"));
		UserEntity currentUser = this.appService.getCurrentUser();
//		
//		Long defaultLoginBranch  = Long.valueOf((Integer) request.getAttribute("defaultloginbranch"));
//		Long defaultCompanyId = commonService.getById(Branch.class, defaultLoginBranch).getCompanyId();
//		
//		
//		company.setCreatedBy(currentUser.getId());
//		company.setModifiedBy(currentUser.getId());
//		company.setBranchId(defaultLoginBranch);
//		company.setCompanyId(defaultCompanyId);
//		
//		response.put("data", this.companyRepository.save(company));
//		response.put("message",
//				company.getId() == null ? "Company Added Successfully" : "Company Updated Successfully");
//		if (company.getDocuments().size() != 0) {
//			// get consolidated data as passing parameter with corresponding to current
//			// logged in branch
//			// Note: The information of current logged in branch will be executed if uploads
//			// are performed other than the company and branch module
//			BranchResponse branchResponse = this.appService.getBranchCompanyByDefaultLoggedInBranch(request);
//			this.documentUploadService.uploadDocuments(company.getDocuments(), files, new IfDefaultLoggedInData(defaultCompanyId, defaultLoginBranch,
//					branchResponse.getCompanyName(), branchResponse.getBranchName(),
//					this.appService.getCurrentUser().getId(), 0L), company.getId(), company.getCompanyName(),request);
//			
//
//		}
		request.setAttribute("moduleId", request.getHeader("moduleId"));
		if ( company.getId() ==null) {
			if (companyRepository.findByCompanyName(company.getCompanyName()) != null)
				throw new DuplicateKeyException("Company Already Exist!");
		}
		company.getBankAccounts().forEach(it->{
			it.setModuleId(Long.parseLong(request.getHeader("moduleId")));
			if(it.getId() ==null) {
				it.setStatus(2L);
				it.setCreatedBy(currentUser.getId());
			}
		 
			it.setModifiedBy(currentUser.getId());
			it.setCompanyId(currentUser.getCompanyId());
			it.setBranchId(currentUser.getBranchId());
		});
		response = commonService.addUpdate(request ,company,files);
		return response;
	}

	@Override
	public Map<String, Object> getActiveCompanies(String wildCard) {
//		String query = "where comp.address='" + wildCard + "'";
//		Map<String, Object> response = new HashedMap<String, Object>();
//		response.put("data", this.companyRepository.findCustomA(query));
		return null;
	}

	@Override
	public Company getCompnayById(Long id, Long moduleId) {
		
		Company company = this.companyRepository.findById(id).get();
		List<Documents> documents = this.commonService.getDocuments(id,moduleId);
		company.setDocuments(documents);
		
		CompanyDTO companyDto=this.modelMapper.map(company,CompanyDTO.class);
		return company;
	}

	@Override
	public Map<String, Object> getCompanyList(Map<String, Object> params){
		//UserEntity currentUser = this.appService.getCurrentUser();
		Map<String, Object> response = new HashMap<String, Object>();
		response.put("data", this.commonService.getCommonFilteredList(Company.class, params));
		return response;
	}

	@Override
	public Resource download(Long id,Long vid) {
		// TODO Auto-generated method stub
		return this.commonService.download(id,vid);
	}

}
