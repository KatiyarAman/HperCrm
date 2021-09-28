package com.sterp.multitenant.tenant.unitmaster.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.unitmaster.Unit;

public interface UnitService {

	Map<String, Object> addOrUpdateLeadSource(HttpServletRequest request, Unit object, MultipartFile[] files);

	Unit  getUnitById(Long unitId, boolean b);

	Map<String,Object> getSelectionList(boolean b);

}
