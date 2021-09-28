package com.sterp.multitenant.tenant.leads.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.leads.Lead;

public interface LeadRepository extends JpaRepository<Lead,Long> {

	@Query(value="SELECT new com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject(l.id,l.enquiry)"
			+ " FROM com.sterp.multitenant.tenant.leads.Lead l WHERE status IN (4,20,21,22,23,24,25,26,27,28,29,30) ORDER BY l.enquiry ")
	List<CommonDropdownResponseDataTravelObject> getSelectionList();

}
