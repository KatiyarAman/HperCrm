package com.sterp.multitenant.tenant.settings.template.entity;

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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.sterp.multitenant.tenant.modules.entity.ActingDefaultValues;
import com.sterp.multitenant.tenant.modules.entity.TemplateMaster;

/**
 * @author Ankit Panwar
 *
 */
@Entity
@Table(name = "module_button_mapping")

public class ModuleButtonsMapping implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6172015680505303626L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@Column(name = "module_action_id")
	private long moduleActionId;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "button_id")
	private Buttons button;
	
	@Column(name="acting_module")
	private String actingModule;
	
	@Column(name="ref_module_id")
	private Long refModuleId;
	
	@Column(name="template")
	private Long template;
	
	@Column(name="any_default_values")
	private boolean anyDefaultValues;
	
	@OneToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name="module_button_id",nullable = true)
	private List<ActingDefaultValues> actingDefaultValue;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "template",updatable = false,insertable = false,nullable = true)
	private TemplateMaster templateMaster;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getModuleActionId() {
		return moduleActionId;
	}

	public void setModuleActionId(long moduleActionId) {
		this.moduleActionId = moduleActionId;
	}

	public Buttons getButton() {
		return button;
	}

	public void setButton(Buttons button) {
		this.button = button;
	}

	public String getActingModule() {
		return actingModule;
	}

	public void setActingModule(String actingModule) {
		this.actingModule = actingModule;
	}

	public Long getRefModuleId() {
		return refModuleId;
	}

	public void setRefModuleId(Long refModuleId) {
		this.refModuleId = refModuleId;
	}

	public Long getTemplate() {
		return template;
	}

	public void setTemplate(Long template) {
		this.template = template;
	}

	public boolean isAnyDefaultValues() {
		return anyDefaultValues;
	}

	public void setAnyDefaultValues(boolean anyDefaultValues) {
		this.anyDefaultValues = anyDefaultValues;
	}

	public List<ActingDefaultValues> getActingDefaultValue() {
		return actingDefaultValue;
	}

	public void setActingDefaultValue(List<ActingDefaultValues> actingDefaultValue) {
		this.actingDefaultValue = actingDefaultValue;
	}

	public TemplateMaster getTemplateMaster() {
		return templateMaster;
	}

	public void setTemplateMaster(TemplateMaster templateMaster) {
		this.templateMaster = templateMaster;
	}
	
	

}
