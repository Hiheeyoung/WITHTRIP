package com.withtrip.WithTrip.member.model.vo;

import java.sql.Date;

public class Report {
	private int report_id;
	private String report_content;
	private Date report_date;
	private String report_yn;		// 접수:Y, 허위:N
	private int rcate_no;
	private String report_user;		// 신고 한 회원 이메일
	private String target_user;		// 신고 당한 회원 이메일
	
	public Report() {}

	public Report(int report_id, String report_content, Date report_date, String report_yn, int rcate_no,
			String report_user, String target_user) {
		super();
		this.report_id = report_id;
		this.report_content = report_content;
		this.report_date = report_date;
		this.report_yn = report_yn;
		this.rcate_no = rcate_no;
		this.report_user = report_user;
		this.target_user = target_user;
	}

	public int getReport_id() {
		return report_id;
	}

	public void setReport_id(int report_id) {
		this.report_id = report_id;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	public String getReport_yn() {
		return report_yn;
	}

	public void setReport_yn(String report_yn) {
		this.report_yn = report_yn;
	}

	public int getRcate_no() {
		return rcate_no;
	}

	public void setRcate_no(int rcate_no) {
		this.rcate_no = rcate_no;
	}

	public String getReport_user() {
		return report_user;
	}

	public void setReport_user(String report_user) {
		this.report_user = report_user;
	}

	public String getTarget_user() {
		return target_user;
	}

	public void setTarget_user(String target_user) {
		this.target_user = target_user;
	}

	@Override
	public String toString() {
		return "Report [report_id=" + report_id + ", report_content=" + report_content + ", report_date=" + report_date
				+ ", report_yn=" + report_yn + ", rcate_no=" + rcate_no + ", report_user=" + report_user
				+ ", target_user=" + target_user + "]";
	}
	
}
