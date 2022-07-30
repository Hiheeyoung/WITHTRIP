package com.withtrip.WithTrip.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.withtrip.WithTrip.goods.model.vo.Reply;
import com.withtrip.WithTrip.member.model.vo.Member;
import com.withtrip.WithTrip.member.model.vo.Report;
import com.withtrip.WithTrip.member.model.vo.TripReview;
import com.withtrip.WithTrip.order.model.vo.Order;
import com.withtrip.WithTrip.trip.model.vo.PageInfo;
import com.withtrip.WithTrip.trip.model.vo.TripBoard;

public interface MemberService {
	
	Member login(Member m);
	
	Member login(String email);
	
	int findPwd(HashMap<String, String> map);
	
	String getAccessToken(String code);
	
	HashMap<String, Object> getUserInfo(String access_Token);
	
	Member findId(Member m);

	void unlink(String access_Token);

	int countKakao(HashMap<String, Object> userInfo);

	int countMember(HashMap<String, Object> userInfo);

	Member selectKakao(HashMap<String, Object> userInfo);

	int insertkakao(Member m);

	Member kakaoLogin(Member m);

	int checkNick(String nickName);

	int insertMember(Member m);

	int checkId(String id);

//	void kakaoLogout(String access_Token);
	
	// 여기부터 마이페이지 관련
	// 회원 탈퇴
	int deleteUser(String email);
	// 회원 정보 수정
	int updateUser(Member m);
	// 작성한 후기 리스트 개수
	int getWrittenReviewListCount(String email);
	// 작성한 후기 리스트
	ArrayList<TripReview> getWrittenReviewList(String email, PageInfo pi);
	//	다른 회원이 나에게 쓴 동행자 후기 리스트 카운트
	int getReviewListCount(int mNo);
	// 동행자 후기 리스트
	ArrayList<TripReview> getReviewList(int mNo, PageInfo pi);
	// 현재 비번 맞는지 확인
	int checkUserPwd(Member m);
	// 작성한 용품 후기 리스트 카운트
	int getWrittenGoodsReviewListCount(String email);
	// 작성한 용품 후기 리스트
	ArrayList<Reply> getWrittenGoodsReviewList(String email, PageInfo pi);
	// 작성한 동행 글 리스트 카운트
	int getWrittenTripListCount(String email);
	// 작성한 동행글 리스트
	ArrayList<TripBoard> getWrittenTripList(String email, PageInfo pi);
	// 비밀번호 수정
	int pwdUpdate(Member m);
	// 동행 후기 등록
	int insertReview(TripReview trv);
	// 신고 등록
	int insertReport(Report r);
	// 나에게 접수된 신고 리스트
	ArrayList<Report> selectReportToMe(String email);
	// 07-01 후기 대상 회원 정보 가져오기
	Member selectMember(Integer mNo);
	// 07-04 주문 내역 리스트 카운트
	int selectMyOrderListCount(String email);
	// 07-04 주문 내역 리스트
	ArrayList<Order> selectMyOrderList(String email, PageInfo pi);


}
