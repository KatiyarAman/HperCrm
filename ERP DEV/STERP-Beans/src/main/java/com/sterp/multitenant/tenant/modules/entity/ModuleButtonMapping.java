package com.sterp.multitenant.tenant.modules.entity;

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

@Entity
@Table(name = "module_button_mapping")
public class ModuleButtonMapping {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Column(name = "module_action_id")
	private long moduleActionId;
	
	@Column(name = "button_id")
	private long buttonId;
	
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
	
	public ModuleButtonMapping() {
		super();
	}
	public ModuleButtonMapping(long moduleActionId, long buttonId) {
		super();
		this.moduleActionId = moduleActionId;
		this.buttonId = buttonId;
	}
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
	public long getButtonId() {
		return buttonId;
	}
	public void setButtonId(long buttonId) {
		this.buttonId = buttonId;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (buttonId ^ (buttonId >>> 32));
		result = prime * result + (int) (moduleActionId ^ (moduleActionId >>> 32));
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ModuleButtonMapping other = (ModuleButtonMapping) obj;
		if (buttonId != other.buttonId)
			return false;
		if (moduleActionId != other.moduleActionId)
			return false;
		return true;
	}
	
	
}
