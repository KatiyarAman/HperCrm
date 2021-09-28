package com.sterp.multitenant.tenant.core.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sterp.multitenant.tenant.core.services.StateServices;


@RestController
@RequestMapping("/state")
public class StateController {

	@Autowired
	StateServices stateService;

	@GetMapping(value = "/getSelectionList", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getStatesByCountryId(@RequestParam(required = false) Integer countryId,@RequestParam(required = false) Integer currentCountryId, @RequestParam(required = false) Integer permanentCountryId) {
		return ResponseEntity.ok(this.stateService.getActiveStateListByCountrtIdInCommonDropdown(countryId,currentCountryId,permanentCountryId, false));
	}
	
	@GetMapping(value = "/getById/{id}/{moduleId}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<?> getStateById(@PathVariable int id,@PathVariable(value = "moduleId", required = true) Long moduleId) {
		return ResponseEntity.ok(this.stateService.getStateById(id, false));
	}
}
