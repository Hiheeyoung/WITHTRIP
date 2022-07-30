package com.withtrip.WithTrip.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.withtrip.WithTrip.admin.model.vo.ByCate;
import com.withtrip.WithTrip.admin.model.vo.Monthly;
import com.withtrip.WithTrip.goods.model.vo.Goods;
import com.withtrip.WithTrip.member.model.vo.Member;
import com.withtrip.WithTrip.notice.model.vo.Notice;
import com.withtrip.WithTrip.order.model.vo.Order;
import com.withtrip.WithTrip.trip.model.vo.PageInfo;
import com.withtrip.WithTrip.member.model.vo.Report;

public interface AdminService {

	int getMemberCount();

	ArrayList<Member> getMemberList(PageInfo pi);

	int getSearchListCount(HashMap<String, String> map);

	ArrayList<Member> searchMember(HashMap<String, String> map, PageInfo pi);

	int deleteMember(String mId);

	int suspendMember(String mId);

	int unlockMember(String mId);

	int getReportCount();
	
	ArrayList<Report> getReportList(PageInfo pi);

	int reportTake(int rId);

	int getAddReCount(int rId);

	int getNoticeCount();

	ArrayList<Notice> getNoticeList(PageInfo pi);

	int getGoodsCount();

	ArrayList<Goods> getGoodsList(PageInfo pi);

	int statusChangeN(int gId);

	int statusChangeY(int gId);

	ArrayList<Goods> searchGoods(HashMap<String, String> map, PageInfo pi);

	ArrayList<Goods> selectGoodsOp(HashMap<String, Integer> map, PageInfo pi);

	int getSearchCount(HashMap<String, String> map);

	int getSelectCount(HashMap<String, Integer> map);

	int goodsUpdate(HashMap<String, Integer> map);

	int getOrderCount();

	ArrayList<Goods> getOrderList(PageInfo pi);

	int getSearchOrderCount(HashMap<String, String> map);

	ArrayList<Goods> searchOrder(HashMap<String, String> map, PageInfo pi);

	int getSelectOrderCount(HashMap<String, String> map);

	ArrayList<Order> selectOrderSt(HashMap<String, String> map, PageInfo pi);

	int searchDateCount(HashMap<String, String> map);

	ArrayList<Order> searchDate(HashMap<String, String> map, PageInfo pi);

	int updateOrderSt(HashMap<String, String> map);

	Integer getCate1();

	Integer getCate2();
	
	Integer getCate3();

	Integer getTodaysales();

	ArrayList<Order> topList();

	Integer getVariance();

	ArrayList<Monthly> monthAmount();






}
