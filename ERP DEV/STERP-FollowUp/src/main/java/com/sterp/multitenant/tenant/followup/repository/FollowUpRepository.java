package com.sterp.multitenant.tenant.followup.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.followup.entity.FollowUps;

public interface FollowUpRepository extends JpaRepository<FollowUps,Long>{
	@Query(value="SELECT new com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject(f.id,f.followupCode)"
			+" From com.sterp.multitenant.tenant.followup.entity.FollowUps f ORDER BY f.followupCode  ")
	List<CommonDropdownResponseDataTravelObject> getSelectionList();

	@Query(value="From com.sterp.multitenant.tenant.followup.entity.FollowUps WHERE moduleId=:moduleId and refDoc=:refDoc ORDER BY createdDate Desc  ")
	List<FollowUps> getCustomFilterList(Long moduleId,Long refDoc);
	@Query(value="From com.sterp.multitenant.tenant.followup.entity.FollowUps WHERE moduleId=:moduleId and refDoc=:refDoc and id<:id ORDER BY createdDate Desc  ")
	List<FollowUps> getCustomFilterList(Long moduleId, Long refDoc, Long id);
}
