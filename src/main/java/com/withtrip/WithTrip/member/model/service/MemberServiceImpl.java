package com.withtrip.WithTrip.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.withtrip.WithTrip.goods.model.vo.Reply;
import com.withtrip.WithTrip.member.model.dao.MemberDAO;
import com.withtrip.WithTrip.member.model.vo.Member;
import com.withtrip.WithTrip.member.model.vo.Report;
import com.withtrip.WithTrip.member.model.vo.TripReview;
import com.withtrip.WithTrip.order.model.vo.Order;
import com.withtrip.WithTrip.trip.model.vo.PageInfo;
import com.withtrip.WithTrip.trip.model.vo.TripBoard;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member login(Member m) { 
		return mDAO.login(sqlSession, m);
	}
	
	@Override
	public Member login(String email) { 
		return mDAO.login(sqlSession, email);
	}
	
	@Override
	public Member kakaoLogin(Member m) {
		return mDAO.kakaoLogin(sqlSession, m);
	}
	
	@Override
	public Member findId(Member m) {
		return mDAO.findId(sqlSession, m);
	}

	@Override
	public int findPwd(HashMap<String, String> map) {
		return mDAO.findPwd(sqlSession, map);
	}
	
	@Override
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqURL);
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			
			 
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
            
			sb.append("&client_id=19256f937719bb646ad0283784d67c5b"); //본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:9980/WithTrip/kakao.me"); // 본인이 설정한 주소
            
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
            
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
            
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
						JsonParser parser = new JsonParser();
						JsonElement element = parser.parse(result);
			            
						access_Token = element.getAsJsonObject().get("access_token").getAsString();
						refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
			            
						System.out.println("access_token : " + access_Token);
						System.out.println("refresh_token : " + refresh_Token);
			            
						br.close();
						bw.close();
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}

	@Override
	public HashMap<String, Object> getUserInfo(String access_Token) {
		

		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			System.out.println(userInfo);

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return userInfo;
		

	}
	
	
//	//카카오톡 로그아웃1(연결끊기 x그냥 토큰 로그아웃만)
//	@Override
//	public void kakaoLogout(String access_Token) {
//	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
//	     try {
//	         URL url = new URL(reqURL);
//	         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//	         conn.setRequestMethod("POST");
//	         conn.setRequestProperty("Authorization", "Bearer " + access_Token);
//
//	         int responseCode = conn.getResponseCode();
//	         System.out.println("responseCode : " + responseCode);
//
//	         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//
//	         String result = "";
//	         String line = "";
//
//	         while ((line = br.readLine()) != null) {
//	             result += line;
//	         }
//	         System.out.println(result);
//	     } catch (IOException e) {
//	         // TODO Auto-generated catch block
//	         e.printStackTrace();
//	     }
//	 }

	
	


	 //카카오톡 로그아웃2(연결을 끊어서 다시 로그인 시 이메일과 비밀번호 입력하게만들기)
	 @Override
	   public void unlink(String access_Token) {
	        String reqURL = "https://kapi.kakao.com/v1/user/unlink";
	          try {
	              URL url = new URL(reqURL);
	              HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	              conn.setRequestMethod("POST");
	              conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	              
	              int responseCode = conn.getResponseCode();
	              System.out.println("responseCode : " + responseCode);
	              
	              BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	              
	              String result = "";
	              String line = "";
	              
	              while ((line = br.readLine()) != null) {
	                  result += line;
	              }
	              System.out.println(result);
	          } catch (IOException e) {
	              e.printStackTrace();
	          }
	          
	}
	 
	 @Override
	public int countKakao(HashMap<String, Object> userInfo) {
		
		return mDAO.countKakao(sqlSession, userInfo);
	}
	
	@Override
	public int countMember(HashMap<String, Object> userInfo) {
		return mDAO.countMember(sqlSession, userInfo);
	}
	
	@Override
	public Member selectKakao(HashMap<String, Object> userInfo) {
		return mDAO.selectKakao(sqlSession, userInfo);
	}
	
	@Override
	public int insertkakao(Member m) {
		return mDAO.insertkakao(sqlSession, m);
	}
	
	
	@Override
	public int checkNick(String nickName) {
		return mDAO.checkNick(sqlSession, nickName);
	}
	
	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public int checkId(String id) {
		return mDAO.checkId(sqlSession, id);
	}	

	 // 여기부터 마이페이지 관련
	 // 회원 탈퇴
	@Override
	public int deleteUser(String email) {
		return mDAO.deleteUser(sqlSession, email);
	}
	// 회원 정보 수정
	@Override
	public int updateUser(Member m) {
		return mDAO.updateUser(sqlSession, m);
	}

	// 내가 쓴 동행 후기
	@Override
	public int getWrittenReviewListCount(String email) {
		return mDAO.getWrittenReviewListCount(sqlSession, email);
	}	
	@Override
	public ArrayList<TripReview> getWrittenReviewList(String email, PageInfo pi) {
		return mDAO.getWrittenReviewList(sqlSession, email, pi);
	}

	// 타인이 나에게 쓴 동행 후기
	@Override
	public int getReviewListCount(int mNo) {
		return mDAO.getReviewListCount(sqlSession, mNo);
	}
	@Override
	public ArrayList<TripReview> getReviewList(int mNo, PageInfo pi) {
		return mDAO.getReviewList(sqlSession, mNo, pi);
	}
	
	// 현재 비밀번호 확인
	@Override
	public int checkUserPwd(Member m) {
		return mDAO.checkUserPwd(sqlSession, m);
	}

	// 내가 작성한 용품 후기
	@Override
	public int getWrittenGoodsReviewListCount(String email) {
		return mDAO.getWrittenGoodsReviewListCount(sqlSession, email);
	}
	@Override
	public ArrayList<Reply> getWrittenGoodsReviewList(String email, PageInfo pi) {
		return mDAO.getWrittenGoodsReviewList(sqlSession, email, pi);
	}
	
	// 내가 작성한 동행 글
	@Override
	public int getWrittenTripListCount(String email) {
		return mDAO.getWrittenTripListCount(sqlSession, email);
	}
	@Override
	public ArrayList<TripBoard> getWrittenTripList(String email, PageInfo pi) {
		return mDAO.getWrittenTripList(sqlSession, email, pi);
	}
	
	// 비밀번호 변경
	@Override
	public int pwdUpdate(Member m) {
		return mDAO.pwdUpdate(sqlSession, m);
	}
	
	// 동행자 후기 등록
	@Override
	public int insertReview(TripReview trv) {
		return mDAO.insertReview(sqlSession, trv);
	}
	
	// 신고 등록
	@Override
	public int insertReport(Report r) {
		return mDAO.insertReport(sqlSession, r);
	}
	
	// 나에게 접수된 신고 리스트
	@Override
	public ArrayList<Report> selectReportToMe(String email) {
		return mDAO.selectReportToMe(sqlSession, email);
	}
	
	// 후기 대상 회원 정보 가져오기
	@Override
	public Member selectMember(Integer mNo) {
		return mDAO.selectMember(sqlSession, mNo);
	}
	// 07-04 주문 내역 리스트 카운트
	@Override
	public int selectMyOrderListCount(String email) {
		return mDAO.selectMyOrderListCount(sqlSession, email);
	}
	// 07-04 주문 내역 리스트
	@Override
	public ArrayList<Order> selectMyOrderList(String email, PageInfo pi) {
		return mDAO.selectMyOrderList(sqlSession, pi, email);
	}







}
