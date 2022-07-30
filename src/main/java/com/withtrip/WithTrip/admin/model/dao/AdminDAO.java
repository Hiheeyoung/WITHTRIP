package com.withtrip.WithTrip.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.withtrip.WithTrip.admin.model.vo.ByCate;
import com.withtrip.WithTrip.admin.model.vo.Monthly;
import com.withtrip.WithTrip.goods.model.vo.Goods;
import com.withtrip.WithTrip.member.model.vo.Member;
import com.withtrip.WithTrip.member.model.vo.Report;
import com.withtrip.WithTrip.notice.model.vo.Notice;
import com.withtrip.WithTrip.order.model.vo.Order;
import com.withtrip.WithTrip.trip.model.vo.PageInfo;

@Repository("aDAO")
public class AdminDAO {

	public int getMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getMemberCount");
	}

	public ArrayList<Member> getMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("adminMapper.getMemberList", null, rowBounds);
	}

	public int getSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.getSearchListCount", map);
	}

	public ArrayList<Member> searchMember(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchMember", map, rowBounds);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String mId) {
		return sqlSession.update("adminMapper.deleteMember", mId);
	}

	public int suspendMember(SqlSessionTemplate sqlSession, String mId) {
		return sqlSession.update("adminMapper.suspendMember", mId);
	}

	public int unlockMember(SqlSessionTemplate sqlSession, String mId) {
		return sqlSession.update("adminMapper.unlockMember", mId);
	}

	public int getReportCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getReportCount");
	}
	
	public ArrayList<Report> getReportList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("adminMapper.getReportList", null, rowBounds);
	}

	public int reportTake(SqlSessionTemplate sqlSession, int rId) {
		return sqlSession.update("adminMapper.reportTake", rId);
	}

	public int getAddReCount(SqlSessionTemplate sqlSession, int rId) {
		return sqlSession.update("adminMapper.getAddReCount", rId);
	}


	public int getNoticeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getNoticeCount");
		
	}
	
	public ArrayList<Notice> getNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); 
		
		return (ArrayList)sqlSession.selectList("adminMapper.getNoticeList", null, rowBounds);
	}

	public int getGoodsCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getGoodsCount");
	}

	public ArrayList<Goods> getGoodsList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); 
		
		return (ArrayList)sqlSession.selectList("adminMapper.getGoodsList", null, rowBounds);
	}

	public int statusChangeN(SqlSessionTemplate sqlSession, int gId) {
		return sqlSession.update("adminMapper.statusChangeN", gId);
	}

	public int statusChangeY(SqlSessionTemplate sqlSession, int gId) {
		return sqlSession.update("adminMapper.statusChangeY", gId);
	}

	public ArrayList<Goods> searchGoods(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchGoods", map, rowBounds);
	}

	public ArrayList<Goods> selectGoodsOp(SqlSessionTemplate sqlSession, HashMap<String, Integer> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return  (ArrayList)sqlSession.selectList("adminMapper.selectGoodsOp", map, rowBounds);
	}

	public int getSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.getSearchGoodsCount", map);
	}

	public int getSelectCount(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("adminMapper.getSelectCount",map);
	}

	public int goodsUpdate(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.update("adminMapper.goodsUpdate", map);
	}

	public int getOrderCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getOrderCount");
	}

	public ArrayList<Goods> getOrderList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
				
		return (ArrayList)sqlSession.selectList("adminMapper.getOrderList", null, rowBounds);
	}

	public int getSearchOrderCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.getSearchOrderCount", map);
	}

	public ArrayList<Goods> searchOrder(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchOrder", map, rowBounds);


	}

	public int getSelectOrderCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.getSelectOrderCount", map);
	}

	public ArrayList<Order> selectOrderSt(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectOrderSt", map, rowBounds);
	}

	public int searchDateCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.searchDateCount", map);
	}

	public ArrayList<Order> searchDate(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchDate", map, rowBounds);
	}

	public int updateOrderSt(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("adminMapper.updateOrderSt", map);
	}


	public Integer getCate1(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getCate1");
	}

	public Integer getCate2(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getCate2");
	}

	public Integer getCate3(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getCate3");
	}

	public Integer getTodaysales(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getTodaysales");
	}

	public ArrayList<Order> topList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.topList");
	}

	public Integer getVariance(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getVariance");
	}

	public ArrayList<Monthly> monthAmount(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.monthAmount");
	}


}
