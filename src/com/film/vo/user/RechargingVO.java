package com.film.vo.user;
public class RechargingVO {
	private int binded;
	private int bankAccountId;
	public RechargingVO(int binded, int bankAccountId) {
		super();
		this.binded = binded;
		this.bankAccountId = bankAccountId;
	}
	public int getBinded() {
		return binded;
	}
	public void setBinded(int binded) {
		this.binded = binded;
	}
	public int getBankAccountId() {
		return bankAccountId;
	}
	public void setBankAccountId(int bankAccountId) {
		this.bankAccountId = bankAccountId;
	}
	
	
}
