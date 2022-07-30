package com.withtrip.WithTrip.admin.model.vo;

public class ByCate {
	private String cate1;
	private String cate2;
	private String cate3;
	
	public ByCate() {}

	public ByCate(String cate1, String cate2, String cate3) {
		super();
		this.cate1 = cate1;
		this.cate2 = cate2;
		this.cate3 = cate3;
	}

	public String getCate1() {
		return cate1;
	}

	public void setCate1(String cate1) {
		this.cate1 = cate1;
	}

	public String getCate2() {
		return cate2;
	}

	public void setCate2(String cate2) {
		this.cate2 = cate2;
	}

	public String getCate3() {
		return cate3;
	}

	public void setCate3(String cate3) {
		this.cate3 = cate3;
	}

	@Override
	public String toString() {
		return "ByCate [cate1=" + cate1 + ", cate2=" + cate2 + ", cate3=" + cate3 + "]";
	}
	
	
}
