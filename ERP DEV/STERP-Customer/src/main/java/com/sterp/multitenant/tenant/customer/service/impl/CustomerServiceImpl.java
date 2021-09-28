package com.sterp.multitenant.tenant.customer.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.common.service.CommonService;
import com.sterp.multitenant.tenant.core.services.AppService;
import com.sterp.multitenant.tenant.customer.Customer;
import com.sterp.multitenant.tenant.customer.repository.CustomerRepository;
import com.sterp.multitenant.tenant.customer.service.CustomerService;
import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.exceptionhandler.ResourceNotFoundException;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private AppService appService;
	@Autowired
	private CommonService commonService;
	@Autowired
	private CustomerRepository customerRepository;

	@Override
	public Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, Customer object,
			MultipartFile[] files) {
		Map<String, Object> response = new HashMap<String, Object>();
		object.getBankAccounts().forEach(x->{
			x.setModuleId(Long.parseLong(request.getHeader("moduleId")));
			if(x.getId() == null) {
				x.setStatus(2L);
				x.setCreatedBy(appService.getCurrentUser().getId());
			}
			x.setModifiedBy(appService.getCurrentUser().getId());
		});
		object.getContactDetails().forEach(x->{
			x.setModuleId(Long.parseLong(request.getHeader("moduleId")));
			if(x.getId() == null) {
				x.setStatus(2L);
				x.setCreatedBy(appService.getCurrentUser().getId());
			}
			x.setModifiedBy(appService.getCurrentUser().getId());
		});
		request.setAttribute("moduleId", request.getHeader("moduleId"));
		response.put("data", this.commonService.addUpdate(request, object, files));
		return response;
	}

	@Override
	public Customer getCustomerById(Long customerId, boolean b) {
		Customer customer = customerRepository.findById(customerId).get();
		if (customer != null) {
			return customer;
		}
		return null;
	}

	@Override
	public Map<String, Object> getSelectionList(boolean b) {
		Map<String, Object> response = new HashMap<String, Object>();
		List<CommonDropdownResponseDataTravelObject> customers = customerRepository.getSelectionList();
		if (customers.size() == 0) {
			throw new ResourceNotFoundException("No Active Customers Found");
		}
		response.put("data", customers);
		return response;
	}

	@Override
	public Customer getCustomerByName(String name, boolean b) {
		Customer customer = customerRepository.findByCustomerName(name);
		if (customer != null) {
			return customer;
		}
		return null;
	}

}
