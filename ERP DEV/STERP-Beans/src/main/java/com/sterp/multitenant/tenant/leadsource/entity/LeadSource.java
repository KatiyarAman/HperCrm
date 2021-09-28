package com.sterp.multitenant.tenant.leadsource.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.sterp.multitenant.tenant.settings.template.entity.SuperBean;
@Entity
@Table(name="lead_source")
public class LeadSource extends SuperBean {
	private static final long serialVersionUID = 1L;


	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="lead_source")
	private String leadSource;
	
	@Column(name="status")
	private Long status;
	
	
	@Column(name = "created_by", insertable = true, updatable = false)
	private Long createdBy;

	@Column(name = "modified_by", insertable = true, updatable = true)
	private Long modifiedBy;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_date", columnDefinition = "TIMESTAMP", insertable = true, updatable = false)
	private Date createdDate = new Date(System.currentTimeMillis());

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "modified_date", columnDefinition = "TIMESTAMP", insertable = true, updatable = true)
	private Date modifiedDate = new Date(System.currentTimeMillis());
	
	@Column(name="company_id")
	private Long companyId;
	
	@Column(name="branch_id")
	private Long branchId;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLeadSource() {
		return leadSource;
	}

	public void setLeadSource(String leadSource) {
		this.leadSource = leadSource;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}

	public Long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}

	public Long getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(Long modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Long getBranchId() {
		return branchId;
	}

	public void setBranchId(Long branchId) {
		this.branchId = branchId;
	}
}
