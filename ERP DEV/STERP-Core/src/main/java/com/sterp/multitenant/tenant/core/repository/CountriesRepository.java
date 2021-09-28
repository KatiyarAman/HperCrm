package com.sterp.multitenant.tenant.core.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDto;
import com.sterp.multitenant.tenant.entity.Country;

@Repository
public interface CountriesRepository extends JpaRepository<Country, Integer> {
	@Query(value = "SELECT new com.sterp.multitenant.tenant.dto.CommonDropdownResponseDto(ctry.id,ctry.countryName)"
			+ " from com.sterp.multitenant.tenant.entity.Country ctry where ctry.status=:status")
	List<CommonDropdownResponseDto> findActiveDataCommonDropDownList(Long status);
}
