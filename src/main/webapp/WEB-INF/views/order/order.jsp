<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>WITHTRIP :: 함께라서 좋은 여행</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	
	<!-- 카카오 주소 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
 	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- iamport.payment.js -->
	<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
 
</head>

<style>
   @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@500&family=Work+Sans:wght@800&display=swap');


* {
     padding: 0; 
     margin: 0; 
     box-sizing: border-box; 
}

.container { 
      max-width: 1000px;  
      padding: 0;
} 

#order_area {
   margin: 100px auto;
}

.form-control {
     height: 25px; 
     width: 150px;
     border: none; 
     border-radius: 0;
     font-weight: 800; 
     padding: 0 0 5px 0;
     background-color: transparent;
     box-shadow: none;
     outline: none; 
     border-bottom: 2px solid #ccc;
     margin: 0;
     font-size: 14px;
}

.form-control:focus { 
     box-shadow: none;
     border-bottom: 2px solid #ccc;
     background-color: transparent;
} 

.form-control2 {
     font-size: 14px; 
     height: 20px;
     width: 60px;
     border: none;
     border-radius: 0; 
     font-weight: 800; 
     padding: 0 0 5px 0;
     background-color: transparent;
     box-shadow: none;
     outline: none; 
     border-bottom: 2px solid #ccc;
     margin: 0; 
} 

.form-control2:focus { 
     box-shadow: none;
     border-bottom: 2px solid #ccc; 
     background-color: transparent; 
}

.form-control3 {
     font-size: 14px; 
     height: 20px; 
     width: 30px; 
     border: none; 
     border-radius: 0; 
     font-weight: 800; 
     padding: 0 0 5px 0; 
     background-color: transparent; 
     box-shadow: none; 
     outline: none; 
     border-bottom: 2px solid #ccc; 
     margin: 0; 
} 

.form-control3:focus { 
     box-shadow: none; 
     border-bottom: 2px solid #ccc; 
     background-color: transparent; 
} 

#order_area p {  
      margin: 0;  
}  

#goodsImg img { 
     width: 100%; 
     height: 100%; 
     object-fit: fill; 
} 

.text-muted { 
     font-size: 12px; 
} 

.textmuted { 
     color: #6c757d; 
     font-size: 13px; 
} 

.fs-14 { 
     font-size: 14px; 
} 

#payBtn { 
     width: 100%; 
     height: 55px; 
     border-radius: 0; 
     padding: 13px 0; 
     background-color: #6495ED; 
     color: #fff;
     border: none; 
     font-weight: 600; 
     text-align: center;
} 

#payBtn:hover { 
    background-color: black; 
}

.fw-900 { 
     font-weight: 900; 
}

::placeholder { 
     font-size: 12px;
} 

.ps-30 { 
     padding-left: 30px;
} 

.h4 { 
     font-family: 'Work Sans', sans-serif !important; 
     font-weight: 800 !important;
} 

.textmuted, 
h5,
.text-muted { 
     font-family: 'Poppins', sans-serif; 
} 

.pe-1{ */
    padding : 1px; */
 } */

.count{ 
    background-color: whitegray; 
    border-bottom: medium;  
    border-right: medium; 
    border-left: medium; 
    border-top: medium; 
    background-size: 15px; 
} 

#addrBtn {
   margin-left: 5px;
   border: none;
   background: #6496ED;
   border-radius: 4px;
   width: 70px;
   color: white;
   line-height: 1.5rem;
   
}

</style>


