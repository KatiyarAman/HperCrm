package com.sterp.multitenant.tenant.core.services;

import java.util.Map;

import com.sterp.multitenant.tenant.entity.City;


public interface CityServices {
	public Map<String, Object> getActiveCityListByStateIdInCommonDropdown(Integer stateId,Integer currentStateId,Integer permanentStateId, boolean iscacheable);

	public City getCityById(int cityId, boolean iscacheable);
}
