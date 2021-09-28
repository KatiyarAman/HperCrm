package com.sterp.multitenant.tenant.unitmaster.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.unitmaster.Unit;

public interface UnitRepository extends JpaRepository<Unit, Long> {
	@Query(value = "SELECT new com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject(u.id,u.unitName)"
			+ "From com.sterp.multitenant.tenant.unitmaster.Unit u where u.status = 2 ORDER BY u.unitName")
	List<CommonDropdownResponseDataTravelObject> getSelectionList();

}
