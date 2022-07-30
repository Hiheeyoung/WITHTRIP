package com.withtrip.WithTrip.order.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.withtrip.WithTrip.goods.model.vo.Goods;
import com.withtrip.WithTrip.order.model.vo.Order;
import com.withtrip.WithTrip.order.model.vo.Refund;

@Repository("oDAO")
public class OrderDAO {

   public int insertPay(SqlSessionTemplate sqlSession, Order order) {
      return sqlSession.insert("orderMapper.insertPay", order);
   }

   public Order selectOrder(SqlSessionTemplate sqlSession, String orderNo) {
      return sqlSession.selectOne("orderMapper.selectOrder", orderNo);
   }

   public Goods selectGoods(SqlSessionTemplate sqlSession, Integer gId) {
      return sqlSession.selectOne("orderMapper.getGoodsThumbnail", gId);
   }
   
   // 주문상태를 REFUND로 수정
   public int refundOrder(SqlSessionTemplate sqlSession, String orderNo) {
      return sqlSession.update("orderMapper.updateRefund", orderNo);
   }
   
   // 환불 내역을 DB에 저장
   public int refundOrder(SqlSessionTemplate sqlSession, Refund refund) {
	return sqlSession.insert("orderMapper.refundOrder", refund);
}

	public int updateStock(SqlSessionTemplate sqlSession, Order order) {
		return sqlSession.update("orderMapper.updateStock", order);
	}

	public int refundStock(SqlSessionTemplate sqlSession, Order order) {
		return sqlSession.update("orderMapper.refundStock", order);
	}



}