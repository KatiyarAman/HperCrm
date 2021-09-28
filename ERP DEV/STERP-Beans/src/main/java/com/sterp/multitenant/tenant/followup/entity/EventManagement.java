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

import org.hibernate.annotations.Where;

import com.sterp.multitenant.tenant.leads.Lead;
import com.sterp.multitenant.tenant.modules.entity.Modules;
import com.sterp.multitenant.tenant.settings.template.entity.SuperBean;

@Entity
@Table(name = "event_management")
public class EventManagement extends SuperBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id")
	private Long id;
	
	@Column(name="event_title")
	private String eventTitle;
	
	@Column(name="event_type")
	private Long eventType;
	
	@Column(name="event_date")
	private LocalDate eventDate;
	
	@Column(name="event_end_date")
	private LocalDate eventEndDate;
	
	@Column(name="event_start_time")
	private LocalTime eventStartTime;
	
	@Column(name="event_end_time")
	private LocalTime eventEndTime;
	
	@Column(name="lead_time")
	private Integer leadTime;
	
	@Column(name="lead_unit")
	private Long leadUnit;
	
	@Lob
	@Column(name="remarks")
	private String remarks;
	
	@Lob
	@Column(name="invitees")
	private String invitees;
	
	@Column(name="module_id")
	private Long moduleId;
	
	@Column(name="ref_doc")
	private Long refDoc;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="module_id", nullable = true,updatable = false,insertable = false)
	private Modules module;
	
	@Transient
	private Lead lead;
	
	@Transient
	private FollowUps followUps;
	
	@Transient
	private Map<String, Object> entity;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public LocalDate getEventDate() {
		return eventDate;
	}

	public void setEventDate(LocalDate eventDate) {
		this.eventDate = eventDate;
	}

	public LocalTime getEventStartTime() {
		return eventStartTime;
	}

	public void setEventStartTime(LocalTime eventStartTime) {
		this.eventStartTime = eventStartTime;
	}

	public LocalTime getEventEndTime() {
		return eventEndTime;
	}

	public void setEventEndTime(LocalTime eventEndTime) {
		this.eventEndTime = eventEndTime;
	}

	public Integer getLeadTime() {
		return leadTime;
	}

	public void setLeadTime(Integer leadTime) {
		this.leadTime = leadTime;
	}

	public Long getLeadUnit() {
		return leadUnit;
	}

	public void setLeadUnit(Long leadUnit) {
		this.leadUnit = leadUnit;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getInvitees() {
		return invitees;
	}

	public void setInvitees(String invitees) {
		this.invitees = invitees;
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

	public Modules getModule() {
		return module;
	}

	public void setModule(Modules module) {
		this.module = module;
	}

	public Lead getLead() {
		return lead;
	}

	public void setLead(Lead lead) {
		this.lead = lead;
	}

	public FollowUps getFollowUps() {
		return followUps;
	}

	public void setFollowUps(FollowUps followUps) {
		this.followUps = followUps;
	}

	public Map<String, Object> getEntity() {
		return entity;
	}

	public void setEntity(Map<String, Object> entity) {
		this.entity = entity;
	}

	public Long getEventType() {
		return eventType;
	}

	public void setEventType(Long eventType) {
		this.eventType = eventType;
	}

	public LocalDate getEventEndDate() {
		return eventEndDate;
	}

	public void setEventEndDate(LocalDate eventEndDate) {
		this.eventEndDate = eventEndDate;
	}

}
