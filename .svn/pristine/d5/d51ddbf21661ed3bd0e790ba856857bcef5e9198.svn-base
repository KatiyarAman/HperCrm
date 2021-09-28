package com.sterp.multitenant.tenant.productmaster.service.impl;

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
import com.sterp.multitenant.tenant.product.Product;
import com.sterp.multitenant.tenant.productmaster.repository.ProductMasterRepository;
import com.sterp.multitenant.tenant.productmaster.service.ProductMasterService;

@Service
public class ProductMasterServiceImpl implements ProductMasterService {
	@Autowired
	private AppService appService;
	@Autowired
	private CommonService commonService;

	@Autowired
	private ProductMasterRepository productMasterRepository;

	@Override
	public Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, Product object,
			MultipartFile[] files) {
		Map<String, Object> response = new HashMap<String, Object>();
		UserEntity currentUser = appService.getCurrentUser();
		if(object.getId() == null) {
			object.setCreatedBy(currentUser.getId());
		}
		object.setModifiedBy(currentUser.getId());
		object.setCompanyId(currentUser.getCompanyId());
		object.setBranchId(currentUser.getBranchId());
		request.setAttribute("moduleId", request.getHeader("moduleId"));
		response.put("data", this.commonService.addUpdate(request, object, files));
		return response;
	}

	@Override
	public Product getProductById(Long producId, boolean b) {
		Product product = productMasterRepository.findById(producId).get();
		if (product != null) {
			return product;
		}
		return null;
	}

	@Override
	public Map<String, Object> getSelectionList(boolean b) {
		Map<String, Object> response = new HashMap<String, Object>();
		List<CommonDropdownResponseDataTravelObject> products = productMasterRepository.getSelectionList();
		if (products.size() == 0) {
			throw new ResourceNotFoundException("No Active Products found");
		}
		response.put("data", products);
		return response;
	}

	@Override
	public Map<String, Object> getFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params) {
		Map<String, Object> response = new HashMap<String, Object>();
		params.put("module_id", Long.parseLong(httpServletRequest.getHeader("moduleId")));
		response.put("data",this.commonService.getCommonFilteredList(Product.class, params));
		return response;
	}

}
