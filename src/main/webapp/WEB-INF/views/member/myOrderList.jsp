<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
  <head>
  
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>WITHTRIP :: 함께라서 좋은 여행</title>

   <script src="resources/js2/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link href="resources/vendor2/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <link href="resources/vendor2/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="resources/css2/resume.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<style>
       
      /* 사진 클릭하면 해당 사진 모달 띄우기 */
      /* image modal */
      .imgModal {
          display: none;
          z-index: 500;
          width: 100%;
          height: 100%;
          position: fixed;
          top: 0;
          left: 0;
          background-color: rgba(0, 0, 0, 0.4);
      }
      .imgModalBox {
          position: relative;
          text-align: center;
          top : 20%;
          left : 50%;
          position : sticky;
      }
      /* image modal end */

      /* 주문취소 모달 START */
      .deleteModal {
           position: fixed; z-index: 500;
           top: 0; left: 0;
           width: 100%; height: 100%;
           display: none; background-color: rgba(0, 0, 0, 0.4);
      }

      .deleteModal.show {
         display: block;
      }

      .deleteModal_body {
         position: absolute; top: 50%; left: 50%;
         width: 500px; height: 300px;
         padding: 10px;
         text-align: center;
         background-color: rgb(255, 255, 255);
         border-radius: 10px;
         box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
         transform: translateX(-50%) translateY(-50%);
      }
      
      .yBtn{
         background-color: orangered; 
         width: 30%; 
          top: 170px; left: 140px;
         font-size:15px;
         color:white;
         cursor: pointer;
         border-radius: 5px;
         border:none;
         height: 30px;
         text-align: center;
      }
      /* 주문취소 모달 END */
      /* 환불 완료 모달 START */
      .bilgeModal {
           position: fixed; z-index: 500;
           top: 0; left: 0;
           width: 100%; height: 100%;
           display: none; background-color: rgba(0, 0, 0, 0.4);
      }

      .bilgeModal.show {
         display: block;
      }

      .bilgeModal_body {
         position: absolute; top: 50%; left: 50%;
         width: 500px; height: 600px;
         padding: 4px; 
         text-align: center;
         background-color: rgb(255, 255, 255);
         border-radius: 10px;
         box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
         transform: translateX(-50%) translateY(-50%);
      }
      
      .cBtn{
         background-color: orangered; 
         width: 30%; 
         position: absolute; top: 170px; left: 140px;
         font-size:15px;
         color:white;
         cursor: pointer;
         border-radius: 5px;
         border:none;
         height: 30px;
      }
      /* 환불완료 모달 END */
      #refundReason{
         width: 300px; height: 60px; border-radius: 5px; border: 2px solid darkgray;
         margin-top: 10px;
      }
      #refundReason:focus{
         outline: 2px solid #6495ED;
         border: none;
      }
      
      /* 주문취소 버튼(모달아님 리스트에 있는 버튼) */
      .deleteBtn{background-color: orangered; border: none; color:white; border-radius: 5px;}
      .cancelComplete { background-color: white; border: none; color: red; border-radius: 5px; font-weight: bold; }
      
      #info{
         width: 910px;
         height: 100px;
         background: #edf2fb;
         border-radius: 10px;
         padding : 15px;
         margin-left: 220px;
      }
      
      #noticeImg{
         width: 20px;
         height: 20px;
      }
