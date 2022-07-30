package com.withtrip.WithTrip.order.model.vo;

import java.sql.Date;

public class Order {
	private String orderNo;			// 주문 번호
	private Date orderDate;			// 주문일
	private String price;			// 결제 금액
	private String orderAddress;	// 배송지
	private String zipCode;			// 배송지 우편 번호
	private String shipNo;			// 운송장 번호
	private String recipient;		// 수령인 이름
	private String email;			// 주문인 이메일
	private int goodsId;			// 주문 용품 번호
	private String refund;			// 환불 여부. 기본:payed, 환불 시: refund
	private String payNO;			// 결제 번호
	private String approvalNo;		// 승인 번호
	private String phone;			// 수령인 전화 번호
	private String goodsName;
	private String receiptUrl;
	
	public Order() {
		
	}

	public Order(String orderNo, Date orderDate, String price, String orderAddress, String zipCode, String shipNo,
			String recipient, String email, int goodsId, String refund, String payNO, String approvalNo, String phone,
			String goodsName, String receiptUrl) {
		super();
		this.orderNo = orderNo;
		this.orderDate = orderDate;
		this.price = price;
		this.orderAddress = orderAddress;
		this.zipCode = zipCode;
		this.shipNo = shipNo;
		this.recipient = recipient;
		this.email = email;
		this.goodsId = goodsId;
		this.refund = refund;
		this.payNO = payNO;
		this.approvalNo = approvalNo;
		this.phone = phone;
		this.goodsName = goodsName;
		this.receiptUrl = receiptUrl;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getShipNo() {
		return shipNo;
	}

	public void setShipNo(String shipNo) {
		this.shipNo = shipNo;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public String getRefund() {
		return refund;
	}

	public void setRefund(String refund) {
		this.refund = refund;
	}

	public String getPayNO() {
		return payNO;
	}

	public void setPayNO(String payNO) {
		this.payNO = payNO;
	}

	public String getApprovalNo() {
		return approvalNo;
	}

	public void setApprovalNo(String approvalNo) {
		this.approvalNo = approvalNo;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getReceiptUrl() {
		return receiptUrl;
	}

	public void setReceiptUrl(String receiptUrl) {
		this.receiptUrl = receiptUrl;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", orderDate=" + orderDate + ", price=" + price + ", orderAddress="
				+ orderAddress + ", zipCode=" + zipCode + ", shipNo=" + shipNo + ", recipient=" + recipient + ", email="
				+ email + ", goodsId=" + goodsId + ", refund=" + refund + ", payNO=" + payNO + ", approvalNo="
				+ approvalNo + ", phone=" + phone + ", goodsName=" + goodsName + ", receiptUrl=" + receiptUrl + "]";
	}

}
