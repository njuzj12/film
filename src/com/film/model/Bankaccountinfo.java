package com.film.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tb_bankaccountinfo")
public class Bankaccountinfo extends BaseBean{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer bankAccountId;
	
	@Column(name = "password")
	private int password;
	
	@Column(name = "money")
	private int money;

	public Integer getBankAccountId() {
		return bankAccountId;
	}

	public void setBankAccountId(Integer bankAccountId) {
		this.bankAccountId = bankAccountId;
	}

	public int getPassword() {
		return password;
	}

	public void setPassword(int password) {
		this.password = password;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}
	
	
	
}