</style>
</head>
  <body id="page-top">
  
  
  <!-- 네비바-->
  <c:import url="../common/navbar.jsp"/>
 
 
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav" style="position:absolute;">
      <a class="navbar-brand js-scroll-trigger"  href="#page-top">
        <span class="d-block d-lg-none" >With Trip</span>
        
           <span class="d-none d-lg-block" >
              <c:if test="${loginUser.changeName == null}">
                <img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/images4/logo_whiteBackground.png" alt="기본 프로필 사진">
            </c:if>
            <c:if test="${loginUser.changeName != null}">
                <img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/profileUploadFiles/${loginUser.changeName}" alt="프로필 사진">
              </c:if>
           </span>
      </a>
      
      <div class="collapse navbar-collapse"  id="navbarSupportedContent">
        <ul class="navbar-nav">
        
         <li>
            <a id="nickName">${loginUser.nickName}</a>
         </li>
         <li class="nav-item">
             <a class="nav-link js-scroll-trigger"   onclick="location.href='updateMyInfo.me';">계정 관리</a>
         </li>
         <li class="nav-item">
           <a class="nav-link js-scroll-trigger" onclick="location.href='myOrder.me';" style="color: white;">주문 내역</a>
         </li>
         <li class="nav-item">
           <a class="nav-link js-scroll-trigger" onclick="location.href='myReview.me';">작성한 동행 후기</a>
         </li>
         <li class="nav-item">
           <a class="nav-link js-scroll-trigger" onclick="location.href='myReply.me';">작성한 용품 후기</a>
         </li>
         <li class="nav-item">
           <a class="nav-link js-scroll-trigger" onclick="location.href='myPost.me';" >작성한 동행 글</a>
         </li>
         <c:if test="${ loginUser.reportCount > 0 }">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" onclick="location.href='reportTo.me';" style="color: DarkOrange;">접수된 신고</a>
            </li>
         </c:if>
            
      <li class="nav-item">
        <a class="nav-link js-scroll-trigger" onclick="location.href='travelReview.me';">동행자 후기</a>
      </li>          
       </ul>
      </div>
    </nav>
    
<div class="imgModal">
    <div class="imgModalBox">
    </div>
</div>
    
    
<div class="container rounded mt-5 bg-white p-md-5">
    <div class="main">
   <!-- 페이지 타이틀 -->
      <input type="checkbox" checked="checked" id="pageTitle"><label class="pageLabel">주문 내역</label>
      
      <div id="info">
      <p><img id="noticeImg"src="https://cdn-icons-png.flaticon.com/512/1680/1680012.png">
      - 주문취소는 상품 발송전까지 가능하며 그 이후로는 관리자 1:1채팅으로 문의바랍니다.</p>
      <p>&ensp;&ensp;&ensp;- 환불완료 상태의 경우 클릭시 영수증을 확인하실 수 있습니다. </p>
      </div>
      <div class="tableline">
    <div class="table-responsive">
        <table class="table">
            <thead class="thead">
                <tr>
                   <th scope="col">주문번호</th>
                   <th scope="col">상품명</th>
                    <th scope="col">결제금액</th>                    
                    <th scope="col">주문일</th>                                      
                    <th scope="col">주문취소</th>                                      
                </tr> 
            </thead>         
         
         <c:if test="${ empty list }">
             <tbody>
                   <tr>
                     <td colspan="5" style="align-items: center;">주문 내역이 없습니다.</td>
                   </tr>
               </tbody>
         </c:if>
         
         <c:if test="${ !empty list }">
             <c:forEach var="i" begin="0" end="${ list.size() -1 }"> 
              <input type="hidden" id="${ list[i].orderNo }" value="${ list[i].price }">
                <tbody>
                   <tr class="bg-blue">
                      <td>${ list[i].orderNo }</td>    
                      <td>${ list[i].goodsName }</td>
                     <td>${ list[i].price }</td>
                     <td class="${ list[i].orderNo }">${ list[i].orderDate }</td>      
                     <td>
                     <c:choose>
                     <c:when test="${ list[i].refund eq 'refund' }"> 
                        <button type="button" value="${ list[i].receiptUrl }" id="cancelComplete${ i }" class="cancelComplete" >환불완료</button>
                     </c:when>
                     <c:when test="${ list[i].refund eq 'payed' }">
                           <button type="button" value="${ list[i].orderNo }" id="deleteBtn${ i }" class="deleteBtn">주문취소</button>
                     </c:when>   
                     </c:choose>
                     </td>
                   </tr>
               </tbody>
           </c:forEach>
          </c:if>    


        </table>
        </div>
    </div>
   </div>
