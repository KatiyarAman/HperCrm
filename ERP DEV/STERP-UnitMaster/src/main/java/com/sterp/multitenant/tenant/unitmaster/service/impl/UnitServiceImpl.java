package com.sterp.multitenant.tenant.unitmaster.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.common.service.CommonService;
import com.sterp.multitenant.tenant.core.services.AppService;
import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.exceptionhandler.ResourceNotFoundException;
import com.sterp.multitenant.tenant.unitmaster.Unit;
import com.sterp.multitenant.tenant.unitmaster.repository.UnitRepository;
import com.sterp.multitenant.tenant.unitmaster.service.UnitService;
@Service
public class UnitServiceImpl implements UnitService{
	@Autowired
	private AppService appService;
	@Autowired
	private CommonService commonService;
	@Autowired
	private UnitRepository unitRepository;
	@Override
	public Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, Unit object, MultipartFile[] files) {
		Map<String,Object> response=new HashMap<String, Object>();
		request.setAttribute("moduleId", request.getHeader("moduleId"));
		response.put("data", this.commonService.addUpdate(request, object, files));
		return response;
	}
	@Override
	public Unit getUnitById(Long unitId, boolean b) {
		Unit unit=unitRepository.findById(unitId).get();
		if(unit!=null) {
			return unit;
		}
		return null;
	}
	@Override
	public Map<String, Object> getSelectionList(boolean b) {
		Map<String,Object> response=new HashMap<String, Object>();
		List<CommonDropdownResponseDataTravelObject> units=unitRepository.getSelectionList();
		if(units.size() == 0 ) {
			throw new ResourceNotFoundException("No Active Units found");	
			}
		response.put("data", units);
		return response;
	}

}
