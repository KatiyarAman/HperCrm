package com.sterp.multitenant.tenant.contactbook.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sterp.multitenant.tenant.branch.entity.ContactDetails;
import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;

public interface ContactBookRepository extends JpaRepository<ContactDetails, Long> {
	@Query(value = "SELECT new com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject(c.id,c.contactPerson)"
			+ " From com.sterp.multitenant.tenant.branch.entity.ContactDetails c where c.status = 2 ORDER BY c.contactPerson")
	List<CommonDropdownResponseDataTravelObject> getSelectionList();

	@Query(value="From com.sterp.multitenant.tenant.branch.entity.ContactDetails WHERE moduleId=:moduleId ORDER BY createdDate Desc  ")
	List<ContactDetails> getCustomFilterList(Long moduleId);
	
	@Query(value="From com.sterp.multitenant.tenant.branch.entity.ContactDetails WHERE moduleId=:moduleId and refId=:refDoc ORDER BY createdDate Desc  ")
	List<ContactDetails> getCustomFilterList(Long moduleId, Long refDoc);

}
