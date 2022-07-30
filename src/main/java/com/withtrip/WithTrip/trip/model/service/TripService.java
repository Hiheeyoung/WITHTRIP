package com.withtrip.WithTrip.trip.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.withtrip.WithTrip.common.Attachment;
import com.withtrip.WithTrip.trip.model.vo.PageInfo;
import com.withtrip.WithTrip.trip.model.vo.TripBoard;

public interface TripService {
	//페이징
	int getListCount();
	//게시글 리스트 가져오기
	ArrayList<TripBoard> getBoardList(PageInfo pi);
	//동행 글작성
	int insertBoard(TripBoard t);
	//동행 글작성 사진가져오기
	int insertFile(Attachment a);
	//글상세보기
	TripBoard selectBoard(int bId);
	//글수정
	int updateBoard(TripBoard t);
	//게시글수정한 파일저장
	int updateFile(Attachment a);
	//글작성파일가져오기
	Attachment selectFile(int bId);
	//동행 게시글 삭제하기
	int deleteTripBoard(int bId);
	//동행 게시글파일 삭제하기
	int deleteFile(int bId);
	//검색 리스트카운트
	int getSearchListCount(HashMap<String, String> map);
	//검색 게시판
	ArrayList<TripBoard> getsearchBoardList(HashMap<String, String> map, PageInfo pi);
	//메인에 데이터 넘기기
	ArrayList<TripBoard> mainSelectList(int trip);
	// 내가 작성한 동행 글에서 삭제 하기
	String selectDeleteFileName(int bId);
	//취향카테고리
	int getpreferenceListCount(String search);
	//취향카테고리 리스트
	ArrayList<TripBoard> getpreferenceList(String search, PageInfo pi);
	//모집중인 글 카운트
	int getRecruitingListCount(String filt);
	//모집중인 글 리스트
	ArrayList<TripBoard> getRecruitingList(String filt, PageInfo pi);

}
