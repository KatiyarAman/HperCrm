package com.sterp.multitenant.tenant.quotations.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.quotations.Quotation;

public interface QuotationService {

	Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, Quotation object, MultipartFile[] files);

	Quotation getQuotationById(Long quotationId, boolean b);

	Map<String, Object> getSelectionList(boolean b);

	Map<String,Object> getFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params);

}
