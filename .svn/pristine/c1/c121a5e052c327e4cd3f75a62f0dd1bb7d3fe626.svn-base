package com.sterp.multitenant.tenant.core.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sterp.multitenant.tenant.core.services.CityServices;


@RestController
@RequestMapping("/city")
public class CityController {

	@Autowired
	CityServices cityService;

	@GetMapping(value = "/getSelectionList", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getActiveCitiesByStateId(@RequestParam(required = false) Integer stateId,@RequestParam(required = false) Integer currentStateId,
			@RequestParam(required = false) Integer permanentStateId) {
		return ResponseEntity.ok(this.cityService.getActiveCityListByStateIdInCommonDropdown(stateId,currentStateId,permanentStateId, true));
	}

	@GetMapping(value = "/getById/{id}/{moduleId}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getCityById(@PathVariable int id,@PathVariable(value = "moduleId", required = true) Long moduleId) {
		return ResponseEntity.ok(this.cityService.getCityById(id, false));
	}
}
