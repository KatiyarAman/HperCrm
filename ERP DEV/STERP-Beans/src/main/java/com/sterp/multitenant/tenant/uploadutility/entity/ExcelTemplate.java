package com.sterp.multitenant.tenant.uploadutility.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.sterp.multitenant.tenant.modules.entity.Modules;
import com.sterp.multitenant.tenant.settings.template.entity.SuperBean;

@Entity
@Table(name="excel_template")
public class ExcelTemplate extends SuperBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	@Column(name="template_name")
	private String templateName;
	
	@Column(name="module_id")
	private Long moduleId;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "module_id",updatable = false,insertable = false, nullable = true)
	private Modules module;
	
	@Fetch(FetchMode.SUBSELECT)
	@OneToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name = "excel_template_id")
	private List<ExcelTemplateLines> excelTemplateLines;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTemplateName() {
		return templateName;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}

	public Long getModuleId() {
		return moduleId;
	}

	public void setModuleId(Long moduleId) {
		this.moduleId = moduleId;
	}

	public Modules getModule() {
		return module;
	}

	public void setModule(Modules module) {
		this.module = module;
	}

	public List<ExcelTemplateLines> getExcelTemplateLines() {
		return excelTemplateLines;
	}

	public void setExcelTemplateLines(List<ExcelTemplateLines> excelTemplateLines) {
		this.excelTemplateLines = excelTemplateLines;
	}

}
