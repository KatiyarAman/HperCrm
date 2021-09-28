package com.sterp.multitenant.tenant.leads.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.branch.entity.ContactDetails;
import com.sterp.multitenant.tenant.common.service.CommonService;
import com.sterp.multitenant.tenant.core.services.AppService;
import com.sterp.multitenant.tenant.customer.Customer;
import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.employee.entity.Employee;
import com.sterp.multitenant.tenant.entity.UserEntity;
import com.sterp.multitenant.tenant.exceptionhandler.ResourceNotFoundException;
import com.sterp.multitenant.tenant.followup.entity.FollowUps;
import com.sterp.multitenant.tenant.leads.Lead;
import com.sterp.multitenant.tenant.leads.repository.LeadRepository;
import com.sterp.multitenant.tenant.leads.service.LeadService;
import com.sterp.multitenant.tenant.product.Product;
import com.sterp.multitenant.tenant.uploadutility.dto.ExcelResponse;
import com.sterp.multitenant.tenant.uploadutility.entity.Documents;

@Service
public class LeadServiceImpl implements LeadService {
	@Autowired
	private AppService appService;
	@Autowired
	private CommonService commonService;
	@Autowired
	private LeadRepository leadRepository;
	
	

	@Override
	public Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, Lead object, MultipartFile[] files) {
		Map<String, Object> response = new HashMap<String, Object>();
		UserEntity currentUser = appService.getCurrentUser();
		if(object.getId() == null) {
			object.setCreatedBy(currentUser.getId());
		}
		object.setModifiedBy(currentUser.getId());
		object.setCompanyId(currentUser.getCompanyId());
		object.setBranchId(currentUser.getBranchId());
		if(object.getCustomerType() == 2) {
			Customer customer = this.commonService.getById(Customer.class, object.getCustomerId());
			object.setCustomerName(customer.getCustomerName());
			customer.setContactDetails(object.getContactDetails());
			customer.setCustomerAddress(object.getCustomerAddress());
			customer.setCityId(object.getCityId());
			customer.getContactDetails().forEach(c->{
				c.setModuleId(223L);
				c.setModifiedBy(currentUser.getId());
				if(c.getId()==null) {
					c.setStatus(2L);
					c.setCreatedBy(currentUser.getId());
				}
			});
			object.setContactDetails(new ArrayList<ContactDetails>());
			MultipartFile[] filex = null;
			request.setAttribute("moduleId", 223);
			this.commonService.addUpdate(request, customer, filex);
		}else {
			Customer customer = new Customer();
			customer.setCustomerName(object.getCustomerName());
			customer.setContactDetails(object.getContactDetails());
			customer.setCustomerAddress(object.getCustomerAddress());
			customer.setCityId(object.getCityId());
			customer.setStatus(2L);
			customer.getContactDetails().forEach(c->{
				c.setModuleId(223L);
				c.setModifiedBy(currentUser.getId());
				if(c.getId()==null) {
					c.setStatus(2L);
					c.setCreatedBy(currentUser.getId());
				}
			});
			object.setContactDetails(new ArrayList<ContactDetails>());
			MultipartFile[] filex = null;
			request.setAttribute("moduleId", 223);
			Map<String, Object> custRe = new HashMap<String, Object>();
			custRe = this.commonService.addUpdate(request, customer, filex);
			Customer t = new Customer();
			for (Map.Entry<String, Object> entry : custRe.entrySet()) {
				if (((String) entry.getKey()).contains("data")) {
					t = (Customer) entry.getValue();
				}
			}
			object.setCustomerType(2L);
			object.setCustomerId(t.getId());
		}
		
		if(object.getAssignUser()!=null && object.getAssignUser().size()>0) {
			Set<Employee> employeeSet=new HashSet<Employee>();
			for(Long  employeeId:object.getAssignUser()) {
				Employee employee=this.commonService.getById(Employee.class, employeeId);
				if(employee!=null) {
					employeeSet.add(employee);
				}
			}
			object.setEmloyee(employeeSet);
			//Set<Employee> employeeList=this.commonService.getCommonListByNativeQuery()
		}
		
		if(object.getProductIds()!=null && object.getProductIds().size()>0) {
			Set<Product> productSet=new HashSet<Product>();
			for(Long  productId:object.getProductIds()) {
				Product employee=this.commonService.getById(Product.class, productId);
				if(employee!=null) {
					productSet.add(employee);
				}
			}
			object.setProduct(productSet);
			//Set<Employee> employeeList=this.commonService.getCommonListByNativeQuery()
		}
		request.setAttribute("moduleId", request.getHeader("moduleId"));
		response.put("data", this.commonService.addUpdate(request, object, files));
		return response;
	}

	@Override
	public Lead getLeadById(Long leadId, Long moduleId, boolean b) {
		Lead lead = leadRepository.findById(leadId).get();
		List<Long> empIds = lead.getEmloyies().stream().map(m -> m.getId()).collect(Collectors.toList());
		List<Documents> documents = this.commonService.getDocuments(leadId,moduleId);
		lead.setDocuments(documents);
		List<Long> proIds = lead.getProduct().stream().map(m -> m.getId()).collect(Collectors.toList());
		lead.setAssignUser(empIds);
		lead.setProductIds(proIds);
		if (lead != null) {
			return lead;
		}
		return null;
	}

	@Override
	public Map<String, Object> getSelectionList(boolean b) {
		Map<String, Object> response = new HashMap<String, Object>();
		List<CommonDropdownResponseDataTravelObject> leads = leadRepository.getSelectionList();
		if (leads.size() == 0) {
			throw new ResourceNotFoundException("No Active Leads found");
		}
		response.put("data", leads);
		return response;
	}

	@Override
	public Map<String, Object> getFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params) {
		Map<String, Object> response = new HashMap<String, Object>();
		params.put("module_id", Long.parseLong(httpServletRequest.getHeader("moduleId")));
		response.put("data",this.commonService.getCommonFilteredList(Lead.class, params));
		return response;
	}

	@Override
	public List<ExcelResponse> processTemplate(MultipartFile files) throws IOException {
		String fileName = files.getOriginalFilename();
		return this.commonService.callReadFile(files, fileName);
	}

	@Override
	public Lead getLeadByName(String name, boolean b) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Resource download(Long id, Long vid) {
		// TODO Auto-generated method stub
		return this.commonService.download(id, vid);
	}

}
