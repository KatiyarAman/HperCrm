package com.sterp.multitenant.tenant.quotations.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.quotations.Quotation;

public interface QuotationRepository extends JpaRepository<Quotation,Long> {
@Query(value="SELECT new com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject(q.id,q.quotation)"
+"FROM com.sterp.multitenant.tenant.quotations.Quotation q where q.status = 2 ORDER BY q.quotation")
	List<CommonDropdownResponseDataTravelObject> getSelectionList();

}
