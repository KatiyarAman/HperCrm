package com.sterp.multitenant.tenant.campaign;

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

import com.sterp.multitenant.tenant.model.Type;
import com.sterp.multitenant.tenant.settings.template.entity.SuperBean;
@Entity
@Table(name="campaign")
public class Campaign extends SuperBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="campaign_code")
	private String campaignCode;
	
	@Column(name="campaign_name")
	private String campaignName;
	
	@Column(name="campaign_type")
	private Long campaignType;
	
	@Lob
	@Column(name="content")
	private String content;
	
	@Lob
	@Column(name="remarks")
	private String remarks;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="campaign_type", insertable = false, updatable = false, nullable = true)
	private Type type;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCampaignCode() {
		return campaignCode;
	}

	public void setCampaignCode(String campaignCode) {
		this.campaignCode = campaignCode;
	}

	public String getCampaignName() {
		return campaignName;
	}

	public void setCampaignName(String campaignName) {
		this.campaignName = campaignName;
	}

	public Long getCampaignType() {
		return campaignType;
	}

	public void setCampaignType(Long campaignType) {
		this.campaignType = campaignType;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	
	
}
