package com.withtrip.WithTrip.goods.model.vo;

public class Goods {

	private int goodsId;
	private String goodsName;
	private String price;
	private int stock;
	private int gcateNo;
	private String gContent;
	private int boardId;
	private String originName;
	private String changeName;
	private String status;
	private String goodsBrand;
	private String goodsSize;
	private String goodsColor;
	
	
	public Goods() {
		super();
	}


	public Goods(int goodsId, String goodsName, String price, int stock, int gcateNo, String gContent, int boardId,
			String originName, String changeName, String status, String goodsBrand, String goodsSize,
			String goodsColor) {
		super();
		this.goodsId = goodsId;
		this.goodsName = goodsName;
		this.price = price;
		this.stock = stock;
		this.gcateNo = gcateNo;
		this.gContent = gContent;
		this.boardId = boardId;
		this.originName = originName;
		this.changeName = changeName;
		this.status = status;
		this.goodsBrand = goodsBrand;
		this.goodsSize = goodsSize;
		this.goodsColor = goodsColor;
	}


	public int getGoodsId() {
		return goodsId;
	}


	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}


	public String getGoodsName() {
		return goodsName;
	}


	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}


	public int getStock() {
		return stock;
	}


	public void setStock(int stock) {
		this.stock = stock;
	}


	public int getGcateNo() {
		return gcateNo;
	}


	public void setGcateNo(int gcateNo) {
		this.gcateNo = gcateNo;
	}


	public String getgContent() {
		return gContent;
	}


	public void setgContent(String gContent) {
		this.gContent = gContent;
	}


	public int getBoardId() {
		return boardId;
	}


	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}


	public String getOriginName() {
		return originName;
	}


	public void setOriginName(String originName) {
		this.originName = originName;
	}


	public String getChangeName() {
		return changeName;
	}


	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getGoodsBrand() {
		return goodsBrand;
	}


	public void setGoodsBrand(String goodsBrand) {
		this.goodsBrand = goodsBrand;
	}


	public String getGoodsSize() {
		return goodsSize;
	}


	public void setGoodsSize(String goodsSize) {
		this.goodsSize = goodsSize;
	}


	public String getGoodsColor() {
		return goodsColor;
	}


	public void setGoodsColor(String goodsColor) {
		this.goodsColor = goodsColor;
	}


	@Override
	public String toString() {
		return "Goods [goodsId=" + goodsId + ", goodsName=" + goodsName + ", price=" + price + ", stock=" + stock
				+ ", gcateNo=" + gcateNo + ", gContent=" + gContent + ", boardId=" + boardId + ", originName="
				+ originName + ", changeName=" + changeName + ", status=" + status + ", goodsBrand=" + goodsBrand
				+ ", goodsSize=" + goodsSize + ", goodsColor=" + goodsColor + "]";
	}


	
	
}
