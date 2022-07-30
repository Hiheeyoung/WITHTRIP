package com.withtrip.WithTrip.goods.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import com.withtrip.WithTrip.common.Attachment;
import com.withtrip.WithTrip.goods.model.vo.Goods;
import com.withtrip.WithTrip.goods.model.vo.Reply;
import com.withtrip.WithTrip.goods.model.vo.PageInfo;

public interface GoodsService {
	
	// 여행용품 게시글 작성
	int insertGoods(Goods g, ArrayList<Attachment> fileList);
	
	// 총 게시물 개수(페이징처리)
	int getListCount();
	
	// 여행용품 게시글 리스트 조회
	ArrayList<Goods> selectGList(PageInfo pi);

	// 게시글 상세보기
	Goods selectGoods(int gId);

	// 게시글에 해당하는 사진 조회
	ArrayList<Attachment> selectFiles(int gId);

	// 게시글 수정하기
	int updateGoods(Goods g, ArrayList<Attachment> fileList);

	// 게시글 삭제
	int deleteGoods(int gId);

	// 검색 상품 목록의 게시물 개수
	int getSearchListCount(String searchgName);

	// 검색 리스트 조회
	ArrayList<Goods> selectSearchList(String searchgName, PageInfo pi);

	// 카테고리 별 용품 리스트 조회
	ArrayList<Goods> selectCateList(String category, PageInfo pi);

	// 카테고리 별 게시글 개수(페이징 처리)
	int getCateListCount(String cate);

	// 메인화면 용품 리스트
	ArrayList<Goods> mainGoodsList();

	// 댓글 등록(첨부파일 있을 때)
	int insertReply(Reply r, ArrayList<Attachment> fileList);
	
	// 댓글 등록(첨부파일 없을 때)
    int insertReply(Reply r);
	
	// 댓글  목록 조회(gid로)
	ArrayList<Reply> selectReplyList(int gId);
	
	// 댓글 파일 조회
	ArrayList<Attachment> selectReplyFList(int gId);

	// 댓글 수정
	int updateReply(Reply r);

	// 댓글 삭제
	int deleteReply(int rId);
	
	// 판매 중인 상품 리스트
	ArrayList<Goods> saleGoodsList(PageInfo pi);

	// 판매 중인 상품 리스트 개수(페이징 처리)
	int getSaleGListCount();

	// 선택한 타입으로 용품 리스트 조회
	ArrayList<Goods> selectType(PageInfo pi, HashMap<String, String> map);

}