<body>

   <!-- header -->   
   <c:import url="../common/navbar.jsp"/>

   <div class="container" id="order_area">

        <div class="row m-0">
            <div class="col-lg-7 pb-5 pe-lg-5">
                <div class="row">
                    <div class="col-12 p-5" id="goodsImg">
                        <img src="${ contextPath }/resources/guploadFiles/${ g.changeName }" style="border-radius: 8px;">
                    </div>
                    <div class="row m-0 bg-light" style="border-radius: 8px;">
                        <div class="ps-30 my-4">
                            <p class="fw-bold">주문자 정보</p><br>
                     <p class="fs-14 fw-bold"><span class="fas fa-dollar-sign pe-1"></span>${loginUser.userName}</p> <!-- 성함 -->
                     <br>
                     <p class="fs-14 fw-bold"><span class="fas fa-dollar-sign pe-1"></span>${loginUser.phone}</p>   <!-- 전화번호 -->
                     <br>
                     <p class="fs-14 fw-bold"><span class="fas fa-dollar-sign pe-1"></span>${loginUser.email}</p>   <!-- 이메일 -->
                        </div>
                        <div class="ps-30 pe-0 my-4">
                            <p class="fw-bold">배송지 정보</p>
                     <p class="text-muted" style="margin-top: 30px;">수령인</p>
                     <input class="form-control2" id="recipient" style="width: 130px; height: 20px; color: #464964;">
                     <p class="text-muted" style="margin-top: 10px;">연락처</p>
                     <input class="form-control2" id="phone" style="width: 130px; height: 20px; color: #464964;" onkeyup="addHypen(this)">
                     
                     <script type="text/javascript">
	                     // 하이픈 자동완성
	                     function addHypen(obj) {
	                        var number = obj.value.replace(/[^0-9]/g, "");
	                        var phone = "";
	                        
	                       if(number.length < 4) {
	                          return number;
	                       } else if(number.length < 7) {
	                          phone += number.substr(0, 3);
	                          phone += "-";
	                          phone += number.substr(3);
	                       } else if(number.length < 11) {
	                          phone += number.substr(0, 3);
	                          phone += "-";
	                          phone += number.substr(3, 3);
	                          phone += "-";
	                          phone += number.substr(6);
	                       } else {
	                          phone += number.substr(0, 3);
	                          phone += "-";
	                          phone += number.substr(3, 4);
	                          phone += "-";
	                          phone += number.substr(7);
	                       }
	                      obj.value = phone;
	                     }
                     </script>
                     
                     <div>
                        <p class="text-muted" style="margin-top: 10px;">우편번호</p>
                        <input class="form-control2" style="width: 100px; height: 20px; color: #464964;" id="zipcode">
                               <p class="text-muted" style="margin-top: 10px;">배송 주소</p>   
                        <input class="form-control2" id="address" style="width: 350px; margin-top: 10px; color: #464964;" readonly>
                        <button id="addrBtn" style="width: 80px; font-size: 12px; margin-left: 20px;">배송지 변경</button>
                        <p class="text-muted" style="margin-top: 10px;">상세 주소</p>
                        <input class="form-control2" id="detailAddress" style="width: 350px; height: 20px; color: #464964;">
                        <span class="fas fa-dollar-sign pe-1"></span>
                           </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-lg-5 p-0 ps-lg-4">
                <div class="row m-0">
                    <div class="col-13 px-2">
                        <div class="d-flex align-items-end mt-4 mb-2">
                            <p class="h5 m-0"><span class="pe-1" style="font-weight: bold;">${ g.goodsName }</span></p>
                        </div>
                        <br>
                        <div class="d-flex justify-content-between mb-2">
                            <p class="textmuted">브랜드</p>
                            <p class="fs-14 fw-bold"><span class="fas fa-dollar-sign pe-1">${ g.goodsBrand }</span></p>
                        </div>
                        <br>
                        <div class="d-flex justify-content-between mb-2">
                            <p class="textmuted">배송정보</p>
                            <p class="fs-14 fw-bold">업체배송</p>
                        </div>
                        <br>
                        <div class="d-flex justify-content-between mb-2">
                            <p class="textmuted">배송비</p>
                            <p class="fs-14 fw-bold"><span class="fas fa-dollar-sign px-1"></span>무료</p>
                        </div>
                        <br>
                    </div>
                    <div class="col-13 px-2"> 
                        <div class="d-flex justify-content-between mb-2">
                            <p class="textmuted">색상</p>
                            <p class="fs-14 fw-bold"><span class="fas fa-dollar-sign pe-1"></span>${ g.goodsColor }</p>
                        </div>
                       <br>
                        <div class="d-flex justify-content-between mb-2">
                            <p class="textmuted">사이즈</p>
                            <p class="fs-14 fw-bold"><span class="fas fa-dollar-sign pe-1"></span>${ g.goodsSize }</p>                 
                        </div>
                       <br>
                        <div class="d-flex justify-content-between mb-2">
                            <p class="textmuted">수량</p>
                            <p class="fs-14 fw-bold"><span class="fas fa-dollar-sign pe-1"></span>${ g.stock }개</p>                 
                        </div>
                        <br>
                     <div class="d-flex justify-content-between mb-3">
                            <p class="textmuted">결제금액</p>
                           <div class="d-flex align-text-top ">
                                <span class="fas fa-dollar-sign mt-1 pe-1 fs-14 "></span>
                                <span id="goodsPrice" class="h4" style="color:#6495ED;"></span>
                                <span class="h4" style="color:#6495ED;">원</span>
                            </div>
                        </div>
               </div>
               <div class="col-sm-13">
               </div>
                    <div class="col-12 px-0">
                    <br>
                        <br>
                        <div id="payBtn" style="border-radius: 8px;">결제하기
                        </div>
                  
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    
   <!-- footer -->
   <c:import url="../common/footer.jsp"/>
  
 
    
   <script>
    $(document).ready(function(){
        var pay = ${ g.price };
        console.log(pay);
        
        var IMP = window.IMP;
        // 가맹점 식별코드
        IMP.init("imp34894795");
        var msg;
        
        $("#payBtn").click(function(){
        	
        	 if($('#recipient').val().trim() == '') {
         		 alert('수령인을 입력하세요.');
         		 $('#recipient').focus();
         		 return false;
         	 } else if($('#phone').val().trim() == '') {
         		 alert('연락처를 입력하세요');
         		 $('#phone').focus(); 
         		 return false;
         	 } else if($('#zipcode').val().trim() == '') {
         		 alert('우편번호를 입력하세요');
         		 $('#zipcode').focus(); 
         		 return false
         	 } else if($('#address').val().trim() == '') {
         		 alert('배송 주소를 입력하세요');
         		 $('#address').focus(); 
         		 return false;
           	 } else if($('#detailAddress').val().trim() == '') {
         		 alert('상세 주소를 입력하세요');
         		 $('#detailAddress').focus(); 
         		 return false;
         	 }
         	 
            var postcode = document.querySelector('#zipcode').value;
			var phone = document.querySelector('#phone').value;
			var address = document.querySelector('#address').value;
			var detailAddress = document.querySelector('#detailAddress').value;
			var orderAddress = address + " / " + detailAddress;
			
           // 결제 요청
           IMP.request_pay({  // 보낼 정보, param
	            pay_method : 'card',
	            merchant_uid : 'w' + new Date().getTime(),            
	            name : '${ g.goodsName }',
	            amount : '${ g.price }',
	            buyer_email : '${ loginUser.email }',
	            buyer_name : '${ loginUser.userName }',
	            buyer_tel : '${ loginUser.phone }',
	            buyer_addr: '${ loginUser.address }',
	            buyer_postcode : $("#zipcode").val(),
	            receipt_url : null
           }, function(rsp){ // callback 함수  (-->다른 함수의 인자로써 넘겨진 후 특정 이벤트에 의해 호출되는 함수)
//               if(rsp.success) { // 결제 성공 시 
//             	  console.log(rsp);
            	  var impUid = rsp.imp_uid;
            	  console.log(impUid);
            	  
	            	// 결제 검증 및 결제(DB 저장 포함)
	      			$.ajax({
	      	        	type : "POST",
	      	        	data: { imp_uid:impUid },
	      	        	url : "verifyIamport.od"
	      	        }).done(function(data) {
	      	        	
	      	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 결제 로직 실행 (iamport 서버 검증)
				        if(rsp.paid_amount == data.response.amount){
	            	  
				                 var msg = '결제가 완료되었습니다.';
				                 var result = {
				                  	// order 테이블에 보낼 정보
									"orderNo" : rsp.merchant_uid, // 주문번호
									"price" : rsp.paid_amount, // 주문금액
									"orderAddress" : orderAddress,
									"zipCode" : postcode,
									"shipNo" : 'shipNo_' + new Date().getTime(),
									"recipient" : $("#recipient").val(),
									"email" : '${ loginUser.email }',
									"goodsId" : '${ g.goodsId }',
									"payNO" : rsp.imp_uid,
									"approvalNo" : rsp.apply_num, // 승인 번호
									"phone" : $('#phone').val(),
									"receiptUrl" : rsp.receipt_url 
				                 }
				                 
				                 console.log("결제 성공" + msg);
				                 
				                 $.ajax({
				                    url: "payment.od",
				                    type : "POST",
				                    dataType : 'json',
				                    data : JSON.stringify(result,
				                          ['phone', 'orderNo', 'price', 'recipient', 'shipNo', 'orderAddress', 'zipCode', 'card_no', 'orderStatus', 'email', 'goodsId', 'payNO','approvalNo', 'receiptUrl']),
				                    contentType : 'application/json;charset=utf-8',
				                    success: function(res) {	// 결제 및 DB 저장 성공 시 data==1 / 실패 시  0
				                    	
				                       if(res == 1) {
				                          console.log("결제 및 DB 저장 성공");
				                          alert('결제가 완료 되었습니다.');
				                          var goodsId = '${ g.goodsId }';
				                          var orderNo = rsp.merchant_uid;
				                          document.location.href="paymentDetail.od?orderNo=" + orderNo + "&goodsId=" + goodsId;
				                       } else {
				                          console.log("통신 실패");
				                       }
				                    },
				                    error: function() {
				                    	console.log("결제 실패");
				                    } 
				                 }); 
			                  
	      	        	} else {	// iamport 서버 검증에 만족하지 못 했을 때
	      	        		alert("검증 실패");
	      	        	}
	      	        });
           
           }); // 결제 요청
        });	// 결제 버튼 클릭 이벤트
     }); // $(document).ready() 이벤트
    
         // 결제금액에 콤마 표시
         $(document).ready(function(){
            var gPrice = ${g.price};
            var priceComma = gPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
         	$("#goodsPrice").text(priceComma);

         });
         
          // 주소 input을 클릭하면 카카오맵 팝업창 실행
          $('#addrBtn').on('click', function(){
              new daum.Postcode({
                  oncomplete: function(data) {
                    // 팝업에서 검색 결과 주소를 클릭 했을 때 주소 input칸에 입력되게 함 
                      document.querySelector('#address').value = data.address;
                      document.querySelector('#zipcode').value = data.zonecode;
                      document.getElementById("detailAddress").focus();
                  }
              }).open();
          });
          
          
</script>       
</body>
</html>