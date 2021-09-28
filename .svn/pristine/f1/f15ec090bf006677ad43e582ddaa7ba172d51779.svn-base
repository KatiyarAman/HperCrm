package com.sterp.multitenant.tenant.customer.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.customer.Customer;

public interface CustomerService {

	Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, Customer object, MultipartFile[] files);

	Customer getCustomerById(Long customerId, boolean b);

	Map<String,Object> getSelectionList(boolean b);

	Customer getCustomerByName(String name, boolean b);


}
