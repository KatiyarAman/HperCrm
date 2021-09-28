package com.sterp.multitenant.tenant.leadchecklist;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.sterp.multitenant.tenant.leadsource.entity.LeadSource;
import com.sterp.multitenant.tenant.model.Type;
import com.sterp.multitenant.tenant.settings.template.entity.SuperBean;

@Entity
@Table(name = "lead_checklist")
public class LeadCheckList extends SuperBean {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name = "checklist_code")
	private String checklistCode;

	@Column(name = "lead_source_id")
	private Long leadSourceId;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "lead_source_id", insertable = false, updatable = false)
	private LeadSource leadSource;

	@Column(name = "type_id")
	private String typeId;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "type_id", insertable = false, updatable = false)
	private Type type;

	@Column(name = "lead_checklist")
	private String checklistPoint;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getChecklistCode() {
		return checklistCode;
	}

	public void setChecklistCode(String checklistCode) {
		this.checklistCode = checklistCode;
	}

	public Long getLeadSourceId() {
		return leadSourceId;
	}

	public void setLeadSourceId(Long leadSourceId) {
		this.leadSourceId = leadSourceId;
	}

	public LeadSource getLeadSource() {
		return leadSource;
	}

	public void setLeadSource(LeadSource leadSource) {
		this.leadSource = leadSource;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public String getChecklistPoint() {
		return checklistPoint;
	}

	public void setChecklistPoint(String checklistPoint) {
		this.checklistPoint = checklistPoint;
	}


}
