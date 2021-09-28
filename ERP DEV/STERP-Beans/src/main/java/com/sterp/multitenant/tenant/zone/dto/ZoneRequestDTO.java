package com.sterp.multitenant.tenant.zone.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.sterp.multitenant.tenant.model.StatusDetails;
import com.sterp.multitenant.tenant.settings.template.entity.CustomFieldData;

public class ZoneRequestDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7102894484448851571L;
	private long id;
	private String zoneCode;
	private String zoneName;
	private String description;
	private Long status;
	private List<CustomFieldData> customFieldDatas = new ArrayList<CustomFieldData>();
	private List<Long> stateId=new ArrayList<>();
	private StatusDetails statusDetail;
	private String title;
	
	
	public ZoneRequestDTO(long id, String zoneCode, String zoneName, String description, Long status,
			 String title) {
		this.id = id;
		this.zoneCode = zoneCode;
		this.zoneName = zoneName;
		this.description = description;
		this.status = status;
		this.title = title;
	}

	public StatusDetails getStatusDetail() {
		return statusDetail;
	}

	public void setStatusDetail(StatusDetails statusDetail) {
		this.statusDetail = statusDetail;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getZoneCode() {
		return zoneCode;
	}

	public void setZoneCode(String zoneCode) {
		this.zoneCode = zoneCode;
	}

	public String getZoneName() {
		return zoneName;
	}

	public void setZoneName(String zoneName) {
		this.zoneName = zoneName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}

	public List<CustomFieldData> getCustomFieldDatas() {
		return customFieldDatas;
	}

	public void setCustomFieldDatas(List<CustomFieldData> customFieldDatas) {
		this.customFieldDatas = customFieldDatas;
	}

	public List<Long> getStateId() {
		return stateId;
	}

	public void setStateId(List<Long> stateId) {
		this.stateId = stateId;
	}

	@Override
	public String toString() {
		return "ZoneRequestDTO [id=" + id + ", zoneCode=" + zoneCode + ", zoneName=" + zoneName + ", description="
				+ description + ", status=" + status + ", customFieldDatas=" + customFieldDatas + "]";
	}
	
	

}
