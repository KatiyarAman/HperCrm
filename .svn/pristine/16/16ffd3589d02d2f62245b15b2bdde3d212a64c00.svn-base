package com.sterp.multitenant.tenant.leadsource.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.leadsource.entity.LeadSource;

public interface LeadSourceRepository extends JpaRepository<LeadSource,Long> {
@Query(value="SELECT new com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject(l.id,l.leadSource)"
			+ " From com.sterp.multitenant.tenant.leadsource.entity.LeadSource l where l.status = 2 ORDER BY l.leadSource")
	List<CommonDropdownResponseDataTravelObject> getSelectionList();

	@Query(value ="Select e from com.sterp.multitenant.tenant.leadsource.entity.LeadSource e where e.leadSource=:name")
    LeadSource findByLeadSource(String name);

}
