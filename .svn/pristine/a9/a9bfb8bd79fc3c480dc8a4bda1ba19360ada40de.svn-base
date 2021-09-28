package com.sterp.multitenant.tenant.compaign.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.campaign.Campaign;
import com.sterp.multitenant.tenant.common.service.CommonService;
import com.sterp.multitenant.tenant.compaign.repository.CampaignRepository;
import com.sterp.multitenant.tenant.compaign.service.CampaignService;
import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.dto.CommonPagingResponse;
import com.sterp.multitenant.tenant.exceptionhandler.ResourceNotFoundException;
@Service
public class CampaignServiceImpl implements CampaignService{
	
	@Autowired
	private CommonService commonService;
	@Autowired
	private CampaignRepository campaignRepository;
	@Override
	public Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, Campaign object, MultipartFile[] files) {
		Map<String,Object> response=new HashMap<String, Object>();
		request.setAttribute("moduleId", request.getHeader("moduleId"));
		response.put("data",this.commonService.addUpdate(request, object, files));
		return response;
	}
	@Override
	public Campaign getCampaignById(Long campaignId, boolean b) {
		Campaign campaign=campaignRepository.findById(campaignId).get();
		if(campaign!=null) {
			return campaign;
		}
		return null;
	}
	@Override
	public Map<String, Object> getSelectionList(boolean b) {
		Map<String,Object> response=new HashMap<String, Object>();
		List<CommonDropdownResponseDataTravelObject> campaigns=campaignRepository.getSelectionList();
		if(campaigns.size() == 0 ) {
			throw new ResourceNotFoundException("No Active LeadSources found");	
			}
		response.put("data", campaigns);
		return response;
	}
	@Override
	public Map<String, Object> getFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params) {
		Map<String, Object> response = new HashMap<String, Object>();
		params.put("module_id", Long.parseLong(httpServletRequest.getHeader("moduleId")));
		CommonPagingResponse<Campaign> campaign = this.commonService.getCommonFilteredList(Campaign.class, params);
		response.put("data",campaign);
		return response;
	}
	@Override
	public Map<String, Object> uploadFile(Map<String, Object> object, MultipartFile[] files,
			HttpServletRequest request) throws SerialException, SQLException {
		// TODO Auto-generated method stub
		Campaign campaign = new Campaign();
		return this.commonService.uploadData(object,files,request,campaign);
	}
	@Override
	public Map<String, Object> moduleDocuments(Map<String, Object> object, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return this.commonService.moduleDocuments(object,request);
	}
}
