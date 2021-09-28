package com.sterp.multitenant.tenant.followup.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.followup.entity.EventManagement;

@Repository
public interface EventRepository extends JpaRepository<EventManagement, Long>{

	@Query(value="SELECT new com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject(f.id,f.eventTitle)"
			+" From com.sterp.multitenant.tenant.followup.entity.EventManagement f ORDER BY f.eventTitle  ")
	List<CommonDropdownResponseDataTravelObject> getSelectionList();

	@Query(value="From com.sterp.multitenant.tenant.followup.entity.EventManagement WHERE moduleId=:moduleId and refDoc=:refDoc ORDER BY createdDate Desc  ")
	List<EventManagement> getCustomFilterList(Long moduleId,Long refDoc);
	@Query(value="From com.sterp.multitenant.tenant.followup.entity.EventManagement WHERE moduleId=:moduleId and refDoc=:refDoc and id<:id ORDER BY createdDate Desc  ")
	List<EventManagement> getCustomFilterList(Long moduleId, Long refDoc, Long id);

}
