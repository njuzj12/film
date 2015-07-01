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
@Table(name = "tb_film")
public class Film extends BaseBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer filmId;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "photo")
	private String photo;
	
	@Column(name = "director")
	private String director;
	
	@Column(name = "actor")
	private String actor;
	
	@Column(name = "type")
	private String type;
	
	@Column(name = "price")
	private int price;
	
	@Column(name = "time")
	private int time;
	
	@Column(name = "state")
	private int state;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "createTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;

	public Integer getFilmId() {
		return filmId;
	}

	public void setFilmId(Integer filmId) {
		this.filmId = filmId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
