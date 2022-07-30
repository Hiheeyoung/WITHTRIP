package com.withtrip.WithTrip.order.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withtrip.WithTrip.goods.model.vo.Goods;
import com.withtrip.WithTrip.order.model.dao.OrderDAO;
import com.withtrip.WithTrip.order.model.vo.Order;
import com.withtrip.WithTrip.order.model.vo.Refund;

@Service
public class OrderServiceImpl implements OrderService {
   @Autowired
   private OrderDAO oDAO;
   
   @Autowired
   private SqlSessionTemplate sqlSession;

   @Override
   public int insertPay(Order order) {
      return oDAO.insertPay(sqlSession, order);
   }

   @Override
   public Order selectOrder(String orderNo) {
      return oDAO.selectOrder(sqlSession, orderNo);
   }
   // 사진가져오기
   @Override
   public Goods selectGoods(Integer gId) {
      return oDAO.selectGoods(sqlSession, gId);
   }

   // refund 컬럼 상태 변경
   @Override
   public int refundOrder(String orderNo) {
      return oDAO.refundOrder(sqlSession, orderNo);
   }
   
   // 환불 내역 DB에 저장
   @Override
   public int insertRefund(Refund refund) {
	 return oDAO.refundOrder(sqlSession, refund);
   }

   @Override
   public int updateStock(Order order) {
	 return oDAO.updateStock(sqlSession, order);
   }

   @Override
   public int refundStock(Order order) {
	 return oDAO.refundStock(sqlSession, order);
   }



}
   

