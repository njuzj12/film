package com.film.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "tb_recharge")
public class Recharge extends BaseBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer rechargeId;
	
	@Column(name = "userId")
	private int userId;
	
	@Column(name = "rechargeNum")
	private int rechargeNum;
	
	@Column(name = "balance")
	private int balance;
	
	@Column(name = "createTime")
    @Temporal(TemporalType.TIMESTAMP)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Date createTime;

	
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Integer getRechargeId() {
		return rechargeId;
	}

	public void setRechargeId(Integer rechargeId) {
		this.rechargeId = rechargeId;
	}

	public int getRechargeNum() {
		return rechargeNum;
	}

	public void setRechargeNum(int rechargeNum) {
		this.rechargeNum = rechargeNum;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
}
