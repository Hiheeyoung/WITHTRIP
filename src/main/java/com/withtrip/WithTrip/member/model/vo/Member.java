package com.withtrip.WithTrip.member.model.vo;

import java.sql.Date;

public class Member {
	private String email;
	private String userName;	// DB : USER_NAME
	private String userPwd;		// DB : USER_PWD
	private String nickName;
	private String phone;
	private String address;
	private String filePath;	// DB : FILE_PATH
	private String originName;	// DB : ORIGIN_NAME
	private String changeName;	// DB : CHANGE_NAME
	private String userStatus;	// DB : USER_STATUS
	private String managerYN;	// DB : MANAGER_YN
	private Date enrollDate;	// DB : ENROLL_DATE
	private Date modifyDate;	// DB : MODIFY_DATE
	private int reportCount;	// DB : REPORT_COUNT
	private String enrollType;	// DB : ENROLL_TYPE
	private int member_no;	//회원고유번호
	
	
	public Member() {}


	public Member(String email, String userName, String userPwd, String nickName, String phone, String address,
			String filePath, String originName, String changeName, String userStatus, String managerYN, Date enrollDate,
			Date modifyDate, int reportCount, String enrollType, int member_no) {
		super();
		this.email = email;
		this.userName = userName;
		this.userPwd = userPwd;
		this.nickName = nickName;
		this.phone = phone;
		this.address = address;
		this.filePath = filePath;
		this.originName = originName;
		this.changeName = changeName;
		this.userStatus = userStatus;
		this.managerYN = managerYN;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.reportCount = reportCount;
		this.enrollType = enrollType;
		this.member_no = member_no;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
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


	public String getUserStatus() {
		return userStatus;
	}


	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}


	public String getManagerYN() {
		return managerYN;
	}


	public void setManagerYN(String managerYN) {
		this.managerYN = managerYN;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public int getReportCount() {
		return reportCount;
	}


	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}


	public String getEnrollType() {
		return enrollType;
	}


	public void setEnrollType(String enrollType) {
		this.enrollType = enrollType;
	}


	public int getMember_no() {
		return member_no;
	}


	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}


	@Override
	public String toString() {
		return "Member [email=" + email + ", userName=" + userName + ", userPwd=" + userPwd + ", nickName=" + nickName
				+ ", phone=" + phone + ", address=" + address + ", filePath=" + filePath + ", originName=" + originName
				+ ", changeName=" + changeName + ", userStatus=" + userStatus + ", managerYN=" + managerYN
				+ ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", reportCount=" + reportCount
				+ ", enrollType=" + enrollType + ", member_no=" + member_no + "]";
	}

}