package com.withtrip.WithTrip.trip.model.vo;

import java.sql.Date;

public class TripBoard {
	private int boardId;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private Date modifyDate;
	private int boardCount;
	private String boardStatus;
	private Date tripStart;
	private Date tripEnd;
	private int partCount;
	private String email;
	private String nickName;
	private String preference;
	private String originalFileName;
	private String renameFileName;
	private int tripId;
	private int memberNo;
	
	public TripBoard(){}

	public TripBoard(int boardId, String boardTitle, String boardContent, Date createDate, Date modifyDate,
			int boardCount, String boardStatus, Date tripStart, Date tripEnd, int partCount, String email,
			String nickName, String preference, String originalFileName, String renameFileName, int tripId,
			int memberNo) {
		super();
		this.boardId = boardId;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.boardCount = boardCount;
		this.boardStatus = boardStatus;
		this.tripStart = tripStart;
		this.tripEnd = tripEnd;
		this.partCount = partCount;
		this.email = email;
		this.nickName = nickName;
		this.preference = preference;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.tripId = tripId;
		this.memberNo = memberNo;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public Date getTripStart() {
		return tripStart;
	}

	public void setTripStart(Date tripStart) {
		this.tripStart = tripStart;
	}

	public Date getTripEnd() {
		return tripEnd;
	}

	public void setTripEnd(Date tripEnd) {
		this.tripEnd = tripEnd;
	}

	public int getPartCount() {
		return partCount;
	}

	public void setPartCount(int partCount) {
		this.partCount = partCount;
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

	public String getPreference() {
		return preference;
	}

	public void setPreference(String preference) {
		this.preference = preference;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public int getTripId() {
		return tripId;
	}

	public void setTripId(int tripId) {
		this.tripId = tripId;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "TripBoard [boardId=" + boardId + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", boardCount=" + boardCount
				+ ", boardStatus=" + boardStatus + ", tripStart=" + tripStart + ", tripEnd=" + tripEnd + ", partCount="
				+ partCount + ", email=" + email + ", nickName=" + nickName + ", preference=" + preference
				+ ", originalFileName=" + originalFileName + ", renameFileName=" + renameFileName + ", tripId=" + tripId
				+ ", memberNo=" + memberNo + "]";
	}

}