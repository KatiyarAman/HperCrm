package com.sterp.multitenant.tenant.customer.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sterp.multitenant.tenant.customer.Customer;
import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
	@Query(value = "SELECT New com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject(c.id,c.customerName)"
			+ " FROM com.sterp.multitenant.tenant.customer.Customer c where c.status =2 ORDER BY c.customerName")
	List<CommonDropdownResponseDataTravelObject> getSelectionList();

	@Query(value="SELECT e from com.sterp.multitenant.tenant.customer.Customer e where e.customerName=:name")
	Customer findByCustomerName(String name);

}
