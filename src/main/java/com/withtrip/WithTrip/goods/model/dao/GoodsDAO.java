package com.withtrip.WithTrip.goods.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.withtrip.WithTrip.common.Attachment;
import com.withtrip.WithTrip.goods.model.vo.Goods;
import com.withtrip.WithTrip.goods.model.vo.Reply;
import com.withtrip.WithTrip.goods.model.vo.PageInfo;


@Repository("gDAO")
public class GoodsDAO {

	// GOODS 테이블에 데이터 insert
	public int insertGoods(SqlSessionTemplate sqlSession, Goods g) {
		return sqlSession.insert("goodsMapper.insertGoods", g);
	}

	// attachment에 데이터 insert
	public int insertFiles(SqlSessionTemplate sqlSession, ArrayList<Attachment> fileList) {
		int result = 0;
		
		for(Attachment a : fileList) {
			result += sqlSession.insert("goodsMapper.insertFiles", a);
		}
		
		return result;
	}

	// 게시물 개수 조회(페이징 처리)
	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("goodsMapper.getListCount");
	}
	
	// 게시글 리스트 조회
	public ArrayList<Goods> selectGList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// 첫번째 페이지의 게시물 개수만큼 건너뛰고 나오게 하기
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit(); 
		
		// BoardLimit : 한 페이지에 표시될 게시글의 수
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("goodsMapper.getGoodsList", null, rowBounds);
	}

	// 게시글 상세보기 - 게시글 정보 조회
	public Goods selectGoods(SqlSessionTemplate sqlSession, int gId) {
		return sqlSession.selectOne("goodsMapper.selectGoods", gId);
	}

	// 게시글 상세보기 - 게시글 사진 조회
	public ArrayList<Attachment> selectFiles(SqlSessionTemplate sqlSession, int gId) {
		return (ArrayList)sqlSession.selectList("goodsMapper.selectFiles", gId);
	}
	
	// 게시글 수정
	public int updateGoods(SqlSessionTemplate sqlSession, Goods g) {
		return sqlSession.update("goodsMapper.updateGoods", g);
	}

	// 사진 수정
	public int updateFiles(SqlSessionTemplate sqlSession, ArrayList<Attachment> fileList) {
		int result = 0;
		
		for(Attachment a : fileList) {
			result += sqlSession.update("goodsMapper.updateFiles", a);
		}
		return result;
	}
	
	// 게시글 삭제
    public int deleteGoods(SqlSessionTemplate sqlSession, int gId) {
	      return sqlSession.delete("goodsMapper.deleteGoods", gId);
	}

    // 사진 삭제
	public int deleteFiles(SqlSessionTemplate sqlSession, int gId) {
		return sqlSession.delete("goodsMapper.deleteFiles",gId);
	}
	
	// 검색 리스트 개수
	public int getSearchCount(SqlSessionTemplate sqlSession, String searchgName) {
		return sqlSession.selectOne("goodsMapper.getSearchCount", searchgName);
	}

	// 검색 리스트
	public ArrayList<Goods> selectSearchList(SqlSessionTemplate sqlSession, String searchgName, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("goodsMapper.selectSearchList", searchgName, rowBounds);
	}

	// 카테고리 리스트
	public ArrayList<Goods> selectCateList(SqlSessionTemplate sqlSession, String cate, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("goodsMapper.selectCateList", cate, rowBounds);
	}
	
	// 카테고리별 게시글 개수
	public int getCateList(SqlSessionTemplate sqlSession, String category) {
		return sqlSession.selectOne("goodsMapper.getCateCount", category);
	}

	// 구매하기 물품 정보 
	public ArrayList<Goods> mainGoodsList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("goodsMapper.selectMainGoods");
	}

	// 댓글 등록
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("goodsMapper.insertReply", r);
	}
	
	// 댓글 사진 첨부
	public int insertReplyFiles(SqlSessionTemplate sqlSession, ArrayList<Attachment> fileList) {
		int result = 0;
		
		for(Attachment a : fileList) {
			result += sqlSession.insert("goodsMapper.insertReplyFiles", a);
		}
		return result;
	}
	
	// 댓글 목록 조회
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int gId) {
		return (ArrayList)sqlSession.selectList("goodsMapper.selectReplyList", gId);
	}
	
	// 댓글 첨부 파일 조회
	public ArrayList<Attachment> selectRFileList(SqlSessionTemplate sqlSession, int gId) {
		return (ArrayList)sqlSession.selectList("goodsMapper.selectRFiles", gId);
	}
	
	// 댓글 수정
	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("goodsMapper.updateReply", r);
	}

	// 댓글 삭제
	public int deleteReply(SqlSessionTemplate sqlSession, int rId) {
		return sqlSession.delete("goodsMapper.deleteReply", rId);
	}

	// 판매중인 용품 리스트 개수 조회
	public int getSaleGListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("goodsMapper.getSaleGCounts");
	}

	// 판매 중인 용품 리스트 조회
	public ArrayList<Goods> saleGoodsList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("goodsMapper.getSaleGoodsList", null, rowBounds);
	}

	// 선택한 타입으로 글 목록 불러오기
	public ArrayList<Goods> selectType(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
	
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		if(map.get("pathname").equals("/WithTrip/saleGoods.go")) {
			return (ArrayList)sqlSession.selectList("goodsMapper.selectTypeSoldOut", map, rowBounds);
		} else {
			return (ArrayList)sqlSession.selectList("goodsMapper.selectType", map, rowBounds);
		}	
	}

}
