package com.sterp.multitenant.tenant.quotations.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.common.service.CommonService;
import com.sterp.multitenant.tenant.core.services.AppService;
import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.entity.UserEntity;
import com.sterp.multitenant.tenant.exceptionhandler.ResourceNotFoundException;
import com.sterp.multitenant.tenant.quotations.Quotation;
import com.sterp.multitenant.tenant.quotations.repository.QuotationRepository;
import com.sterp.multitenant.tenant.quotations.service.QuotationService;

@Service
public class QuotationServiceImpl implements QuotationService{
@Autowired
private AppService appService;
@Autowired
private CommonService commonService;
@Autowired
private QuotationRepository quotationRepository;
	@Override
	public Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, Quotation object,
			MultipartFile[] files) {
		Map<String,Object> response=new HashMap<String, Object>();
		UserEntity currentUser = appService.getCurrentUser();
		if(object.getId() == null) {
			object.setCreatedBy(currentUser.getId());
		}
		object.setModifiedBy(currentUser.getId());
		object.setCompanyId(currentUser.getCompanyId());
		object.setBranchId(currentUser.getBranchId());
		response.put("data",this.commonService.addUpdate(request, object, files));
		return response;
	}

	@Override
	public Quotation getQuotationById(Long quotationId, boolean b) {
		Quotation quotation=quotationRepository.findById(quotationId).get();
		if(quotation !=null) {
			return quotation;
		}
		return null;
	}

	@Override
	public Map<String, Object> getSelectionList(boolean b) {
		Map<String,Object> response=new HashMap<String, Object>();
		List<CommonDropdownResponseDataTravelObject> quotations=quotationRepository.getSelectionList();
		if(quotations.size() == 0 ) {
			throw new ResourceNotFoundException("No Active LeadSources found");	
			}
		response.put("data", quotations);
		return response;
	}

	@Override
	public Map<String, Object> getFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params) {
		Map<String,Object> response=new HashMap<String, Object>();
		params.put("module_id", Long.parseLong(httpServletRequest.getHeader("moduleId")));	
		response.put("data",this.commonService.getCommonFilteredList(Quotation.class, params));
		return response;
	}

}
