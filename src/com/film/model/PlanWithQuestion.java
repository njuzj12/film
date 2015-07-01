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
@Table(name = "tb_planWithQuestion")
public class PlanWithQuestion extends BaseBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
	
	@Column(name = "filmId")
	private int filmId;
	
	@Column(name = "qId")
	private int qId;
	
	@Column(name = "aNum")
	private int aNum;
	
	@Column(name = "bNum")
	private int bNum;
	
	@Column(name = "cNum")
	private int cNum;
	
	@Column(name = "createTime")
    @Temporal(TemporalType.TIMESTAMP)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Date createTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getFilmId() {
		return filmId;
	}

	public void setFilmId(int filmId) {
		this.filmId = filmId;
	}

	public int getqId() {
		return qId;
	}

	public void setqId(int qId) {
		this.qId = qId;
	}

	public int getaNum() {
		return aNum;
	}

	public void setaNum(int aNum) {
		this.aNum = aNum;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public int getcNum() {
		return cNum;
	}

	public void setcNum(int cNum) {
		this.cNum = cNum;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
	
}
