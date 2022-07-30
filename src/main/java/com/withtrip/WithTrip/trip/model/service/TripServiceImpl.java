package com.withtrip.WithTrip.trip.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.withtrip.WithTrip.common.Attachment;
import com.withtrip.WithTrip.trip.model.dao.TripDAO;
import com.withtrip.WithTrip.trip.model.vo.PageInfo;
import com.withtrip.WithTrip.trip.model.vo.TripBoard;

@Service("tService")
public class TripServiceImpl implements TripService{
	
	@Autowired
	private TripDAO tDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	//페이징
	@Override
	public int getListCount() {
		return tDAO.getListCount(sqlSession);
	}
	//게시글 리스트 가져오기
	@Override
	public ArrayList<TripBoard> getBoardList(PageInfo pi) {
		return tDAO.getBoardList(sqlSession, pi);
	}
	//동행 글작성
	@Override
	public int insertBoard(TripBoard t) {
		return tDAO.insertBoard(sqlSession, t);
	}
	//동행 글작성 사진첨부
	@Override
	public int insertFile(Attachment a) {
		return tDAO.insertFile(sqlSession,a);
	}
	//동행 글상세보기
	@Override
	public TripBoard selectBoard(int bId) {
		//조회수 + 게시물조회
		int result = tDAO.addReadCount(sqlSession, bId);
		System.out.println("조회수 :" +result);
		TripBoard t = null;
		if(result > 0) {
			t = tDAO.selectBoard(sqlSession, bId);
		}
		System.out.println("글상세보기 :" +t);
		return t;
	}
	@Override
	public int updateBoard(TripBoard t) {
		return tDAO.updateBoard(sqlSession, t);
	}
	//게시글 수정한 파일 저장
	@Override
	public int updateFile(Attachment a) {
		return tDAO.updateFile(sqlSession, a);
	}
	//글상세 이미지 넣기
	@Override
	public Attachment selectFile(int bId) {
		return tDAO.selectFile(sqlSession, bId);
	}
	//글 삭제하기
	@Override
	public int deleteTripBoard(int bId) {
		return tDAO.deleteTripBoard(sqlSession, bId);
	}
	//글안에 파일 삭제하기
	@Override
	public int deleteFile(int bId) {
		return tDAO.deleteFile(sqlSession, bId);
	}
	//검색 카운트
	@Override
	public int getSearchListCount(HashMap<String, String> map) {
		return tDAO.getSearchListCount(sqlSession, map);
	}
	//검색 게시판
	@Override
	public ArrayList<TripBoard> getsearchBoardList(HashMap<String, String> map, PageInfo pi) {
		return tDAO.getsearchBoardList(sqlSession, map, pi);
	}
	//메인에 데이터 넘기기
	@Override
	public ArrayList<TripBoard> mainSelectList(int trip) {
		return tDAO.mainSelectList(sqlSession, trip);
	}
	// 내가 작성한 동행 글에서 삭제 하기
	@Override
	public String selectDeleteFileName(int bId) {
		return tDAO.selectDeleteFileName(sqlSession, bId);
	}
	//카테고리 카운트
	@Override
	public int getpreferenceListCount(String search) {
		return tDAO.getpreferenceListCount(sqlSession, search);
	}
	//카테고리 리스트
	@Override
	public ArrayList<TripBoard> getpreferenceList(String search, PageInfo pi) {
		return tDAO.getpreferenceList(sqlSession, search, pi);
	}
	//모집중인 글 카운트
	@Override
	public int getRecruitingListCount(String filt) {
		return tDAO.getRecruitingListCount(sqlSession, filt);
	}
	//모집중인 글 리스트
	@Override
	public ArrayList<TripBoard> getRecruitingList(String filt, PageInfo pi) {
		return tDAO.getRecruitingList(sqlSession, filt, pi);
	}
	
	

}
