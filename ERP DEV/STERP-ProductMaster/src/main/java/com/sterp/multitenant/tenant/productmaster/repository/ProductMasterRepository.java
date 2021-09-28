package com.sterp.multitenant.tenant.productmaster.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.product.Product;

public interface ProductMasterRepository extends JpaRepository<Product, Long> {
	@Query(value = "SELECT new com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject(p.id,p.productName)"
			+ "FROM com.sterp.multitenant.tenant.product.Product p where p.status = 2 ORDER BY p.productName")
	List<CommonDropdownResponseDataTravelObject> getSelectionList();

}
