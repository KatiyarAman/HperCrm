package com.sterp.multitenant.tenant.leads;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Where;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.sterp.multitenant.tenant.branch.entity.ContactDetails;
import com.sterp.multitenant.tenant.customer.Customer;
import com.sterp.multitenant.tenant.employee.entity.Employee;
import com.sterp.multitenant.tenant.leadsource.entity.LeadSource;
import com.sterp.multitenant.tenant.model.Type;
import com.sterp.multitenant.tenant.product.Product;
import com.sterp.multitenant.tenant.settings.template.entity.SuperBean;

@Entity
@Table(name = "enquiry")
public class Lead extends SuperBean {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "lead_code")
	private String leadCode;

	@Column(name = "lead_source_id")
	private Long leadSourceId;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "lead_source_id", insertable = false, updatable = false)
	private LeadSource leadSource;

	@Column(name = "lead_date")
	private LocalDate leadDate;

	@Column(name = "enquiry")
	private String enquiry;
	
	@Lob
	@Column(name = "description")
	private String description;

	@Column(name = "customer_type")
	private Long customerType;

	@Column(name = "customer_id")
	private Long customerId;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "customer_id", insertable = false, updatable = false,nullable = true)
	private Customer customer;

	@Column(name = "customer_name")
	private String customerName;
	
	@Lob
	@Column(name = "customer_address")
	private String customerAddress;
	
	@Column(name = "city_id")
	private Long cityId;
	
	@Column(name = "type_id")
	private String typeId;
	
	@Fetch(FetchMode.SUBSELECT)
	@OneToMany(fetch=FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name="ref_id")
	@Where(clause = "module_id=227 and status = 2")
	private List<ContactDetails> contactDetails;
	
//	@Fetch(FetchMode.SUBSELECT)
//	@OneToMany(fetch=FetchType.EAGER,cascade = CascadeType.ALL)
//	@JoinColumn(name="lead_id")
//	private List<LeadProductDetails> leadProductDetails;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "type_id", insertable = false, updatable = false,nullable = true)
	private Type type;
	
	@Lob
	@Column(name = "remarks")
	private String remarks;
	
	@Column(name = "order_value_for_quote")
	private Double orderValueforQuote;
	
	@Column(name = "order_valueon_techno_commercial")
	private Double orderValueonTechnoCommercial;
	
	@Column(name = "final_order_value")
	private Double finalOrderValue;
	
//	@Column(name="assign_user")
//	private Long assignUser;
	
	@Transient
	private List<Long> assignUser=new ArrayList<>();
	
	@Transient
	private List<Long> productIds=new ArrayList<>();
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="assign_user",nullable = true,insertable = false,updatable = false)
	private Employee user;
	
	@JsonIgnore
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name="lead_employee_mapping",
			joinColumns = @JoinColumn(name = "enquiry_id"),
			inverseJoinColumns = @JoinColumn(name = "employee_id"))
	private Set<Employee> emloyies=new HashSet<>();
	
	@JsonIgnore
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name="lead_product_table",
			joinColumns = @JoinColumn(name = "enquiry_id"),
			inverseJoinColumns = @JoinColumn(name = "product_id"))
	private Set<Product> product=new HashSet<>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLeadCode() {
		return leadCode;
	}

	public void setLeadCode(String leadCode) {
		this.leadCode = leadCode;
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

	public LocalDate getLeadDate() {
		return leadDate;
	}

	public void setLeadDate(LocalDate leadDate) {
		this.leadDate = leadDate;
	}

	public String getEnquiry() {
		return enquiry;
	}

	public void setEnquiry(String enquiry) {
		this.enquiry = enquiry;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getCustomerType() {
		return customerType;
	}

	public void setCustomerType(Long customerType) {
		this.customerType = customerType;
	}

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public Long getCityId() {
		return cityId;
	}

	public void setCityId(Long cityId) {
		this.cityId = cityId;
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

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public List<ContactDetails> getContactDetails() {
		return contactDetails;
	}

	public void setContactDetails(List<ContactDetails> contactDetails) {
		this.contactDetails = contactDetails;
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

	public List<Long> getAssignUser() {
		return assignUser;
	}

	public void setAssignUser(List<Long> assignUser) {
		this.assignUser = assignUser;
	}

	public Set<Employee> getEmloyee() {
		return emloyies;
		}

	public void setEmloyee(Set<Employee> emloyies) {
		this.emloyies = emloyies;
     }

//	public Long getAssignUser() {
//		return assignUser;
//	}
//
//	public void setAssignUser(Long assignUser) {
//		this.assignUser = assignUser;
//	}

	public Employee getUser() {
		return user;
	}

	public void setUser(Employee user) {
		this.user = user; 
	}

//	public List<LeadProductDetails> getLeadProductDetails() {
//		return leadProductDetails;
//	}
//
//	public void setLeadProductDetails(List<LeadProductDetails> leadProductDetails) {
//		this.leadProductDetails = leadProductDetails;
//	}

	public Set<Employee> getEmloyies() {
		return emloyies;
	}

	public void setEmloyies(Set<Employee> emloyies) {
		this.emloyies = emloyies;
	}

	public Set<Product> getProduct() {
		return product;
	}

	public void setProduct(Set<Product> product) {
		this.product = product;
	}

	public List<Long> getProductIds() {
		return productIds;
	}

	public void setProductIds(List<Long> productIds) {
		this.productIds = productIds;
	}
	
	
}
