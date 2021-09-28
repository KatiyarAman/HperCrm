package com.sterp.multitenant.tenant.productmaster.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.product.Product;

public interface ProductMasterService {

	Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, Product object, MultipartFile[] files);

	Product getProductById(Long producId, boolean b);

	Map<String,Object> getSelectionList(boolean b);

	Map<String,Object> getFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params);

}
