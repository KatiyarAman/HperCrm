package com.sterp.multitenant.tenant.leadchecklist.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.leadchecklist.LeadCheckList;

public interface LeadCheckListRepository extends JpaRepository<LeadCheckList, Long> {
	
	@Query(value = "SELECT new com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject(l.id,l.checklistPoint)"
			+ "FROM com.sterp.multitenant.tenant.leadchecklist.LeadCheckList l where l.status = 2 ORDER BY l.checklistPoint")
	List<CommonDropdownResponseDataTravelObject> getSelectionList();

}
