package com.sterp.multitenant.tenant.compaign.service;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialException;

import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.campaign.Campaign;

public interface CampaignService {

	Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, Campaign object, MultipartFile[] files);

	Campaign getCampaignById(Long campaignId, boolean b);

	Map<String,Object> getSelectionList(boolean b);

	Map<String,Object> getFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params);

	Map<String,Object> uploadFile(Map<String, Object> object, MultipartFile[] files, HttpServletRequest request) throws SerialException, SQLException;

	Map<String,Object> moduleDocuments(Map<String, Object> object, HttpServletRequest request);

}
