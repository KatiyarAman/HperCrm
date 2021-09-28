package com.sterp.multitenant.tenant.zone.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.entity.State;
import com.sterp.multitenant.tenant.entity.UserEntity;
import com.sterp.multitenant.tenant.core.repository.StatesRepository;
import com.sterp.multitenant.tenant.common.service.CommonService;
import com.sterp.multitenant.tenant.core.services.AppService;
import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.exceptionhandler.ResourceNotFoundException;
import com.sterp.multitenant.tenant.settings.approval.service.ApprovalSettingsService;
import com.sterp.multitenant.tenant.settings.codegeneration.service.CodeGenerationService;
import com.sterp.multitenant.tenant.zone.entity.Zone;
import com.sterp.multitenant.tenant.zone.repository.ZoneRepository;
import com.sterp.multitenant.tenant.zone.service.ZoneService;

@Service
public class ZoneServiceImpl implements ZoneService {

	@Autowired
	ZoneRepository zoneRepository;

	@Autowired
	CommonService commonService;

	@Autowired
	ModelMapper modelMapper;

	@Autowired
	AppService appService;
	
	@Autowired
	CodeGenerationService codeGenerationService;

	@Autowired
	ApprovalSettingsService approvalSettingsService;
	
	@Autowired
	private StatesRepository stateRepository;
	
	

	public Long getCount() {
		return this.zoneRepository.count();
	}

	public Zone getZoneById(Long zoneId, boolean iscacheable) {
		Map<String, Object> response = new HashedMap<String, Object>();
		Zone zone = this.zoneRepository.findById(zoneId).get();
		List<Integer> stateIds = zone.getStates().stream().map(m -> m.getId()).collect(Collectors.toList());
		zone.setStateId(stateIds);
//			response.put("data", optional.get());
			return zone;
		
//		response.put("message", "Zone with given Id: " + zoneId + " not found!");
//		return null;
	}

	@Override
	public Map<String, Object> addOrUpdateZone(HttpServletRequest request ,Zone zone, MultipartFile[] files) {
		UserEntity currentUser = this.appService.getCurrentUser();
		Map<String, Object> response = new HashedMap<String, Object>();
		request.setAttribute("moduleId", request.getHeader("moduleId"));
		if(zone.getId()==null) {
			zone.setCreatedBy(currentUser.getId());
			zone.setCreatedDate(currentUser.getCreatedAt());
		}
		zone.setModifiedBy(currentUser.getId());
		zone.setModifiedDate(currentUser.getModifiedAt());
		zone.setBranchId(currentUser.getBranchId());
		zone.setCompanyId(currentUser.getCompanyId());
		
		if(zone.getStateId()!=null) {
			Set<State> states=stateRepository.getAllStateById(zone.getStateId());
		zone.setStates(states);
		}
		
//		response.put("data",this.zoneRepository.save(zone));
		response = commonService.addUpdate(request ,zone, files);
		return response;
	}

	@Override
	public Map<String, Object> getSelectionList(boolean iscacheable) {
		Map<String, Object> response = new HashedMap<String, Object>();
		List<CommonDropdownResponseDataTravelObject> zones = this.zoneRepository.getSelectionList();
		if (zones.size() == 0) {
			throw new ResourceNotFoundException("No Active Zone found");
		}
		response.put("data", zones);
		return response;
	}

	@Override
	public Map<String, Object> getZoneList(Map<String, Object> params){
		Map<String, Object> response = new HashMap<String, Object>();
	response.put("data", this.commonService.getCommonFilteredList(Zone.class, params));
//		return response;
//		int page = 1;
//		int limit = 10;
//		String search = null;
//		String sort = null;
//		String order = null;
//		String filter = null;
//		boolean filterRemove = false;
//		List<ScreenFilterDTO> screenFilterDTO = Collections.emptyList();
//		for (Map.Entry<String, Object> entry : params.entrySet()) {
//			if (((String) entry.getKey()).contains("_page")) {
//				page = Integer.parseInt(entry.getValue().toString());
//			} else if (((String) entry.getKey()).contains("_limit")) {
//				limit = Integer.parseInt(entry.getValue().toString());
//			} else if (((String) entry.getKey()).contains("_order")) {
//				order = (String) entry.getValue();
//			} else if (((String) entry.getKey()).contains("_sort")) {
//				sort = (String) entry.getValue();
//			} else if (((String) entry.getKey()).contains("_search")) {
//				search = (String) entry.getValue();
//			} else if (((String) entry.getKey()).contains("_like")) {
//				search = (String) entry.getValue();
//			} else if (((String) entry.getKey()).contains("screen_filter")) {
//				filter = (String) entry.getValue();
//				screenFilterDTO = objectMapper.readValue(filter, new TypeReference<List<ScreenFilterDTO>>() {
//				});
//			} else if (((String) entry.getKey()).contains("filter_remove")) {
//				filterRemove = Boolean.parseBoolean((String) entry.getValue());
//			}
//		}
//		int moduleId = 0;// Integer.parseInt(httpServletRequest.getHeader("screenId"));
//
//		if ((sort == null) || (sort.isEmpty())) {
//			sort = "id";
//		}
//		if ((order == null) || (order.isEmpty())) {
//			order = Sort.Direction.ASC.toString();
//		}
//		int totalCount = Integer.parseInt(Long.valueOf(zoneRepository.count()).toString());
//		Page<ZoneRequestDTO> zoneList = null;
//		if ((search == null) || (search.isEmpty())) {
//			zoneList = this.zoneRepository
//					.findCustom(this.appService.createPageRequest((page - 1), limit, order.toUpperCase(), sort));
//		} else {
//			zoneList = this.zoneRepository.findCustomSearch(search,
//					this.appService.createPageRequest((page - 1), limit, order.toUpperCase(), sort));
//		}
//		// customQuery.findCustom("ac");
//		for (ZoneRequestDTO zoneRequestDTO : zoneList) {
//			zoneRequestDTO.setStatusDetail(this.statusRepo.findById(zoneRequestDTO.getStatus()).get());
//		}
//		response.put("totalCount", this.zoneRepository.count());
//		response.put("data", zoneList);
		return response;
	}
	
}
