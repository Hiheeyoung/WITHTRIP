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

option{
	cursor: pointer !important;
}
input::placeholder { font-size: 90%; }

input:focus {
	outline: 2px solid #6495ED;
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
				    <div class="link" onclick="location.href='prdManage.ad';" style="font-weight: 900; color: #000;"><i class="fa-solid fa-suitcase-rolling"></i>상품관리</div>
				  </li>
				  <li>
				    <div class="link" onclick="location.href='orderManage.ad';"  ><i class="fa-solid fa-receipt" ></i>주문관리</div>
				  </li>
				  <li>
				    <div class="link" onclick="location.href='totalManage.ad';"><i class="fa-solid fa-arrow-trend-up"></i>통계분석</div>
				  </li>
				</ul>
            </nav> 
        <!-- sideNav -->
        
<div class="pageRound">
		<div class="prdload">
		        <a onclick="location.href='adminManage.ad';">관리자페이지</a> > <a style="font-weight: bold;" onclick="location.href='prdManage.ad';">상품관리</a>
		</div>
		<div class="prdArea"> 
			<table class="goodsTable">
				<tr>
					<th style="width: 200px; background: #eee; border-bottom: 1px solid #dbdbdb;">분류별 상품조회</th>
					<td style="border-bottom: 1px solid #dbdbdb;">
			<form action="selectGoodsOp.ad" method="post" id="selectform">
					<select id="selectOp" onchange="changeOption()" name="optionNum">
						<option value="all" style="text-align: center;">------------------전체-----------------</option>
						<option value="1" ${optionNum == '1' ? 'selected="selected"' : '' }>가방</option>
						<option value="2" ${optionNum == '2' ? 'selected="selected"' : '' }>안전용품</option>
						<option value="3" ${optionNum == '3' ? 'selected="selected"' : '' }>악세사리</option>
					</select>
					</form>
					</td>
				</tr>
				<tr>
				<form action="goodsSearch.ad" method="post" id="searchform">
					<th style="background: #eee;">상품검색</th>
					<td style="width: 1000px;"><input type="search" placeholder="상품 이름 검색"  name="searchValue" id="searchValue2">
					 <a onclick="searchGoods();" id="search"><i class="fa-solid fa-magnifying-glass"></i></a>
					 </td>
				</form>
				</tr>
			</table>
<!-- 				</form> -->
			<div>
			<c:if test="${ searchValue eq null }">
                <input class="Allgoods" type="text" value="전체  상품 수 : ${ pi.listCount }" readonly>
            </c:if>
            <c:if test="${ searchValue ne null }">
            	<input class="selectgoods" type="text" value="검색 된 상품 수 : ${ pi.listCount }" readonly>
            </c:if>
            <c:if test="${ optionNum ne null } && ${ searchValue eq null }">
            	<input class="selectgoods" type="text" value="검색 된 상품 수 : ${ pi.listCount }" readonly>
            </c:if>
			</div>
			<table class="goodsResultTable">
			<thead>
				<tr style="background: #374151; color: #fff;">
					<th style="width: 100px">상품 아이디</th>
					<th style="width: 400px">상품명</th>
					<th style="width: 300px">판매가</th>
					<th style="width: 100px" >재고</th>
					<th style="width: 100px" >상품카테고리</th>
					<th style="width: 100px">기능</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${ pi.listCount eq '0' }">
			<td colspan="8" style="border-bottom: 1px solid #dbdbdb;">조회된 결과가 없습니다.</td>
			</c:if>
			<c:if test = "${ pi.listCount ne '0' }">
			<c:forEach var="g" items="${ list }">
				<tr id="tr" style="border-bottom: 1px solid #dbdbdb;">
					<td>${ g.goodsId }</td>
					<td>${ g.goodsName }</td>
					<td>${ g.price }</td>
					<form  method="post" id="updateGo">
					<td><input type="number" min="0" id="${ g.goodsId }" class="stockGo" value="${ g.stock }"></td>
					<td><input type="number" min="1" max="3" class="${ g.goodsId }" id="cateGo"value="${ g.gcateNo }"></td>
					<td>
						<button type="button" class="updateB" value="${ g.goodsId }">수정</button>
					</td>
				</form>
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
                     		<c:if test="${ optionNum ne null }">
                     			<c:param name="optionNum" value="${ optionNum }"/>
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
                     		<c:if test="${ optionNum ne null }">
                     			<c:param name="optionNum" value="${ optionNum }"/>
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
                     	<c:if test="${ optionNum ne null }">
                     		<c:param name="optionNum" value="${ optionNum }"/>
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
	function changeOption(){
		var selectOp = $('#selectOp option:selected').text();
		var optionNum = null;
		
		if(selectOp == '가방'){
			optionNum = 1;
		}else if(selectOp =='안전용품'){
			optionNum = 2;
		}else if(selectOp == '악세사리'){
			optionNum = 3;
		}else if(selectOp == 'all'){
			optionNum = 0;
		}
		
		if(!optionNum == '0'){
		location.href="selectGoodsOp.ad?&optionNum=" + optionNum;
		$('#selectform').submit();
		}else{
			location.href="prdManage.ad";
		}
		console.log(optionNum); 
		
	}
 	</script> 
	<script>
    function searchGoods() {
    	var searchValue = $("#searchValue2").val();
    	
    	location.href="goodsSearch.ad?&searchValue=" + searchValue;
    	$('#searchform').submit();
    }
    </script>
	<script>

	    	
	$(".updateB").on("click", (e) => {
    	var gId = e.target.value;
    	
    	var testId = '#' + gId;
    	var testClass = '.'+gId; 
    	var gCate = $(testClass).val();
    	var gStock = $(testId).val();
    	
    	    console.log('gStock:', gStock);
    	    console.log('gCate:', gCate);
	    	console.log('gId:', gId);
	    	
	    	$.ajax({
	    		url : "goodsUpdate.ad",
	    		type : 'post',
	    		data : {gId:gId, gStock:gStock, gCate:gCate},
	    		success : function(data){
	    			alert('상품 상태가 변경되었습니다.');
	    			location.href="prdManage.ad";
	    		},
	    		error : function(data){
	    			console.log(data);
	    		}
	    	});
    	
    	});
	
	</script>
</body>
</html>