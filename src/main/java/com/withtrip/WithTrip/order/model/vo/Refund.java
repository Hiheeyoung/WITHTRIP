package com.withtrip.WithTrip.order.model.vo;

import java.sql.Date;

public class Refund {
	private String refundAmount;
	private String refundReason;
	private Date refundDate;
	private String orderNo;
	
	
	public Refund() {}


	public Refund(String refundAmount, String refundReason, Date refundDate, String orderNo) {
		super();
		this.refundAmount = refundAmount;
		this.refundReason = refundReason;
		this.refundDate = refundDate;
		this.orderNo = orderNo;
	}


	public String getRefundAmount() {
		return refundAmount;
	}


	public void setRefundAmount(String refundAmount) {
		this.refundAmount = refundAmount;
	}


	public String getRefundReason() {
		return refundReason;
	}


	public void setRefundReason(String refundReason) {
		this.refundReason = refundReason;
	}


	public Date getRefundDate() {
		return refundDate;
	}


	public void setRefundDate(Date refundDate) {
		this.refundDate = refundDate;
	}


	public String getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}


	@Override
	public String toString() {
		return "Refund [refundAmount=" + refundAmount + ", refundReason=" + refundReason + ", refundDate=" + refundDate
				+ ", orderNo=" + orderNo + "]";
	}
	
	
}
