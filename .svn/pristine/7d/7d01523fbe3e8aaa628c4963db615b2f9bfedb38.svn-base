package com.sterp.multitenant.tenant.core.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDto;
import com.sterp.multitenant.tenant.entity.City;

@Repository
public interface CitiesRepository extends JpaRepository<City, Integer> {
	@Query(value = "SELECT new com.sterp.multitenant.tenant.dto.CommonDropdownResponseDto(city.id,city.cityName)"
			+ " from com.sterp.multitenant.tenant.entity.City city join city.state where city.state.id=:stateId and city.status=:status")
	List<CommonDropdownResponseDto> findActiveDataCommonDropDownListByStateId(int stateId, Long status);
	
	@Query(value = "SELECT new com.sterp.multitenant.tenant.dto.CommonDropdownResponseDto(city.id,city.cityName)"
			+ " from com.sterp.multitenant.tenant.entity.City city join city.state where city.status=:status")
	List<CommonDropdownResponseDto> findActiveDataCommonDropDownList(Long status);

	List<City> findAllByStatus(Long status);
}