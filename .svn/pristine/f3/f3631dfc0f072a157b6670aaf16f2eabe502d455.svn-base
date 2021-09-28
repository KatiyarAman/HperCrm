package com.sterp.multitenant.tenant.entity;

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

import com.sterp.multitenant.tenant.branch.entity.Branch;

@Entity
@Table(name = "user_branch_assign")
public class UserBranchAssign implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7791637397970145675L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column(name = "user_id")
	private Long userId;
	@Column(name = "branch_id")
	private Long branchId;
	@Column(name="default_login_branch")
	private boolean defaultBranch;
	
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="branch_id",insertable = false,updatable = false)
	private Branch branch;

	public long getId() {
		return id;
	}

	public Branch getBranch() {
		return branch;
	}

	public void setBranch(Branch branch) {
		this.branch = branch;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public void setBranchId(Long branchId) {
		this.branchId = branchId;
	}

	public Long getBranchId() {
		return branchId;
	}

	public void setBranchId(long branchId) {
		this.branchId = branchId;
	}
	
	

	public boolean isDefaultBranch() {
		return defaultBranch;
	}

	public void setDefaultBranch(boolean defaultBranch) {
		this.defaultBranch = defaultBranch;
	}

	@Override
	public String toString() {
		return "UserBranchAssign [id=" + id + ", userId=" + userId + ", branchId=" + branchId + "]";
	}

}
