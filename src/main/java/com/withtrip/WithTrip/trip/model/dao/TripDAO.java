package com.withtrip.WithTrip.trip.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.withtrip.WithTrip.common.Attachment;
import com.withtrip.WithTrip.trip.model.vo.PageInfo;
import com.withtrip.WithTrip.trip.model.vo.TripBoard;

@Repository("tDAO")
public class TripDAO {
	//페이징
	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("tripMapper.getListCount");
	}
	//페이지네이션
	public ArrayList<TripBoard> getBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("tripMapper.getBoardList", null, rowBounds);
	}
	//동행 글작성
	public int insertBoard(SqlSessionTemplate sqlSession, TripBoard t) {
		return sqlSession.insert("tripMapper.insertBoard", t);
	}
	//동행 글작성 사진첨부
	public int insertFile(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("tripMapper.insertFile", a);
	}
	//게시글 파일 리스트
	public ArrayList<Attachment> getFileList(SqlSessionTemplate sqlSession, PageInfo pi) {
		return sqlSession.selectOne("tripMapper.getFileList", pi);
	}
	//조회수
	public int addReadCount(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("tripMapper.addReadCount", bId);
	}
	//글 상세보기
	public TripBoard selectBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("tripMapper.selectBoard", bId);
	}
	public int updateBoard(SqlSessionTemplate sqlSession, TripBoard t) {
		return sqlSession.update("tripMapper.updateBoard", t);
	}
	public int updateFile(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.update("tripMapper.updateFile", a);
	}
	//글작성 파일가져오기
	public Attachment selectFile(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("tripMapper.selectFile", bId);
	}
	//글 삭제하기
	public int deleteTripBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("tripMapper.deleteTripBoard", bId);
	}
	//파일 삭제하기
	public int deleteFile(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("tripMapper.deleteFile", bId);
	}
	// 내가 작성한 동행 글에서 삭제 시에 삭제할 파일 changeName가져오기
	public String selectDeleteFileName(SqlSessionTemplate sqlSession, int bId) {
	   return sqlSession.selectOne("tripMapper.getDeleteFileName", bId);
	}
	//검색 리스트 카운트
	public int getSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("tripMapper.getSearchListCount", map);
	}
	//검색 게시판
	public ArrayList<TripBoard> getsearchBoardList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("tripMapper.getsearchBoardList", map, rowBounds);
	}
	//메인에 데이터 넘기기
	public ArrayList<TripBoard> mainSelectList(SqlSessionTemplate sqlSession, int trip) {
		return (ArrayList)sqlSession.selectList("tripMapper.mainSelectList", trip);
	}
	//취향 카테고리 카운트
	public int getpreferenceListCount(SqlSessionTemplate sqlSession, String search) {
		return sqlSession.selectOne("tripMapper.getpreferenceListCount", search);
	}
	//취향 카테고리 리스트
	public ArrayList<TripBoard> getpreferenceList(SqlSessionTemplate sqlSession, String search, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("tripMapper.getpreferenceList", search, rowBounds);
	}
	//모집중인 글 카운트
	public int getRecruitingListCount(SqlSessionTemplate sqlSession, String filt) {
		return sqlSession.selectOne("tripMapper.getRecruitingListCount", filt);
	}
	//모집중인글 리스트
	public ArrayList<TripBoard> getRecruitingList(SqlSessionTemplate sqlSession, String filt, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("tripMapper.getRecruitingList", filt, rowBounds);
	}
	
	
	
}
