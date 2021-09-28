package com.sterp.multitenant.tenant.settings.template.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "field_validations")
public class FieldValidations implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5199179325594442664L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "custom_field_id")
	private Integer customFieldId;
	@Column(name = "validation_name")
	private String validationName;
	@Column(name = "error_message")
	private String errorMessage;
	@Column(name = "match_case")
	private String matchCase;
	@Column(name="ref_custom_field_id")
	private Long refCustomFieldId;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ref_custom_field_id", insertable = false,nullable = true, updatable = false)
	private CustomField customField;
	
//	@Enumerated(EnumType.ORDINAL)
//	private StatusEnum status;
	
	@Column(name = "status")
	private Long status;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCustomFieldId() {
		return customFieldId;
	}

	public void setCustomFieldId(Integer customFieldId) {
		this.customFieldId = customFieldId;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getValidationName() {
		return validationName;
	}

	public void setValidationName(String validationName) {
		this.validationName = validationName;
	}
	
	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}

	public String getMatchCase() {
		return matchCase;
	}

	public void setMatchCase(String matchCase) {
		this.matchCase = matchCase;
	}
	
	

	public Long getRefCustomFieldId() {
		return refCustomFieldId;
	}

	public void setRefCustomFieldId(Long refCustomFieldId) {
		this.refCustomFieldId = refCustomFieldId;
	}

	@Override
	public String toString() {
		return "FieldValidations [id=" + id + ", customFieldId=" + customFieldId + ", validationName=" + validationName
				+ ", errorMessage=" + errorMessage + ", matchCase=" + matchCase + ", status=" + status + "]";
	}

	public CustomField getCustomField() {
		return customField;
	}

	public void setCustomField(CustomField customField) {
		this.customField = customField;
	}

	

}
