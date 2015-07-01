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
@Table(name = "tb_book")
public class Book extends BaseBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer bookId;
	
	@Column(name = "userId")
	private int userId;
	
	@Column(name = "planId")
	private int planId;
	
	@Column(name = "price")
	private int price;
	
	@Column(name = "amount")
	private int amount;
	
	@Column(name = "state")
	private int state;
	
	@Column(name = "soldRow")
	private String soldRow;
	
	@Column(name = "soldColumn")
	private String soldColumn;


	@Column(name = "createTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;

	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSoldRow() {
		return soldRow;
	}

	public void setSoldRow(String soldRow) {
		this.soldRow = soldRow;
	}

	public String getSoldColumn() {
		return soldColumn;
	}

	public void setSoldColumn(String soldColumn) {
		this.soldColumn = soldColumn;
	}

	
	
	
}
