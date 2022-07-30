package com.withtrip.WithTrip.goods.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.withtrip.WithTrip.common.Attachment;
import com.withtrip.WithTrip.goods.model.dao.GoodsDAO;
import com.withtrip.WithTrip.goods.model.vo.Goods;
import com.withtrip.WithTrip.goods.model.vo.Reply;
import com.withtrip.WithTrip.goods.model.vo.PageInfo;

@Service("gService")
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsDAO gDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 게시글 작성
	@Override
	public int insertGoods(Goods g, ArrayList<Attachment> fileList) {
		int result1 = gDAO.insertGoods(sqlSession, g);
		int result2 = gDAO.insertFiles(sqlSession, fileList);
		
		return result1 + result2;
	}

	// 총 게시물 개수
	@Override
	public int getListCount() {
		return gDAO.getListCount(sqlSession);
	}
	
	// 게시물 리스트
	@Override
	public ArrayList<Goods> selectGList(PageInfo pi) {
		return gDAO.selectGList(sqlSession, pi);
	}

	// 게시글 상세보기(조회수 없음)
	@Override
	public Goods selectGoods(int gId) {
		return gDAO.selectGoods(sqlSession, gId);
	}

	// 게시글에 맞는 사진가져오기
	@Override
	public ArrayList<Attachment> selectFiles(int gId) {
		return gDAO.selectFiles(sqlSession, gId);
	}
	
	// 게시글 수정
	@Override
	public int updateGoods(Goods g, ArrayList<Attachment> fileList) {
		int result1 = gDAO.updateGoods(sqlSession, g);
		int result2 = gDAO.updateFiles(sqlSession, fileList);
		
		return result1 + result2; 
	}

	// 게시글 삭제
	@Override
	public int deleteGoods(int gId) {
		int result1 = gDAO.deleteGoods(sqlSession, gId);
		int result2 = gDAO.deleteFiles(sqlSession, gId);
		
		return result1 + result2;
	}

	// 검색 리스트 개수
	@Override
	public int getSearchListCount(String searchgName) {
		return gDAO.getSearchCount(sqlSession, searchgName);
	}
	
	// 검색 리스트 가져오기
	@Override
	public ArrayList<Goods> selectSearchList(String searchgName, PageInfo pi) {
		return gDAO.selectSearchList(sqlSession, searchgName, pi);
	}

	// 카테고리 게시글 리스트 가져오기
	@Override
	public ArrayList<Goods> selectCateList(String cate, PageInfo pi) {
		return gDAO.selectCateList(sqlSession, cate, pi);
	}
	
	// 카테고리 별 게시글 개수
	@Override
	public int getCateListCount(String cate) {
		return gDAO.getCateList(sqlSession, cate);
	}

	// 메인화면 용품 리스트
	@Override
	public ArrayList<Goods> mainGoodsList() {
		return gDAO.mainGoodsList(sqlSession);
	}
	
	// 댓글 등록(첨부파일 있을 때)
	@Override
	public int insertReply(Reply r, ArrayList<Attachment> fileList) {
		int result1 = gDAO.insertReply(sqlSession, r);
		int result2 = gDAO.insertReplyFiles(sqlSession, fileList);
		
		return result1 + result2;
	}
	
	// 댓글 등록(첨부파일 없을 때)
	@Override
	public int insertReply(Reply r) {
		return gDAO.insertReply(sqlSession, r);
	}
	
	// 댓글 목록 조회
	@Override
	public ArrayList<Reply> selectReplyList(int gId) {
		return gDAO.selectReplyList(sqlSession, gId);
	}
	
	// 댓글 첨부파일 목록 조회
	@Override
	public ArrayList<Attachment> selectReplyFList(int gId) {
		return gDAO.selectRFileList(sqlSession, gId);
	}

	// 댓글 수정
	@Override
	public int updateReply(Reply r) {
		return gDAO.updateReply(sqlSession, r);
	}

	// 댓글 삭제
	@Override
	public int deleteReply(int rId) {
		return gDAO.deleteReply(sqlSession, rId);
	}

	// 판매 중인 용품 리스트 개수
	@Override
	public int getSaleGListCount() {
		return gDAO.getSaleGListCount(sqlSession);
	}

	// 판매 중인 용품 리스트
	@Override
	public ArrayList<Goods> saleGoodsList(PageInfo pi) {
		return gDAO.saleGoodsList(sqlSession, pi);
	}

	// 선택 타입으로 리스트 조회
	@Override
	public ArrayList<Goods> selectType(PageInfo pi, HashMap<String, String> map) {
		return gDAO.selectType(sqlSession, pi, map);
	}


 }