package com.withtrip.WithTrip.goods.model.vo;

import java.sql.Date;

public class Reply {
	private int replyId;	// 댓글번호
	private Date createDate; // 댓글 작성일
	private String replyStatus; // 댓글 삭제 상태
	private String replyContent; // 댓글 내용
	private Date modifyDate; // 댓글 수정일
	private String email;	// 작성자 이메일(아이디)
	private String nickName;// 닉네임
	private int goodsId;	// 참조게시글 번호
	private String profileImg;	// 프로필 사진 파일 changeName
	private String manager_yn; // 관리자 여부
	private String attach_file; // 첨부파일 여부
	
	public Reply() {}

	public Reply(int replyId, Date createDate, String replyStatus, String replyContent, Date modifyDate, String email,
			String nickName, int goodsId, String profileImg, String manager_yn, String attach_file) {
		super();
		this.replyId = replyId;
		this.createDate = createDate;
		this.replyStatus = replyStatus;
		this.replyContent = replyContent;
		this.modifyDate = modifyDate;
		this.email = email;
		this.nickName = nickName;
		this.goodsId = goodsId;
		this.profileImg = profileImg;
		this.manager_yn = manager_yn;
		this.attach_file = attach_file;
	}

	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getManager_yn() {
		return manager_yn;
	}

	public void setManager_yn(String manager_yn) {
		this.manager_yn = manager_yn;
	}

	public String getAttach_file() {
		return attach_file;
	}

	public void setAttach_file(String attach_file) {
		this.attach_file = attach_file;
	}

	
	
	@Override
	public String toString() {
		return "Reply [replyId=" + replyId + ", createDate=" + createDate + ", replyStatus=" + replyStatus
				+ ", replyContent=" + replyContent + ", modifyDate=" + modifyDate + ", email=" + email + ", nickName="
				+ nickName + ", goodsId=" + goodsId + ", profileImg=" + profileImg + ", manager_yn=" + manager_yn
				+ ", attach_file=" + attach_file + "]";
	}

	
	
}