</div>
         
      <!-- 주문취소 모달 START -->
      
          <div class="deleteModal">
             <div  class="deleteModal_body">
               <div><hr class="modal_line" style="margin-top: 13%"></div>
                     <div class="modal_content" style="color : #000;">해당 주문을 취소하시겠습니까?<br>
                  <div><input id="refundReason" class="${ list[i].orderNo }" placeholder="환불 사유를 입력해주세요" type="text" ></div>
                     </div>
                  <div><hr class="modal_line"></div>
                  <div class="modal_button">
                      <button  type="button" class="yBtn" id="cancelPay">취소하기</button>
                  </div>
                </div>
         </div>
      <!-- 주문취소 모달 END -->
      <!-- 환불완료 모달 START -->
             <c:forEach var="i" items="${ list }" varStatus="status"> 
          <div class="bilgeModal">
             <div  class="bilgeModal_body">
                     <div class="modal_content" style="height: 100%;">
                     <iframe id="${ i.orderNo }" class="recepit" src="" style="width: 100%; height: 100%;"></iframe>  
                     </div>
                  <div class="modal_button">
                  </div>
                </div>
         </div>
            </c:forEach>
      <!-- 환불완료 모달 END -->
         
         
               <!-- 페이지네이션 -->
             <div class="pagination">
                 <div class="col text-center">
                   <div class="block-27">
                     <ul>
                     <!-- 이전 -->
                     <c:if test="${ pi.currentPage <= 1 }">
                       <li>
                             <a style="cursor: default;" id="paging">&lt;</a>
                       </li>
                     </c:if>
                     <c:if test="${ pi.currentPage > 1 }">
                        <c:url var="before" value="myOrder.me">
                           <c:param name="page" value="${ pi.currentPage - 1 }"/>
                        </c:url>
                       <li>
                             <a href="${ before }" id="paging">&lt;</a>
                       </li>
                     </c:if>
                     
                     <!-- 페이징 -->
                     <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                       <c:if test="${ p eq pi.currentPage }">
                             <font><li class="active"><a id="paging">${ p }</a></li></font>
                       </c:if>
                       
                       <c:if test="${ p ne pi.currentPage }">
                             <c:url var="pagination" value="myOrder.me">
                                <c:param name="page" value="${ p }"/>
                             </c:url>
                             <li><a href="${ pagination }" id="paging">${ p }</a></li>
                       </c:if>
                     </c:forEach>
                       
                       <!-- 다음 -->
                       <c:if test="${pi.currentPage >= pi.maxPage }">
                             <li>
                                <a style="cursor: default;" id="paging">&gt;</a>
                             </li>
                       </c:if>
                       <c:if test="${ pi.currentPage < pi.maxPage }">
                             <c:url var="after" value="myOrder.me">
                                <c:param name="page" value="${pi.currentPage + 1 }"/>
                             </c:url>
                             <li>
                                <a href="${ after }" id="paging">&gt;</a>
                             </li>
                       </c:if>
                       
                     </ul>
                   </div>
                 </div>
               </div>
               <br>

<c:import url="../common/footer.jsp"/>
 <!-- Bootstrap core JavaScript -->
    <script src="resources/vendor2/jquery/jquery.min.js"></script>
    <script src="resources/vendor2/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="resources/vendor2/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="resources/js2/resume.min.js"></script>

