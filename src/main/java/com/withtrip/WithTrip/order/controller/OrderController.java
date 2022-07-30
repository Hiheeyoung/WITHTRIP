package com.withtrip.WithTrip.order.controller;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Locale;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.withtrip.WithTrip.goods.model.vo.Goods;
import com.withtrip.WithTrip.order.model.service.OrderService;
import com.withtrip.WithTrip.order.model.vo.Order;
import com.withtrip.WithTrip.order.model.vo.Refund;

@Controller
public class OrderController {
   
   @Autowired
   private OrderService oService;   

   
    // 결제 진행
    @RequestMapping(value = "payment.od")
    @ResponseBody
    public int payment(@RequestBody Order order) {

       int result = oService.insertPay(order);
       
       int result2 = oService.updateStock(order);
       
       System.out.println("result"+result);
       if(result + result2 > 1) {
          return result;
       } else {
          return 0;
       }
    }

   // 결제 성공 시 DB에 데이터 저장
   @RequestMapping("paymentDetail.od")
    public ModelAndView paymentDetail(@RequestParam("orderNo") String orderNo, @RequestParam("goodsId") Integer gId, ModelAndView mv) {
       
       Order order = oService.selectOrder(orderNo);
       System.out.println("order"+order);
       
       // 구매한 용품 정보 (용품 썸네일 포함) 가져오기
        Goods goods = oService.selectGoods(gId);
       
       if(order != null) {
         mv.addObject("goods", goods);
         mv.addObject("order", order);
         mv.addObject("orderNo", orderNo);
         mv.setViewName("orderDetail");
         System.out.println("뷰1 order :"+ order);
         System.out.println("뷰2 orderNo: "+ orderNo);
       } else {
          mv.addObject("msg", "주문 내역 조회에 실패하였습니다.");
          mv.setViewName("errorPage");
       }
       
       return mv;
       
    }
    
    
    // accessToken 가져오기
    public String getToken(HttpServletRequest request, HttpServletResponse response, 
    								JSONObject json, String requestURL) throws Exception{
       // requestURL 아임포트 고유키, 시크릿 키 정보를 포함하는 url 정보 

       String _token = "";

       try{
          String requestString = "";
          URL url = new URL(requestURL);
          HttpURLConnection connection = (HttpURLConnection) url.openConnection();
          connection.setDoOutput(true);             
          connection.setInstanceFollowRedirects(false);  
          connection.setRequestMethod("POST");
          connection.setRequestProperty("Content-Type", "application/json");
          OutputStream os= connection.getOutputStream();
          os.write(json.toString().getBytes());
          connection.connect();
          StringBuilder sb = new StringBuilder(); 

          if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
             BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
             String line = null;  

             while ((line = br.readLine()) != null) {  
                sb.append(line + "\n");  
             }
             br.close();
             requestString = sb.toString();
          }

          os.flush();
          connection.disconnect();
          JSONParser jsonParser = new JSONParser();
          JSONObject jsonObj = (JSONObject)jsonParser.parse(requestString);

          if((Long)jsonObj.get("code")  == 0){
             JSONObject getToken = (JSONObject) jsonObj.get("response");
             System.out.println("getToken==>>"+getToken.get("access_token") );
             _token = (String)getToken.get("access_token");
          }
      
       }catch(Exception e){
          e.printStackTrace();
          _token = "";
       }
       return _token;
    }
    
    // 환불 요청
    @RequestMapping("cancelPay.od")
    @ResponseBody
    public int rcancelPay(@RequestBody Order gOrder, HttpServletRequest request, 
    								HttpServletResponse response) throws Exception {
       
       // access 토큰 발급
       String requestURL = "https://api.iamport.kr/users/getToken";
       String imp_key = URLEncoder.encode("imp_key", "UTF-8");
       String imp_secret =   URLEncoder.encode("imp_secret", "UTF-8");
       JSONObject json = new JSONObject();
       json.put("imp_key", imp_key);
       json.put("imp_secret", imp_secret);
       String _token = getToken(request, response, json, requestURL);
       
       System.out.println(_token);
       System.out.println(gOrder);
       
       // 결제 정보 조회
       Order order = oService.selectOrder(gOrder.getOrderNo());
       int responseCode = 0;
       int res = 0;
       
       if(!order.getRefund().equals("refund")) {
          // 아임포트 REST API로 결제 환불 요청   
          responseCode = iamportRefund(_token, order); 
          
          if(responseCode == 200) { // 환불 완료 시
	          res = responseCode; 
          } else { // 환불 실패 시
        	  res = 0;
          }
      } 
       return res;
    }

   // 아임포트 REST API로 결제환불 요청
   private int iamportRefund(String _token, Order order) throws IOException {
      
      HttpsURLConnection conn = null;
      URL url = new URL("https://api.iamport.kr/payments/cancel");
      
      conn = (HttpsURLConnection) url.openConnection();
      
      conn.setRequestMethod("POST");
      
      conn.setRequestProperty("Content-type", "application/json");
      conn.setRequestProperty("Accept", "application/json");
      conn.setRequestProperty("Authorization", _token);
      
      conn.setDoOutput(true);
      
      JsonObject json = new JsonObject();
 
      json.addProperty("merchant_uid", order.getOrderNo());
      json.addProperty("amount", order.getPrice());
      
      BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
      
      bw.write(json.toString());
      bw.flush();
      bw.close();
      
      BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
       
      br.close();
      conn.disconnect();
     
      int responseCode = conn.getResponseCode();
      
      return responseCode;
   }

   // 결제 금액 검증
   private IamportClient api;
   
   public OrderController() {
	   // REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
	   this.api = new IamportClient("imp_key","imp_secret");
   }
   
	@RequestMapping(value="verifyIamport.od")
	@ResponseBody
	public IamportResponse<Payment> paymentByImpUid(Model model
													, Locale locale
													, HttpSession session
													, @RequestParam("imp_uid") String imp_uid) 
															throws IamportResponseException, IOException{	
		return api.paymentByImpUid(imp_uid);
	}

   // 환불 처리 성공 후 실행될 메소드(DB 상태 변경)	
   @RequestMapping("refund.od")
   public String insertRefund(Refund refund, @RequestParam("price") String price, 
		   @RequestParam("orderNo") String orderNo, 
		   @RequestParam("reason") String reason, Model model) {
	   
	   // 결제 정보 조회
       Order order = oService.selectOrder(orderNo);
	   
       // 'payed' 상태를 'refund'로 바꾸기
       int result1 = oService.refundOrder(orderNo);
       
       // 환불된 제품 재고 + 1
       int result2 =oService.refundStock(order);
	   
	   refund.setOrderNo(orderNo);
	   refund.setRefundReason(reason);
	   refund.setRefundAmount(price);
	   
	   int result3 = oService.insertRefund(refund);
	   
	   if(result1 + result2 + result3 == 3) {
		   return "redirect:myOrder.me";
	   }else {
		   return null;
	   }
   }

}