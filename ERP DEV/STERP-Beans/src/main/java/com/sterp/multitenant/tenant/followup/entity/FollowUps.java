package com.sterp.multitenant.tenant.followup.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Map;

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
import javax.persistence.Transient;

import com.sterp.multitenant.tenant.leads.Lead;
import com.sterp.multitenant.tenant.modules.entity.Modules;
import com.sterp.multitenant.tenant.settings.template.entity.SuperBean;

@Entity
@Table(name = "follow_ups")
public class FollowUps extends SuperBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;

	@Column(name = "followup_code")
	private String followupCode;

	@Column(name = "module_id")
	private Long moduleId;

	@Column(name = "ref_doc")
	private Long refDoc;

	@Column(name = "followup_type")
	private Long followupType;

	@Column(name = "prev_followup_id")
	private Long prevFollowupId;

	@Column(name = "followup_date")
	private LocalDate followupDate;

	@Column(name = "ref_doc_status")
	private Long refDocStatus;

	@Column(name = "followup_start_time")
	private LocalTime followupStartTime;

	@Column(name = "followup_end_time")
	private LocalTime followupEndTime;

	@Column(name = "next_followup")
	private Boolean nextFollowup;

	@Column(name = "next_followup_date")
	private LocalDate nextFollowupDate;

	@Column(name = "next_followup_start_time")
	private LocalTime nextFollowupStartTime;

	@Column(name = "next_followup_end_time")
	private LocalTime nextFollowupEndTime;

	@Column(name = "next_followup_type")
	private Long nextFollowupType;

	@Lob
	@Column(name = "remarks")
	private String remarks;

	@Column(name = "lead_notification_time", columnDefinition = "default 10")
	private Integer leadNotificationTime;

	@Column(name = "lead_notification_unit")
	private Long leadNotificationUnit;

	@Lob
	@Column(name = "next_followup_remarks")
	private String nextFollowupRemarks;

	@Lob
	@Column(name = "invitees")
	private String invitees;

	@Lob
	@Column(name = "mail_content")
	private String mailContent;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ref_doc", insertable = false, updatable = false, nullable = true)
	private Lead lead;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "module_id", insertable = false, updatable = false, nullable = true)
	private Modules module;

	@Transient
	private Map<String, Object> entity;

	@Transient
	private String prevfollowType;
	
	@Transient
	private boolean sendMail;

	@Column(name = "order_value_for_quote")
	private Double orderValueforQuote;
	
	@Column(name = "order_valueon_techno_commercial")
	private Double orderValueonTechnoCommercial;
	
	@Column(name = "final_order_value")
	private Double finalOrderValue;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFollowupCode() {
		return followupCode;
	}

	public void setFollowupCode(String followupCode) {
		this.followupCode = followupCode;
	}

	public Long getModuleId() {
		return moduleId;
	}

	public void setModuleId(Long moduleId) {
		this.moduleId = moduleId;
	}

	public Long getRefDoc() {
		return refDoc;
	}

	public void setRefDoc(Long refDoc) {
		this.refDoc = refDoc;
	}

	public Long getFollowupType() {
		return followupType;
	}

	public void setFollowupType(Long followupType) {
		this.followupType = followupType;
	}

	public Long getPrevFollowupId() {
		return prevFollowupId;
	}

	public void setPrevFollowupId(Long prevFollowupId) {
		this.prevFollowupId = prevFollowupId;
	}

	public LocalDate getFollowupDate() {
		return followupDate;
	}

	public void setFollowupDate(LocalDate followupDate) {
		this.followupDate = followupDate;
	}

	public LocalTime getFollowupStartTime() {
		return followupStartTime;
	}

	public void setFollowupStartTime(LocalTime followupStartTime) {
		this.followupStartTime = followupStartTime;
	}

	public LocalTime getFollowupEndTime() {
		return followupEndTime;
	}

	public void setFollowupEndTime(LocalTime followupEndTime) {
		this.followupEndTime = followupEndTime;
	}

	public Boolean getNextFollowup() {
		return nextFollowup;
	}

	public void setNextFollowup(Boolean nextFollowup) {
		this.nextFollowup = nextFollowup;
	}

	public LocalDate getNextFollowupDate() {
		return nextFollowupDate;
	}

	public void setNextFollowupDate(LocalDate nextFollowupDate) {
		this.nextFollowupDate = nextFollowupDate;
	}

	public LocalTime getNextFollowupStartTime() {
		return nextFollowupStartTime;
	}

	public void setNextFollowupStartTime(LocalTime nextFollowupStartTime) {
		this.nextFollowupStartTime = nextFollowupStartTime;
	}

	public LocalTime getNextFollowupEndTime() {
		return nextFollowupEndTime;
	}

	public void setNextFollowupEndTime(LocalTime nextFollowupEndTime) {
		this.nextFollowupEndTime = nextFollowupEndTime;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Map<String, Object> getEntity() {
		return entity;
	}

	public void setEntity(Map<String, Object> entity) {
		this.entity = entity;
	}

	public String getPrevfollowType() {
		return prevfollowType;
	}

	public void setPrevfollowType(String prevfollowType) {
		this.prevfollowType = prevfollowType;
	}

	public Lead getLead() {
		return lead;
	}

	public void setLead(Lead lead) {
		this.lead = lead;
	}

	public Modules getModule() {
		return module;
	}

	public void setModule(Modules module) {
		this.module = module;
	}

	public Integer getLeadNotificationTime() {
		return leadNotificationTime;
	}

	public void setLeadNotificationTime(Integer leadNotificationTime) {
		this.leadNotificationTime = leadNotificationTime;
	}

	public Long getLeadNotificationUnit() {
		return leadNotificationUnit;
	}

	public void setLeadNotificationUnit(Long leadNotificationUnit) {
		this.leadNotificationUnit = leadNotificationUnit;
	}

	public String getNextFollowupRemarks() {
		return nextFollowupRemarks;
	}

	public void setNextFollowupRemarks(String nextFollowupRemarks) {
		this.nextFollowupRemarks = nextFollowupRemarks;
	}

	public String getInvitees() {
		return invitees;
	}

	public void setInvitees(String invitees) {
		this.invitees = invitees;
	}

	public Long getNextFollowupType() {
		return nextFollowupType;
	}

	public void setNextFollowupType(Long nextFollowupType) {
		this.nextFollowupType = nextFollowupType;
	}

	public Long getRefDocStatus() {
		return refDocStatus;
	}

	public void setRefDocStatus(Long refDocStatus) {
		this.refDocStatus = refDocStatus;
	}

	public String getMailContent() {
		return mailContent;
	}

	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}

	public Double getOrderValueforQuote() {
		return orderValueforQuote;
	}

	public void setOrderValueforQuote(Double orderValueforQuote) {
		this.orderValueforQuote = orderValueforQuote;
	}

	public Double getOrderValueonTechnoCommercial() {
		return orderValueonTechnoCommercial;
	}

	public void setOrderValueonTechnoCommercial(Double orderValueonTechnoCommercial) {
		this.orderValueonTechnoCommercial = orderValueonTechnoCommercial;
	}

	public Double getFinalOrderValue() {
		return finalOrderValue;
	}

	public void setFinalOrderValue(Double finalOrderValue) {
		this.finalOrderValue = finalOrderValue;
	}

	public boolean isSendMail() {
		return sendMail;
	}

	public void setSendMail(boolean sendMail) {
		this.sendMail = sendMail;
	}


	
}
