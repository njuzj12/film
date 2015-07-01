package com.film.vo.user;

public class LoginVO {
	private String name;
	private String message;
	private boolean isSuccess;
	
	public LoginVO(String name, String message,boolean isSuccess) {
		super();
		this.name = name;
		this.message = message;
		this.isSuccess=isSuccess;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public boolean isSuccess() {
		return isSuccess;
	}
	public void setSuccess(boolean isSuccess) {
		this.isSuccess = isSuccess;
	}
	
	
}
