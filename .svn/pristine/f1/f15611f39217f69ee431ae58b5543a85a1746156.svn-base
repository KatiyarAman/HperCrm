package com.sterp.multitenant.tenant.customer;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Where;

import com.sterp.multitenant.tenant.branch.entity.ContactDetails;
import com.sterp.multitenant.tenant.entity.UserEntity;
import com.sterp.multitenant.tenant.model.BankDetail;
import com.sterp.multitenant.tenant.model.Type;
import com.sterp.multitenant.tenant.settings.template.entity.SuperBean;

@Entity
@Table(name = "customer")
public class Customer extends SuperBean {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "customer_code")
	private String customerCode;

	@Column(name = "customer_name")
	private String customerName;
	@Lob
	@Column(name = "description")
	private String description;

	@Column(name = "short_name")
	private String shortName;
	
	@Lob
	@Column(name = "customer_address")
	private String customerAddress;
	
	@Column(name = "type_id")
	private Long typeId;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "type_id", insertable = false, updatable = false,nullable = true)
	private Type type;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "contact_no")
	private Long contactNo;
	
	@Column(name = "city_id")
	private Long cityId;
	
	@Column(name = "gst_no")
	private String gstNo;
	
	@Column(name = "pan_no")
	private String panNo;
	
	@Column(name = "cin_no")
	private String cinNo;
	
	@Column(name = "user_id")
	private Long userId;
	
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="user_id",insertable = false,updatable = false,nullable = true)
	private UserEntity user;
	
	@Fetch(FetchMode.SUBSELECT)
	@OneToMany(fetch=FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name="ref_id")
	@Where(clause = "module_id=223 and status = 2")
	private List<BankDetail> bankAccounts;
	
	@Fetch(FetchMode.SUBSELECT)
	@OneToMany(fetch=FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name="ref_id")
	@Where(clause = "module_id=223 and status = 2")
	private List<ContactDetails> contactDetails;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getCustomerName() {
		return customerName;
	}

	public List<BankDetail> getBankAccounts() {
		return bankAccounts;
	}

	public void setBankAccounts(List<BankDetail> bankAccounts) {
		this.bankAccounts = bankAccounts;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public Long getTypeId() {
		return typeId;
	}

	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Long getContactNo() {
		return contactNo;
	}

	public void setContactNo(Long contactNo) {
		this.contactNo = contactNo;
	}

	public Long getCityId() {
		return cityId;
	}

	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}

	public String getGstNo() {
		return gstNo;
	}

	public void setGstNo(String gstNo) {
		this.gstNo = gstNo;
	}

	public String getPanNo() {
		return panNo;
	}

	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}

	public String getCinNo() {
		return cinNo;
	}

	public void setCinNo(String cinNo) {
		this.cinNo = cinNo;
	}

	public List<ContactDetails> getContactDetails() {
		return contactDetails;
	}

	public void setContactDetails(List<ContactDetails> contactDetails) {
		this.contactDetails = contactDetails;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	

}
