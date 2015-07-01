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
@Table(name = "tb_plan")
public class Plan extends BaseBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer planId;
	
	@Column(name = "filmId")
	private int filmId;
	
	@Column(name = "timeId")
	private int timeId;
	
	@Column(name = "state")
	private int state;
	@Column(name = "end")
	private int end;
	
	@Column(name = "playTime")
    private String playTime;
	
	@Column(name = "roomId")
	private int roomId;
	
	@Column(name = "sold")
	private String sold;
	
	@Column(name = "createTime")
    @Temporal(TemporalType.TIMESTAMP)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Date createTime;

	public Integer getPlanId() {
		return planId;
	}

	public void setPlanId(Integer planId) {
		this.planId = planId;
	}

	public int getFilmId() {
		return filmId;
	}

	public void setFilmId(int filmId) {
		this.filmId = filmId;
	}

	public int getTimeId() {
		return timeId;
	}

	public void setTimeId(int timeId) {
		this.timeId = timeId;
	}

	
	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getPlayTime() {
		return playTime;
	}

	public void setPlayTime(String playTime) {
		this.playTime = playTime;
	}
	

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public String getSold() {
		return sold;
	}

	public void setSold(String sold) {
		this.sold = sold;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
}