<script>
    $("#modalshow").click(function() {
            $('.modalBg').css({"visibility" : "visible"});
      });
    
     // 기둥이 스크롤 따라오게
     $(document).ready(function(){
          var currentPosition = parseInt($("#sideNav").css("top"));
          $(window).scroll(function() {
            var position = $(document).scrollTop(); 
            // 푸터 전에 멈추게 하는 조건
            if($(window).scrollTop() <= $(document).height() - $(window).height() - $('footer').outerHeight()){
               $("#sideNav").stop().animate({"top":position+currentPosition+"px"},1000);
            }
          });
      });
     
 // 프로필 사진 클릭 시 사진 모달 띄우기
    $(function(){
       $("img").click(function(){
           var img = new Image();
           img.src = $(this).attr("src")
           $('.imgModalBox').html(img);
           $(".imgModal").show();
       });
      // 모달 클릭할때 이미지 닫음
       $(".imgModal").click(function (e) {
          $(".imgModal").toggle();
        });
   });
 
    
   // 주문취소 버튼 클릭 시 모달 띄우기
    $(".deleteBtn").on("click", (e) => {
       oId = e.target.value;
        console.log(oId);
        var test1 = '.' + oId;
        var datetest1 = $(test1).text();
        var orderday = new Date(datetest1); // 주문날짜
        
          var today = new Date();  // 현재날짜
           
           console.log("주문날짜 : " + orderday);
           console.log("현재날짜 :" + today);
//            console.log("testday :" + testday);
           
           const twodaysago = new Date(today);
           
           twodaysago.setDate(today.getDate() - 2);
           
           console.log("twodaysago" + twodaysago);
           
           if(orderday <= twodaysago){
              alert("현재 상품이 배송중이므로 주문취소가 불가능합니다");
           }else{
              
           deleteModal.classList.toggle('show');
            if (deleteModal.classList.contains('show')) {
            bodyTag.style.overflow = 'hidden';
           }
           }
           });
    
       const bodyTag = document.querySelector('body');
       const deleteModal = document.querySelector('.deleteModal');
          const deleteBtn = document.querySelector('#deleteBtn');

       deleteModal.addEventListener('click', function(event){
        if (event.target === deleteModal) {
           deleteModal.classList.toggle('show');

         if (!deleteModal.classList.contains('show')) {
            bodyTag.style.overflow = 'auto';
         }
        }
       });
       
   // 환불완료 버튼 클릭 시 모달 띄우기
    $(".cancelComplete").on("click", (e) => {
       oId = e.target.value;
       var id = "#" + oId
       
       $(".recepit").attr("src",oId);

        bilgeModal.classList.toggle('show');
        
      if (bilgeModal.classList.contains('show')) {
         bodyTag.style.overflow = 'hidden';
        }
    });
    
    const bodyTag2 = document.querySelector('body');
    const bilgeModal = document.querySelector('.bilgeModal');
    const bilgeBtn = document.querySelector('#cancelComplete');

    bilgeModal.addEventListener('click', function(event){
        if (event.target === bilgeModal) {
           bilgeModal.classList.toggle('show');

         if (!bilgeModal.classList.contains('show')) {
            bodyTag2.style.overflow = 'auto';
         }
        }
    });
    

   $("#cancelPay").click(function(e){
      var gPrice = '#' + oId;   
      var price = $(gPrice).val();
      var i =  $(".deleteBtn").attr("id").substring(9);
      var reasontext = '.' + oId;
      var refundReason = $(reasontext).val();
      const reason = document.getElementById('refundReason').value;
      
           $.ajax({
               url : "cancelPay.od", 
               type : "POST",
               contentType : "application/json",
               data : JSON.stringify({
                   "orderNo" : oId, // 주문번호
                   "price": price, // 환불금액
                   "reason": document.getElementById('refundReason').value // 환불사유
              }),
               success: function(res) {
                 if(res == 200) {  // 환불 성공 시 refund 테이블에 환불 정보 insert
                       alert('주문 취소 및 환불이 완료되었습니다.');
                       console.log("환불 성공 : " + res);
                     $.ajax({
                        url : "refund.od",
                        data : {"reason":reason, "price":price, "orderNo":oId },
                        method : 'post',
                        success : function(data){
                           console.log(data);
                           
                           location.href="myOrder.me";
                        },
                        error : function(data){
                           console.log(data);
                        }
                     });
                          
                 } else {
                       console.log(res)
                       alert('환불에 실패하였습니다. 오류가 계속될 경우 채팅으로 문의 부탁드립니다.');
                     }
                   },
                   error: function(res) {
                       alert('환불에 실패하였습니다. 오류가 계속될 경우 채팅으로 문의 부탁드립니다.');
                }
           });
    });

</script>
</body>
</html>