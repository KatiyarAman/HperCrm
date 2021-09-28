package com.sterp.multitenant.tenant.uploadutility.entity;

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

import com.sterp.multitenant.tenant.settings.template.entity.CustomField;

@Entity
@Table(name="excel_template_lines")
public class ExcelTemplateLines implements Serializable{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	@Column(name="custom_field_id")
	private Long customFieldId;
	
	@Column(name="column_number")
	private String columnNumber;
	
	@Column(name="excel_template_id")
	private Long excelTemplateId;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="custom_field_id", updatable = false, insertable=false, nullable = true)
	private CustomField customField;

	public Long getCustomFieldId() {
		return customFieldId;
	}

	public void setCustomFieldId(Long customFieldId) {
		this.customFieldId = customFieldId;
	}

	public String getColumnNumber() {
		return columnNumber;
	}

	public void setColumnNumber(String columnNumber) {
		this.columnNumber = columnNumber;
	}

	public CustomField getCustomField() {
		return customField;
	}

	public void setCustomField(CustomField customField) {
		this.customField = customField;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getExcelTemplateId() {
		return excelTemplateId;
	}

	public void setExcelTemplateId(Long excelTemplateId) {
		this.excelTemplateId = excelTemplateId;
	}
	
}
