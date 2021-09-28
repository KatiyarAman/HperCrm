package com.sterp.multitenant.tenant.modules.entity;

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

import com.sterp.multitenant.tenant.model.StatusDetails;

@Entity
@Table(name="template_master")
public class TemplateMaster implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id")
	private Long id;
	
	@Column(name="template_path")
	private String templatePath;
	
	@Column(name="template_name")
	private String templateName;
	
	@Column(name="status")
	private Long status;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="status",updatable = false, insertable = false, nullable = true)
	private StatusDetails statusDetails;

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

	public String getTemplatePath() {
		return templatePath;
	}

	public void setTemplatePath(String templatePath) {
		this.templatePath = templatePath;
	}

}
