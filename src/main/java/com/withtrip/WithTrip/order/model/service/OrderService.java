package com.withtrip.WithTrip.order.model.service;

import com.withtrip.WithTrip.goods.model.vo.Goods;
import com.withtrip.WithTrip.order.model.vo.Order;
import com.withtrip.WithTrip.order.model.vo.Refund;

public interface OrderService {

   int insertPay(Order order);

   // 주문 내역 
   Order selectOrder(String orderNo);
   
   // 사진가져오기
   Goods selectGoods(Integer gId);

   // 해당되는 주문을 payed -> refund로 변경
   int refundOrder(String orderNo);

   // 환불 내역을 DB에 저장   
   int insertRefund(Refund refund);

   
   int updateStock(Order order);

   
   int refundStock(Order order);


}