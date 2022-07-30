<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>WITHTRIP :: 함께라서 좋은 여행</title>
	<!-- 영어폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Babylonica&family=Noto+Sans+KR:wght@300&family=Raleway:wght@300&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="resources/css6/goodsList.css">
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/dd62c289ec.js" crossorigin="anonymous"></script>
</head>
<body>

<c:import url="../common/navbar.jsp"/>
	
      <!-- 이미지-헤더-start -->
      <div class="page-head">
         <div class="header-wrapper">
            <div class="container2">
               <div class="row2">
                  <ol class="goods-title">
                     <li class="goods-title-li" id="goods-title-text"><b>Goods</b></li>
                     <li class="goods-title-li" id="goods-title-text2">the sale of travel supplies</li>
                  </ol>
               </div>
            </div>
         </div>
      </div>
      <!-- 이미지-헤더-end -->
      
     
      <!-- 카테고리 -->
      <div class="container2">
         <div class="category-group">
            <div class="goods-category-pointer">
               <div class="goods-category" id="bag"></div>
               <b>가방</b>
            </div>
            <div class="goods-category-pointer">
               <div class="goods-category" id="safety"></div>
               <b>안전 용품</b>
            </div>
            <div class="goods-category-pointer">
               <div class="goods-category" id="etc"></div>
               <b>악세사리</b>
            </div>
         </div>
      </div>
      <!-- 카테고리-end -->
      
      <!-- 검색창 	위치 수정 -->
      <div id="search">
         <input id="searchValue" type="search" placeholder="상품을 검색해보세요!" onkeyup="enterkey();">
      </div>
      
      <br>
 	  	
  	  <!-- 선택 타입으로 list 조회 --> 	
  	  <div class="list-ability" >
 	  	<div class="sort_menu">
 	  	  
 	  	  <!-- 품절 버튼 -->
	 	  	<div id="soldoutExc">
				<c:set var="path" value="${ requestScope['javax.servlet.forward.servlet_path']}"/> 
				<c:if test="${ path eq '/glist.go' }">
		 	  		<input type="button" id="goodsExc" class="saleGList" value="품절 상품 제외" onclick="location.href='saleGoods.go';">		
		 	  	</c:if>			
		 	  	<c:if test="${ path eq '/saleGoods.go' }">	
		 	  		<input type="button" id="goodsAll" class="saleGList" value="품절 상품 포함" onclick="location.href='glist.go'">
	 	  		</c:if>					
 	 		 	
				<div class="select_type">
				   <div style="float: left;">
				     <span class="inner_count">총 ${ listCount }개</span>
				   </div>
				   <a class="name_select" id="new">신상품순</a>
				   <a class="name_select" id="sale">판매량순</a>
				   <a class="name_select" id="low">낮은 가격순</a>
				   <a class="name_select" id="high">높은 가격순</a>
				</div>
 	 		 </div>
 	 	
 	 	</div>
 	  </div>	 
 	 		 	
  	 <!-- 용품 list --> 
 	 <div>
     	<div class="goods-page" id="selectType" style="background: #f8f9fa;">
	      <c:if test="${ empty gList }">
	         <div id="nodata">등록된 용품이 없습니다.</div>
	      </c:if>

	     <!-- 용품 리스트 -->
	     <c:if test="${ !empty gList }">
	         <div class="row2" id="listrow">
	         
	            <!-- 리스트 1 -->
	            <c:forEach var="i" begin="0" end="${ gList.size()-1 }">  
	                  <div class="goods-list" id="goodsList">
	                     <div class="goods-list-space">
	                        <div class="box-shadow">
	                           <input type="hidden" value=${ gList[i].goodsId } class="goodsId">
	                           <c:if test="${ gList[i].goodsId == gList[i].boardId }">               
	                                 <c:if test="${ gList[i].stock <= 0 }">
	                                    <div class="goods-img" style="background-color: black;">
	                                       <img id="gthumbnail${i}" class="goods-img-1" src="${contextPath}/resources/guploadFiles/${ gList[i].changeName }" style="opacity: 0.7;">
	                                       <div class="soldOutBox">
	                                          <div class="soldOut">SOLD OUT</div>
	                                       </div>
	                                    </div>
	                                 </c:if>
	                                 <c:if test="${ gList[i].stock > 0 }">
	                                    <div class="goods-img">
	                                       <img id="gthumbnail${i}" class="goods-img-1" src="${contextPath}/resources/guploadFiles/${ gList[i].changeName }">
	                                    </div>
	                                 </c:if>
	                           </c:if>
	                           <div class="goods-list-in">
	                              <p class="goods-Barnd" id="goods-Barnd${i}">${ gList[i].goodsBrand }</p>
	                              <p class="goods-list-text" id="goods-Name${i}">${ gList[i].goodsName }</p>
	                              <p class="goods-price" id="goods-price${i}">
	                                    <c:set var="price" value="${ gList[i].price }"/>
	                           			${ fn:split(price,'/')[0]}원
	                        	  </p>
	                           </div>
	                        </div>
	                      </div>
	                  </div>
	            </c:forEach>      
	         </div>
	     </c:if> 
	   </div>   
	      
     <c:if test="${ !empty sessionScope.loginUser && loginUser.managerYN == 'Y' }">
        <div class="writeBtn">
           <button id="goods-writing" onclick="location.href='goodsWriteForm.go';">글쓰기</button>
     	</div> 
     </c:if>
	      
     <!-- 페이징 처리 -->
     <c:if test="${ !empty gList }">
        <div class="paging" align="center" id="pagination">
        <c:if test="${ pi.currentPage <= 1 }">
           <button class="paging-button">&lt;</button>
        </c:if>
        <c:if test="${ pi.currentPage > 1 }">
              <c:url value="${ loc }" var="glistBack">
              <c:param name="page" value="${ pi.currentPage - 1 }"/>
                    <c:if test="${ !empty searchgName }">
                 	 	<c:param name="searchGoods" value="${searchgName}"/>
              	  	 </c:if>
              	  	  <c:if test="${ !empty category }">
                 	 	<c:param name="category" value="${category}"/>
              	  	 </c:if>    
              </c:url>
              <button type="button" onclick="location.href='${ glistBack }'" class="paging-button">&lt;</button>
           </c:if>
           
           <!-- 페이지 -->
           <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
              <c:if test="${ p eq pi.currentPage }">
                 <button class="paging-button" style="background-color:#6495ED; color:white;">${ p }</button>
              </c:if>
              
              <c:if test="${ p ne pi.currentPage }">
                <c:url value="${ loc }" var="glistNum">
                    <c:param name="page" value="${ p }"/>
				 <c:if test="${ !empty searchgName }">C
                 	 	<c:param name="searchGoods" value="${searchgName}"/>
              	  	 </c:if>
              	  	 <c:if test="${ !empty category }">
                 	 	<c:param name="category" value="${category}"/>
              	  	 </c:if>    
                 </c:url>
                 <button type="button" onclick="location.href='${ glistNum }'" class="paging-button" id="pagingBtn">${ p }</button>
              </c:if>
           </c:forEach>
           
           <!-- [다음] -->
           <c:if test="${ pi.currentPage >= pi.maxPage }">
              <button class="paging-button">&gt;</button>
           </c:if>
           <c:if test="${ pi.currentPage < pi.maxPage }">
                <c:url value="${ loc }" var="glistNext">
                 <c:param name="page" value="${ pi.currentPage + 1 }"/>
				 <c:if test="${ !empty searchgName }">	
                 	 	<c:param name="searchGoods" value="${searchgName}"/>
              	  	 </c:if>
              	  	 <c:if test="${ !empty category }">
                 	 	<c:param name="category" value="${category}"/>
              	  	 </c:if>      
              </c:url>
              <button type="button" onclick="location.href='${ glistNext }'" class="paging-button">&gt;</button>
           </c:if>
       </div>
      </c:if>
    </div>   

    
    
  <script>
	$('.goods-list-space').find('div').click(function(){
		var gId = $(this).find('.goodsId').val();
		location.href = 'gdetail.go?gId=' + gId + "&page=" + ${ pi.currentPage };
	});
    		
    		
    // 엔터키로 검색 함수
    function enterkey() {
		if(window.event.keyCode == 13) {
             	   
		// 엔터키가 눌렸을 때 실행할 내용
        var searchgName = document.getElementById('searchValue').value;
			if(searchgName.length == 0 || searchgName == '') {
				alert('상품 명을 입력해주세요!');
			} else {
				location.href = 'search.go?searchGoods=' + searchgName;
			}
        }
	}
      
   	// 카테고리분류
	$('.goods-category').click(function(){
   		var cate = $(this).attr("id");
		location.href='gCate.go?category=' + cate			
   	});
      
      	
   	$(document).ready(function(){
    	var url = $(location).attr('search');
		if(url == '?category=bag') {
			$('#bag').css('border', '3px solid #4285F4');
		} else if(url == '?category=safety') {
			$('#safety').css('border', '3px solid #4285F4');
		} else if(url == '?category=etc') {
			$('#etc').css('border', '3px solid #4285F4');
		}

		var list = new Array();
		<c:forEach items="${gList}" var="glist">
			list.push("${glist.stock}");
		</c:forEach>
			
		for(var i = 0; i < list.length; i++) {
      		if(list[i] <= 0) {
      			$(".goods-img-1").css("color", "white");
      		}
      	}	
    });
      	
    // 선택 항목으로 글 조회
	var page = 1;
	   	
   	$(".name_select").on('click', function(){
    	var pathname = window.location.pathname;
     	var select_type = $(this).attr("id");

     	if(page != null) {
	   		currentPage = page;
	   	}
    	
     	getList(select_type, page, pathname)
    });
     	
	// ajax로 용품 list 조회
   	function getList(select_type, page, pathname){
   		
   		$.ajax({
   			url: 'select_type.go',
   			data: {select_type:select_type, page:page, pathname:pathname},
   			success: function(data){
    				
   				if(data.length > 0) {
   					
				var goodsList = "";
				for(var i = 0; i < data.length; i++){
					goodsList += "<div class=\"goods-list\" id=\"goodsList\">";
					goodsList += "<div class=\"goods-list-space\">";
					goodsList += "<div class=\"box-shadow\">";
					goodsList += "<input type=\"hidden\" value=\"" + data[i].goodsId + "\"class=\"goodsId\">";
							
					if(data[i].stock <= 0) {
					  	goodsList += "<div class=\"goods-img\" style=\"background-color: black;\">";
	  						goodsList += "<img class=\"goods-img-1\" style=\"opacity: 0.7;\" src=\"${contextPath}/resources/guploadFiles/"+ data[i].changeName +"\">";
	  						goodsList += "<div class=\"soldOutBox\">";
	  						goodsList += "<div class=\"soldOut\">SOLD OUT</div>";
	  						goodsList += "</div>";
	  						goodsList += "</div>";
					} else {
					  	goodsList += "<div class=\"goods-img\">";
	  						goodsList += "<img class=\"goods-img-1\" src=\"${contextPath}/resources/guploadFiles/"+ data[i].changeName +"\">";
  						goodsList += "</div>";
					}
							
							
					goodsList += "<div class=\"goods-list-in\">";
					goodsList += "<p class=\"goods-Barnd\">" + data[i].goodsBrand + "</p>";
					goodsList += "<p class=\"goods-list-text\">" + data[i].goodsName + "</p>";
					goodsList += "<p class=\"goods-price\">" + data[i].price + "원</p>";
					
					goodsList += "</div>"
					goodsList += "</div>"
					goodsList += "</div>"
					goodsList += "</div>"
					goodsList += "</div>"
							
					$("#listrow").html(goodsList);
				
				}
		    	
				// 용품 상세보기 페이지 이동
				$('.goods-list-space').find('div').click(function(){
	    			var gId = $(this).find('.goodsId').val();
					location.href = 'gdetail.go?gId=' + gId + "&page=" + ${ pi.currentPage };
	    		});				
				     					
    				var pageUrl = getPage(page, select_type, "getList", "pagination", pathname);
    					
   				} else {
   					goodsList += "<div>등록된 용품이 없습니다.</div>"
  						$(".goods-page").html(goodsList);
   				}
    		},
   			error: function(data){
   				console.log(data);
   			}
    	});
   	}
	
   	// ajax 페이지네이션
	function getPage(page, select_type, fnName, listname, pathname) {
		
		$.ajax({
   			url: 'getSelectTypePage.go',
   			data: {page:page},
   			success: function(data){
  				console.log(data);
	   				
   				if(data.currentPage%10==0) data.startPage = data.currentPage-10+1;
   				
   				if(data.endPage > data.maxPage) data.endPage = data.maxPage;
   				
   				var prevPage = data.currentPage-1;
   				if(prevPage < 1) prevPage = 1;
   				
   				var nextPage = data.currentPage+1;
   				if(nextPage > data.maxPage) nextPage = data.maxPage;
	   				
				var pageUrl = "";
   					pageUrl += "<button class=\"paging-button\" onclick=\""+fnName+"('"+select_type+"', "+prevPage+", '"+pathname+"');\">&lt;</button>";
   				
   					for(var j=data.startPage; j<=data.endPage; j++){
   					if(j == data.currentPage) 
   					pageUrl += "<button class=\"paging-button\" style=\"background-color:#6495ED; color:white;\">"+j+"</button>"; 
   					else pageUrl += "<button class=\"paging-button\" onclick=\""+fnName+"('"+select_type+"', "+j+", '"+pathname+"');\">"+j+"</button>";
   				}
   					
   					pageUrl += "<button class=\"paging-button\" onclick=\""+fnName+"('"+select_type+"', "+nextPage+", '"+pathname+"');\">&gt;</button>";
   					$("#pagination").html(pageUrl);
    					
    			},
    			error: function(data){
    				console.log(data);
    			}
    	});
	}

 </script>
	      
	<c:import url="../common/footer.jsp"/>
</body>
</html>