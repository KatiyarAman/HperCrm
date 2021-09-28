package com.sterp.multitenant.tenant.core.services.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.sterp.multitenant.tenant.core.repository.StatesRepository;
import com.sterp.multitenant.tenant.core.services.StateServices;
import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDto;
import com.sterp.multitenant.tenant.entity.State;
import com.sterp.multitenant.tenant.exceptionhandler.ResourceNotFoundException;

@Service
public class StateServicesImpl implements StateServices {

	@Autowired
	StatesRepository stateRepository;

	@CacheEvict(value = "core-list-cache", key = "'coreListCacheState'+#id", condition = "#iscacheable ==null && #iscacheable", beforeInvocation = true)
	@Cacheable(value = "core-list-cache", key = "'coreListCacheState'+#id", condition = "#iscacheable !=null && #iscacheable")
	@Override
	public Map<String, Object> getActiveStateListByCountrtIdInCommonDropdown(Integer id,Integer currentCountryId,Integer permanentCountryId, boolean iscacheable) {
		List<CommonDropdownResponseDto> states = (id == null)
				? (currentCountryId == null) ? (permanentCountryId == null) ? this.stateRepository.findActiveDataCommonDropDownList(1L)
				: this.stateRepository.findActiveDataCommonDropDownListByCountryId(permanentCountryId, 1L) :
					this.stateRepository.findActiveDataCommonDropDownListByCountryId(currentCountryId, 1L) : 
						this.stateRepository.findActiveDataCommonDropDownListByCountryId(id, 1L)  ;
		;
		if (states.size() == 0) {
			throw new ResourceNotFoundException("states not found for country id: " + id);
		}
		Map<String, Object> response = new HashedMap<String, Object>();
		response.put("data", states);
		return response;
	}

	@Override
	public State getStateById(int id, boolean b) {
		Map<String, Object> response = new HashedMap<String, Object>();
		response.put("data", this.stateRepository.findById(id));
		
		
		return this.stateRepository.findById(id).orElseThrow(() -> new RuntimeException("No state found"));
	}

}
