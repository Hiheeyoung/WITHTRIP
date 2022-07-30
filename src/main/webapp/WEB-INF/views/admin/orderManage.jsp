<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>WITHTRIP :: 함께라서 좋은 여행</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/vendor3/bootstrap/css/bootstrap_admin.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Grape+Nuts&family=Noto+Sans+KR:wght@300&family=Raleway:wght@100;&family=Titillium+Web&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
    <!-- Custom styles for this template -->
    <link href="resources/css3/admin.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/dd62c289ec.js" crossorigin="anonymous"></script>

    <!-- 탑버튼 -->    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


  </head>
  <style>
  body{
  	background: #fafafa !important;
  }

* {
  margin: 0;
  padding: 0;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

ul { list-style-type: none; }

a {
  color: #b63b4d;
  text-decoration: none;
}
input::placeholder { font-size: 90%; }

input:focus {
	outline: 2px solid #6495ED;
	border: none;
}

.refundend{
	width: 60px;
	height: 30px;
	background: #95a3b3;
	border-radius: 10px;
	color: #fff;
	border: none;
}


  </style>
  <body>
  
  <!-- navbar -->
   <c:import url="../common/navbar.jsp"/>
   
 
<!-- sideNav -->
			<nav  id="prdnav">
				<ul id="accordion" class="accordion">
					<li style="text-align: center; color:#000; font-weight: bold; margin-bottom: 30px;">관리자 대시보드</li>
				  <li>
				    <div class="link" onclick="location.href='prdManage.ad';"><i class="fa-solid fa-suitcase-rolling"></i>상품관리</div>
				  </li>
				  <li>
				    <div class="link" style="font-weight: 900; color: #000;" onclick="location.href='orderManage.ad';"  ><i class="fa-solid fa-receipt" ></i>주문관리</div>
				  </li>
				  <li>
				    <div class="link" onclick="location.href='totalManage.ad';"><i class="fa-solid fa-arrow-trend-up"></i>통계분석</div>
				  </li>
				</ul>
            </nav> 
        <!-- sideNav -->
        
<div class="pageRound">
		<div class="prdload">
		        <a onclick="location.href='adminManage.ad';">관리자페이지</a> > <a style="font-weight: bold;" onclick="location.href='prd_manage.ad';">주문관리</a>
		</div>
		<div class="prdArea"> 
			<table class="orderTable">
					<tr style="border-bottom: 1px solid #dbdbdb;">
					<th style="width: 200px; background: #eee;">진행상태별 상품조회</th>
					<td style="border-bottom: 1px solid #dbdbdb; width: 1000px;">
					<button class="status" type="button" onclick="location.href='orderManage.ad';">전체</button>
					
<!-- 					<form action="selectStatus.ad" method="post" id="selectBform"> -->
					<button class="status" type="button" onclick="orderSelect1()" id="orderEnd">주문완료</button>
					<button class="status" type="button" onclick="orderSelect2()" id="orderCancel">주문취소</button>
<!-- 					</form> -->
					</td>
				</tr>
				<tr>
				<form action="searchDate.ad" method="post" >
					<th style=" background: #eee;">기간</th>
					<td><input type="date" class="dateInput" id="startDate" name="startDate" >
					 ~  <input type="date" class="dateInput" id="endDate" name="endDate">
					<button id="dateSearch">검색</button>
				</form>
					</td>
				</tr>
				<tr>
					<th style=" background: #eee;">주문자 검색</th>
					<td>
				<form action="orderSearch.ad" method="post" id="searchform">
						<input type="search" placeholder="이메일 검색"  name="searchValue" id="searchValue2">
						<a onclick="searchOrder();" id="search"><i class="fa-solid fa-magnifying-glass"></i></a>
					</form>
					</td>
				</tr>
			</table>
			<div>
			<c:if test="${ searchValue eq null }">
                <input class="Allgoods" type="text" value="총 주문 수 : ${ pi.listCount }" readonly>
            </c:if>
            <c:if test="${ searchValue ne null }">
            	<input class="selectgoods" type="text" value="검색 된 상품 수 : ${ pi.listCount }" readonly>
            </c:if>
            <c:if test="${ optionOd ne null } && ${ searchValue eq null }">
            	<input class="selectgoods" type="text" value="검색 된 상품 수 : ${ pi.listCount }" readonly>
            </c:if>
            <c:if test="${startDate ne null } && ${ optionOd eq null } && ${ searchValue eq null }">
            	<input class="selectgoods" type="text" value="검색 된 상품 수 : ${ pi.listCount }" readonly>
            </c:if>
			</div>
			<table class="orderResultTable">
			<thead>
				<tr style="background: #374151; color: #fff;">
					<th style="width: 130px;">주문일자</th>
					<th style="width: 130px;">주문번호</th>
					<th style="width: 200px;">주문자</th>
					<th style="width: 300px;">용품명</th>
					<th style="width: 100px;">주문금액</th>
					<th style="width: 150px;">주문상태</th>
					<th style="width: 80px;">기능</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${ pi.listCount eq '0' }">
			<td colspan="8" style="border-bottom: 1px solid #dbdbdb;">조회된 결과가 없습니다.</td>
			</c:if>
			<c:if test = "${ pi.listCount ne '0' }">
			<c:forEach var="o" items="${ list }">
				<tr style="border-bottom: 1px solid #dbdbdb;">
					<td>${ o.orderDate }</td>
					<td>${ o.orderNo }</td>
					<td>${ o.email }</td>
					<td>${ o.goodsName }</td>
					<td class="${ o.orderNo }">${ o.price }</td>
					<td>
					<form action="updateGdStatus.ad" method="post" id="selectform">
					<select id="${ o.orderNo }" name="updateStatus">
					<c:choose>
					<c:when test="${ o.refund eq 'payed' }">
						<option  selected="selected">주문완료</option>
						<option>주문취소</option>
					</c:when>
					<c:when test="${ o.refund eq 'refund' }">
						<option disabled="disabled">주문완료</option>
						<option  selected="selected">주문취소</option>
					</c:when>
					</c:choose>
					</select>
					</form>
					</td>
					<c:if test="${ o.refund eq 'payed' }">
					<td><button class="updateOrder" value="${ o.orderNo }">수정</button></td>
					</c:if>
					<c:if test="${ o.refund eq 'refund' }">
					<td><button class="refundend" style="cursor: default;">취소</button></td>
					</c:if>
				</tr>
				</c:forEach>
				</c:if>
				</tbody>
			</table>
			
		<!-- pagination -->
	         <div class="row mt-5">
                 <div class="col text-center">
                   <div class="block-27">
                     <ul>
                     <c:if test="${ pi.currentPage <=1 }">
                     	<li><a id="paging">&lt;</a></li>
                     </c:if>
                     <c:if test="${ pi.currentPage >1 }">
                     	<c:url var="before" value="${ loc }">
                     		<c:param name="page" value="${ pi.currentPage -1 }"/>
                     		<c:if test="${ searchValue ne null }">
                     			<c:param name="searchValue" value="${ searchValue }"/>
                     		</c:if>
                     		<c:if test="${ optionOd ne null }">
                     			<c:param name="optionOd" value="${ optionOd }"/>
                     		</c:if>
                     	</c:url>
                       <li><a href="${ before }" id="paging">&lt;</a></li>
                     </c:if>
                     
                     <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                     	<c:if test="${ p eq pi.currentPage }">
                     		<li><a class="active" id="paging" style="color : #fff;">${ p }</a></li>
                     	</c:if>
                     	
                     	<c:if test="${ p ne pi.currentPage }">
                     		<c:url var="pagination" value="${ loc }">
                     			<c:param name="page" value="${ p }"></c:param>
                     		<c:if test="${ searchValue ne null }">
                     			<c:param name="searchValue" value="${ searchValue }"/>
                     		</c:if>
                     		<c:if test="${ optionOd ne null }">
                     			<c:param name="optionOd" value="${ optionOd }"/>
                     		</c:if>
                     		</c:url>
                     		<li><a href="${ pagination }">${ p }</a></li>
                     	</c:if>
                     </c:forEach>
                     
                     <c:if test="${ pi.currentPage >= pi.maxPage }">
                     	<li><a id="paging">&gt;</a></li>
                     </c:if>
                     <c:if test="${ pi.currentPage < pi.maxPage }">
                     	<c:url var="after" value="${ loc }">
                     		<c:param name="page" value="${ pi.currentPage + 1 }"></c:param>
                     	<c:if test="${ searchValue ne null }">
                     		<c:param name="searchValue" value="${ searchValue }"/>
                     	</c:if>
                     	<c:if test="${ optionOd ne null }">
                     		<c:param name="optionOd" value="${ optionOd }"/>
                     	</c:if>
                     	</c:url>
                     	<li><a href="${ after }" id="paging">&gt;</a></li>
					</c:if>
                     </ul>
                   </div>
                 </div>
               </div>
</div>
</div>
	<script>
    function searchOrder() {
    	var searchValue = $("#searchValue2").val();
    	
    	location.href="orderSearch.ad?&searchValue=" + searchValue;
    	$('#searchform').submit();
    }
    </script>
    <script>
    function orderSelect1() {
		var orderEnd = $('#orderEnd').text();
		var optionOd = null;
		
		
		if(orderEnd =='주문완료'){
			optionOd = 'payed';
		}	
		console.log(optionOd);
		
		$.ajax({
			url: "selectStatus.ad",
			type : 'post',
			data : { optionOd:optionOd },
			success : function(data){
				console.log(data);
				location.href="selectStatus.ad?optionOd=" + optionOd;
			},
			error : function(data){
				console.log(data);
			}
		});
	
    }
    </script>
    <script>
    function orderSelect2() {
		var orderEnd = $('#orderCancel').text();
		var optionOd = null;
		
		
		if(orderEnd =='주문취소'){
			optionOd = 'refund';
		}		
		
		$.ajax({
			url: "selectStatus.ad",
			type : 'post',
			data : { optionOd:optionOd },
			success : function(data){
				console.log(data);
				location.href="selectStatus.ad?optionOd=" + optionOd;
			},
			error : function(data){
				console.log(data);
			}
		});
	
    }
    </script>
    	<script>
    		
    	$(".updateOrder").on("click", (e) => {
    	
    		var oId = e.target.value;
			var priceCl = '.' + oId;
			var price = $(priceCl).text();
			var testId = '#' + oId;
			var selectOp = $(testId).val();
			var reason = '관리자에 인한 주문취소';
			
    		console.log(selectOp);
			if(selectOp == '주문취소'){
    			 $.ajax({
    	               url : "cancelPay.od", // 예: http://www.myservice.com/payments/cancel
    	               type : "POST",
    	               contentType : "application/json",
    	               data : JSON.stringify({
    	                   "orderNo" : oId, // 주문번호
    	                   "price": price, // 환불금액
    	              }),
    	              success: function(res) {
    	                 if(res == 200) {
    	                     $.ajax({
    	                        url : "refund.od",
    	                        data : {"reason":reason, "price":price, "orderNo":oId },
    	                        method : 'post',
    	                        success : function(data){
    	                        	alert('주문 상태가 변경되었습니다.');
    	                			location.href="orderManage.ad";
    	                        },
    	                        error : function(data){
    	                           console.log(data);
    	                        }
    	                     });
    	                          
    	                 } else {
    	                       console.log(res)
    	                        console.log("환불 상태 변경 실패");
    	                     }
    	    },
    	                   error: function(res) {
    	                       alert('환불 실패되었습니다.');
    	                }
    	    });
    	    }
			});
</script>
</body>
</html>