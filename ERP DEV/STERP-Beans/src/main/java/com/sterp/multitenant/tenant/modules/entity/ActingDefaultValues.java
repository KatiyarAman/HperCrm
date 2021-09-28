package com.sterp.multitenant.tenant.modules.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.sterp.multitenant.tenant.model.StatusDetails;
import com.sterp.multitenant.tenant.settings.template.entity.CustomField;

@Entity
@Table(name="acting_default_values")
public class ActingDefaultValues implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id")
	private Long id;
	
	@Column(name="custom_field_id")
	private Long CustomFieldId;
	
	@Lob
	@Column(name="value")
	private String value;
	
	@Column(name="module_button_id")
	private Long moduleButtonId;
	
	@Column(name="status")
	private Long status;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="status",updatable = false,insertable = false,nullable = true)
	private StatusDetails statusDetails;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="custom_field_id",updatable = false,insertable = false,nullable = true)
	private CustomField customField;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getCustomFieldId() {
		return CustomFieldId;
	}

	public void setCustomFieldId(Long customFieldId) {
		CustomFieldId = customFieldId;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Long getModuleButtonId() {
		return moduleButtonId;
	}

	public void setModuleButtonId(Long moduleButtonId) {
		this.moduleButtonId = moduleButtonId;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}

	public StatusDetails getStatusDetails() {
		return statusDetails;
	}

	public void setStatusDetails(StatusDetails statusDetails) {
		this.statusDetails = statusDetails;
	}

	public CustomField getCustomField() {
		return customField;
	}

	public void setCustomField(CustomField customField) {
		this.customField = customField;
	}

}
