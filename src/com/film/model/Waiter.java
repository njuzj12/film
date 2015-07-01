package com.film.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tb_waiter")
public class Waiter extends BaseBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer waiterId;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "password")
	private String password;

	public Integer getWaiterId() {
		return waiterId;
	}

	public void setWaiterId(Integer waiterId) {
		this.waiterId = waiterId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
