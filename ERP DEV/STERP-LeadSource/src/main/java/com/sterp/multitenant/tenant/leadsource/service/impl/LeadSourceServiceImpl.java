package com.sterp.multitenant.tenant.leadsource.service.impl;

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
import com.sterp.multitenant.tenant.leadsource.entity.LeadSource;
import com.sterp.multitenant.tenant.leadsource.repository.LeadSourceRepository;
import com.sterp.multitenant.tenant.leadsource.service.LeadSourceService;

@Service
public class LeadSourceServiceImpl implements LeadSourceService {

	@Autowired
	private AppService appService;
	@Autowired
	private CommonService commonService;
	@Autowired
	private LeadSourceRepository leadSourceRepository;

	@Override
	public Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, LeadSource leadSource,
			MultipartFile[] files) {
		UserEntity currentUser = appService.getCurrentUser();
		if(leadSource.getId() == null) {
			leadSource.setCreatedBy(currentUser.getId());
		}
		leadSource.setModifiedBy(currentUser.getId());
		leadSource.setCompanyId(currentUser.getCompanyId());
		leadSource.setBranchId(currentUser.getBranchId());
		Map<String,Object> response=new HashMap<String, Object>();
		request.setAttribute("moduleId", request.getHeader("moduleId"));
		response.put("data",this.commonService.addUpdate(request,leadSource,files));
		return response;
	}

	@Override
	public LeadSource getLeadSourceById(Long leadSourceId, boolean b) {
       LeadSource leadSource=leadSourceRepository.findById(leadSourceId).get();
       if(leadSource !=null) {
    	   return leadSource;
       }
		return null;
	}

	@Override
	public Map<String, Object> getSelectionList(boolean b) {
		
		Map<String,Object> response=new HashMap<String, Object>();
		List<CommonDropdownResponseDataTravelObject> leadSources=leadSourceRepository.getSelectionList();
		if(leadSources.size() == 0 ) {
			throw new ResourceNotFoundException("No Active LeadSources found");	
			}
		response.put("data", leadSources);
		return response;
		
	}

	@Override
	public Map<String, Object> getFilteredList(HttpServletRequest request,Map<String, Object> params) {
		Map<String,Object> response=new HashMap<String, Object>();
		params.put("module_id", Long.parseLong(request.getHeader("moduleId")));	
		response.put("data",this.commonService.getCommonFilteredList(LeadSource.class, params));
		return response;
	}

	@Override
	public LeadSource getLeadByName(String name, boolean b) {
		LeadSource leadSource=leadSourceRepository.findByLeadSource(name);
	       if(leadSource !=null) {
	    	   return leadSource;
	       }
			return null;
	}

}
