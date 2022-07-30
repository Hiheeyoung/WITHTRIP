package com.withtrip.WithTrip.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withtrip.WithTrip.admin.model.dao.AdminDAO;
import com.withtrip.WithTrip.admin.model.vo.ByCate;
import com.withtrip.WithTrip.admin.model.vo.Monthly;
import com.withtrip.WithTrip.goods.model.vo.Goods;
import com.withtrip.WithTrip.member.model.vo.Report;
import com.withtrip.WithTrip.member.model.vo.Member;
import com.withtrip.WithTrip.notice.model.vo.Notice;
import com.withtrip.WithTrip.order.model.vo.Order;
import com.withtrip.WithTrip.trip.model.vo.PageInfo;

@Service("aService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO aDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getMemberCount() {
		return aDAO.getMemberCount(sqlSession);
	}

	@Override
	public ArrayList<Member> getMemberList(PageInfo pi){
		return aDAO.getMemberList(sqlSession, pi);
	}

	@Override
	public int getSearchListCount(HashMap<String, String> map) {
		return aDAO.getSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Member> searchMember(HashMap<String, String> map, PageInfo pi) {
		return aDAO.searchMember(sqlSession, map, pi);
	}

	@Override
	public int deleteMember(String mId) {
		return aDAO.deleteMember(sqlSession, mId);
	}
	
	@Override
	public int suspendMember(String mId) {
		return aDAO.suspendMember(sqlSession, mId);
	}

	@Override
	public int unlockMember(String mId) {
		return aDAO.unlockMember(sqlSession, mId);
	}

	@Override
	public int getReportCount() {
		return aDAO.getReportCount(sqlSession);
	}
	
	@Override
	public ArrayList<Report> getReportList(PageInfo pi) {
		return aDAO.getReportList(sqlSession, pi);
	}

	@Override
	public int reportTake(int rId) {
		return aDAO.reportTake(sqlSession, rId);
	}

	@Override
	public int getAddReCount(int rId) {
		return aDAO.getAddReCount(sqlSession, rId);
	}


	@Override
	public int getNoticeCount() {
		return aDAO.getNoticeCount(sqlSession);
	}
	
	@Override
	public ArrayList<Notice> getNoticeList(PageInfo pi) {
		return aDAO.getNoticeList(sqlSession, pi);
	}

	@Override
	public int getGoodsCount() {
		return aDAO.getGoodsCount(sqlSession);
	}

	@Override
	public ArrayList<Goods> getGoodsList(PageInfo pi) {
		return aDAO.getGoodsList(sqlSession, pi);
	}

	@Override
	public int statusChangeN(int gId) {
		return aDAO.statusChangeN(sqlSession, gId);
	}

	@Override
	public int statusChangeY(int gId) {
		return aDAO.statusChangeY(sqlSession, gId);
	}

	@Override
	public ArrayList<Goods> searchGoods(HashMap<String, String> map, PageInfo pi) {
		return aDAO.searchGoods(sqlSession, map, pi);
	}

	@Override
	public ArrayList<Goods> selectGoodsOp(HashMap<String, Integer> map, PageInfo pi) {
		return aDAO.selectGoodsOp(sqlSession, map, pi);
	}

	@Override
	public int getSearchCount(HashMap<String, String> map) {
		return aDAO.getSearchCount(sqlSession, map);
	}

	@Override
	public int getSelectCount(HashMap<String, Integer> map) {
		return aDAO.getSelectCount(sqlSession, map);
	}

	@Override
	public int goodsUpdate(HashMap<String, Integer> map) {
		return aDAO.goodsUpdate(sqlSession, map);
	}

	@Override
	public int getOrderCount() {
		return aDAO.getOrderCount(sqlSession);
	}

	@Override
	public ArrayList<Goods> getOrderList(PageInfo pi) {
		return aDAO.getOrderList(sqlSession, pi);
	}

	@Override
	public int getSearchOrderCount(HashMap<String, String> map) {
		return aDAO.getSearchOrderCount(sqlSession, map);
	}

	@Override
	public ArrayList<Goods> searchOrder(HashMap<String, String> map, PageInfo pi) {
		return aDAO.searchOrder(sqlSession, map, pi);
	}

	@Override
	public int getSelectOrderCount(HashMap<String, String> map) {
		return aDAO.getSelectOrderCount(sqlSession, map);
	}

	@Override
	public ArrayList<Order> selectOrderSt(HashMap<String, String> map, PageInfo pi) {
		return aDAO.selectOrderSt(sqlSession, map, pi);
	}

	@Override
	public int searchDateCount(HashMap<String, String> map) {
		return aDAO.searchDateCount(sqlSession, map);
	}

	@Override
	public ArrayList<Order> searchDate(HashMap<String, String> map, PageInfo pi) {
		return  aDAO.searchDate(sqlSession, map, pi);
	}

	@Override
	public int updateOrderSt(HashMap<String, String> map) {
		return aDAO.updateOrderSt(sqlSession, map);
	}

	@Override
	public Integer getCate1() {
		return aDAO.getCate1(sqlSession);
	}

	@Override
	public Integer getCate2() {
		return aDAO.getCate2(sqlSession);
	}

	@Override
	public Integer getCate3() {
		return aDAO.getCate3(sqlSession);
	}

	@Override
	public Integer getTodaysales() {
		return aDAO.getTodaysales(sqlSession);
	}


	@Override
	public ArrayList<Order> topList() {
		return aDAO.topList(sqlSession);
	}

	@Override
	public Integer getVariance() {
		return aDAO.getVariance(sqlSession);
	}

	@Override
	public ArrayList<Monthly> monthAmount() {
		return aDAO.monthAmount(sqlSession);
	}






	
}
