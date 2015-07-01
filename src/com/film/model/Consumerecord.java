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
@Table(name = "tb_consumerecord")
public class Consumerecord extends BaseBean{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer consumeRecordId;
	
	@Column(name = "userId")
	private int userId;
	
	@Column(name = "planId")
	private int planId;
	
	@Column(name = "consumeMoney")
	private int consumeMoney;
	
	@Column(name = "payType")
	private String payType;
	
	@Column(name = "balance")
	private int balance;
	
	@Column(name = "createTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;

	public Integer getConsumeRecordId() {
		return consumeRecordId;
	}

	public void setConsumeRecordId(Integer consumeRecordId) {
		this.consumeRecordId = consumeRecordId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	

	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public int getConsumeMoney() {
		return consumeMoney;
	}

	public void setConsumeMoney(int consumeMoney) {
		this.consumeMoney = consumeMoney;
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

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	
	
}
