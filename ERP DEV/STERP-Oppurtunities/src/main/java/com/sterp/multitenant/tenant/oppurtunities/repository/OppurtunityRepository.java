package com.sterp.multitenant.tenant.oppurtunities.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.oppurtunities.Oppurtunity;

public interface OppurtunityRepository extends JpaRepository<Oppurtunity, Long> {
	@Query(value = "SELECT new com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject(o.id,o.oppurtunity)"
			+ "FROM com.sterp.multitenant.tenant.oppurtunities.Oppurtunity o where o.status = 2 ORDER BY o.oppurtunity")
	List<CommonDropdownResponseDataTravelObject> getSelectionList();

}
