package com.withtrip.WithTrip.admin.model.vo;

public class Monthly {
	private String month;
	private String amount;
	
	public Monthly() {}

	public Monthly(String month, String amount) {
		super();
		this.month = month;
		this.amount = amount;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getAmount() {
		return amount;
	}

	public void getAmount(String count) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "Monthly [month=" + month + ", amount=" + amount + "]";
	}
	
	
	
}
