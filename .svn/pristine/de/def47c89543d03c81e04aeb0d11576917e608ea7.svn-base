package com.sterp.multitenant.tenant.core.repository;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDto;
import com.sterp.multitenant.tenant.entity.State;

@Repository
public interface StatesRepository extends JpaRepository<State, Integer> {
	@Query(value = "SELECT new com.sterp.multitenant.tenant.dto.CommonDropdownResponseDto(st.id,st.stateName)"
			+ " from com.sterp.multitenant.tenant.entity.State st join st.country where st.country.id=:countryId and st.status=:status")
	List<CommonDropdownResponseDto> findActiveDataCommonDropDownListByCountryId(int countryId, Long status);

	@Query(value = "SELECT new com.sterp.multitenant.tenant.dto.CommonDropdownResponseDto(st.id,st.stateName)"
			+ " from com.sterp.multitenant.tenant.entity.State st join st.country where st.status=:status")
	List<CommonDropdownResponseDto> findActiveDataCommonDropDownList(Long status);
	@Query("SELECT s FROM com.sterp.multitenant.tenant.entity.State s WHERE s.id IN :stateId")
	 Set<com.sterp.multitenant.tenant.entity.State> getAllStateById(List<Integer> stateId);
}
