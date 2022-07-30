package com.withtrip.WithTrip.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	private int noticeId;
	private String noticeTitle;
	private String noticeContent;
	private int noticeCount;
	private Date noticeDate;
	private String noticeStatus;
	private String fix;
	private String email;
	private Date modifyDate;
	
	public Notice() {}

	public Notice(int noticeId, String noticeTitle, String noticeContent, int noticeCount, Date noticeDate,
			String noticeStatus, String fix, String email, Date modifyDate) {
		super();
		this.noticeId = noticeId;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeCount = noticeCount;
		this.noticeDate = noticeDate;
		this.noticeStatus = noticeStatus;
		this.fix = fix;
		this.email = email;
		this.modifyDate = modifyDate;
	}

	public int getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public int getNoticeCount() {
		return noticeCount;
	}

	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getNoticeStatus() {
		return noticeStatus;
	}

	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}

	public String getFix() {
		return fix;
	}

	public void setFix(String fix) {
		this.fix = fix;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	@Override
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeCount=" + noticeCount + ", noticeDate=" + noticeDate + ", noticeStatus=" + noticeStatus
				+ ", fix=" + fix + ", email=" + email + ", modifyDate=" + modifyDate + "]";
	}
	
	



}
