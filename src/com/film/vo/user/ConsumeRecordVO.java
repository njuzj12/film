package com.film.vo.user;

import java.util.Date;

public class ConsumeRecordVO {
	String filmName;
	int consumeMoney;
	String payType;
	int balance;
	Date createTime;
	public String getFilmName() {
		return filmName;
	}
	public void setFilmName(String filmName) {
		this.filmName = filmName;
	}
	public int getConsumeMoney() {
		return consumeMoney;
	}
	public void setConsumeMoney(int consumeMoney) {
		this.consumeMoney = consumeMoney;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
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
