package com.sterp.multitenant.tenant.employee.dto;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.sterp.multitenant.tenant.settings.template.entity.CustomFieldData;

public class EmployeeDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5266868936178725196L;
	private long id;
	private Long departmentId;
	private Long designationId;
	private String firstName;
	private String lastName;
	private String middleName;
	private String fatherName;
	private Long reportingManager;
	private LocalDate dob;
	private LocalDate joiningDate;
	private Long reportingBranch;
	private Boolean erpUser;
	private String empCode;
	private String gender;
	private Long status;
	private List<CustomFieldData> customFieldDatas = new ArrayList<CustomFieldData>();

	public EmployeeDTO(long id, Long departmentId, Long designationId, String firstName, String lastName, String middleName,
			String fatherName, Long reportingManager, LocalDate dob, LocalDate joiningDate, Long reportingBranch,
			Boolean erpUser, String empCode, String gender, Long status) {
		this.id = id;
		this.departmentId = departmentId;
		this.designationId = designationId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.middleName = middleName;
		this.fatherName = fatherName;
		this.reportingManager = reportingManager;
		this.dob = dob;
		this.joiningDate = joiningDate;
		this.reportingBranch = reportingBranch;
		this.erpUser = erpUser;
		this.empCode = empCode;
		this.gender = gender;
		this.status = status;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	

	public Long getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Long departmentId) {
		this.departmentId = departmentId;
	}

	public Long getDesignationId() {
		return designationId;
	}

	public void setDesignationId(Long designationId) {
		this.designationId = designationId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public Long getReportingManager() {
		return reportingManager;
	}

	public void setReportingManager(Long reportingManager) {
		this.reportingManager = reportingManager;
	}

	public LocalDate getDob() {
		return dob;
	}

	public void setDob(LocalDate dob) {
		this.dob = dob;
	}

	public LocalDate getJoiningDate() {
		return joiningDate;
	}

	public void setJoiningDate(LocalDate joiningDate) {
		this.joiningDate = joiningDate;
	}

	public Long getReportingBranch() {
		return reportingBranch;
	}

	public void setReportingBranch(Long reportingBranch) {
		this.reportingBranch = reportingBranch;
	}

	public Boolean getErpUser() {
		return erpUser;
	}

	public void setErpUser(Boolean erpUser) {
		this.erpUser = erpUser;
	}

	public String getEmpCode() {
		return empCode;
	}

	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}

	public List<CustomFieldData> getCustomFieldDatas() {
		return customFieldDatas;
	}

	public void setCustomFieldDatas(List<CustomFieldData> customFieldDatas) {
		this.customFieldDatas = customFieldDatas;
	}

	@Override
	public String toString() {
		return "EmployeeDTO [id=" + id + ", departmentId=" + departmentId + ", designationId=" + designationId + ", firstName="
				+ firstName + ", lastName=" + lastName + ", middleName=" + middleName + ", fatherName=" + fatherName
				+ ", reportingManager=" + reportingManager + ", dob=" + dob + ", joiningDate=" + joiningDate
				+ ", reportingBranch=" + reportingBranch + ", erpUser=" + erpUser + ", empCode=" + empCode + ", gender="
				+ gender + ", status=" + status + ", customFieldDatas=" + customFieldDatas + "]";
	}

	

}
