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
@Table(name = "tb_question")
public class Question extends BaseBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer qId;
	
	@Column(name = "title")
    private String title;
	
	@Column(name = "a")
    private String a;
	
	@Column(name = "b")
    private String b;
	
	@Column(name = "c")
    private String c;
	
	@Column(name = "createTime")
    @Temporal(TemporalType.TIMESTAMP)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Date createTime;

	public Integer getqId() {
		return qId;
	}

	public void setqId(Integer qId) {
		this.qId = qId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getA() {
		return a;
	}

	public void setA(String a) {
		this.a = a;
	}

	public String getB() {
		return b;
	}

	public void setB(String b) {
		this.b = b;
	}

	public String getC() {
		return c;
	}

	public void setC(String c) {
		this.c = c;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
}
