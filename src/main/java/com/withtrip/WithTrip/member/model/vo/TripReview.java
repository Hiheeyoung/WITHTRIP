package com.withtrip.WithTrip.member.model.vo;

import java.sql.Date;

public class TripReview {
	private int review_id;
	private String review_content;	// 후기 내용
	private String review_writer;	// 후기 작성 회원
	private String email;			// 후기 대상 회원
	private Date review_date;		// 후기 작성 날짜
	private String treview_status;	// 게시 여부
	private String writer_nickname;	// 작성 회원 닉네임
	private String review_nickname;	// 대상 회원 닉네임
	private int member_no;	// 후기 대상 회원 고유 번호
	private String file_path;	// 작성 회원 프로필 사진 및 상태
	private String origin_name;
	private String change_name;
	private String user_status;
	
	public TripReview() {}

	public TripReview(int review_id, String review_content, String review_writer, String email, Date review_date,
			String treview_status, String writer_nickname, String review_nickname, int member_no, String file_path,
			String origin_name, String change_name, String user_status) {
		super();
		this.review_id = review_id;
		this.review_content = review_content;
		this.review_writer = review_writer;
		this.email = email;
		this.review_date = review_date;
		this.treview_status = treview_status;
		this.writer_nickname = writer_nickname;
		this.review_nickname = review_nickname;
		this.member_no = member_no;
		this.file_path = file_path;
		this.origin_name = origin_name;
		this.change_name = change_name;
		this.user_status = user_status;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_writer() {
		return review_writer;
	}

	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	public String getTreview_status() {
		return treview_status;
	}

	public void setTreview_status(String treview_status) {
		this.treview_status = treview_status;
	}

	public String getWriter_nickname() {
		return writer_nickname;
	}

	public void setWriter_nickname(String writer_nickname) {
		this.writer_nickname = writer_nickname;
	}

	public String getReview_nickname() {
		return review_nickname;
	}

	public void setReview_nickname(String review_nickname) {
		this.review_nickname = review_nickname;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getOrigin_name() {
		return origin_name;
	}

	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}

	public String getChange_name() {
		return change_name;
	}

	public void setChange_name(String change_name) {
		this.change_name = change_name;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	@Override
	public String toString() {
		return "TripReview [review_id=" + review_id + ", review_content=" + review_content + ", review_writer="
				+ review_writer + ", email=" + email + ", review_date=" + review_date + ", treview_status="
				+ treview_status + ", writer_nickname=" + writer_nickname + ", review_nickname=" + review_nickname
				+ ", member_no=" + member_no + ", file_path=" + file_path + ", origin_name=" + origin_name
				+ ", change_name=" + change_name + ", user_status=" + user_status + "]";
	}

}
