<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WITHTRIP :: 함께라서 좋은 여행</title>
<!-- 영어폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Babylonica&family=Noto+Sans+KR:wght@300&family=Raleway:wght@300&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Babylonica&family=Noto+Sans+KR:wght@300&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Babylonica&family=Noto+Sans+KR:wght@300&family=Raleway:wght@300&display=swap');
/* 전체페이지 */
.trip-page {
	color: black;
	box-sizing: border-box;
	width: 100%;
	height: 100%;
	display: block;
	font-size: 16px;
	background-color: #F6F6F6 !important;
}
/* 페이지 헤더 */
.page-head {
	background: url(resources/images7/s3.jpg);
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
}

.header-wrapper {
	background-color: rgba(0, 0, 0, 0.30);
	position: relative;
	padding: 120px 0px;
}

.container2 {
	padding-right: 115px;
	padding-left: 115px;
	margin-right: auto;
	margin-left: auto;
	box-sizing: border-box;
}

.trip-title {
	background-color: transparent;
	font-size: 17px;
	float: left;
	list-style: none;
}

.row2 {
	width: 1220px;
    margin: 0px auto;
    display: flex;
    padding: 0;
    flex-wrap: wrap;
}
#rowId{
	padding: 0px 92px;
}

.trip-title-li {
	color: white;
	display: block;
	margin-bottom: 3px;
	font-size: 15px;
}

#trip-title-text {
	font-size: 35px;
	font-family: 'Raleway', sans-serif;
}
#trip-title-text2{
	font-family: 'Raleway', sans-serif;
}
.img-title {
	display: block;
	position: relative;
	max-width: 100%;
	height: auto;
}
/* 검색창 */
#search{
	text-align: center;
	padding-top: 60px;
}
#searchValue:focus{
	outline:2px solid #4285F4;
}

#searchValue{
    background-image: url(resources/images7/search.png);
    opacity: 0.5;
    background-position: 8px center;
    background-repeat: no-repeat;
    background-size: 37px;
    border: 1px solid #ccc;
    border-radius: 80px;
    padding: 11px 5px;
    text-indent: 46px;
    width: 745px;
    height: 58px;
}

#serchValue :focus{
     background-size: 25px;
}

/* 동행리스트 */
.trip-list {
	width: 16%;
	min-width: 304px;
}

.trip-list-in {
	padding: 10px;
}

.trip-list-space {
	padding: 21px;
}

.box-shadow {
	cursor: pointer;
	border-radius: 10px 10px 10px 10px;
	box-shadow: 5px 5px 5px 5px #EDEDED;
}

.trip-img {
	border-radius: 10px 10px 0 0;
	position: relative;
	overflow:hidden;
	height:220px;
	text-align: center;
	background-color: #fff;
}

.trip-img-1 {
	transition: all 0.3s ease 0s;
	position: relative;
    max-width: 100%;
    height: auto;
    width: 100%;
    height: 100%;
    text-align: center;
    background-position: center;
    background-repeat: no-repeat;
    background-size: 150%;
    text-indent: -9999px;
}

.trip-img-1:hover {
	transition: all 0.6s ease-in-out;
	transform: scale(1.2);
}
.box-shadow:hover > #GroupTitle{
	width: 30px;
}

.trip-list-text {
	margin: 0px 10px 0px 10px;
	font-weight: bolder;
}

#trip-date {
	color: #6495ED;
	font-size: 20px;
	display: inline;
	font-weight: 700;
	width: 60px;
	pointer-events: none;
	background: none;
    border: none;
}

.trip-category-pointer {
	cursor: pointer;
}

#trip-list-p2{
	display: flex;
}
/* 글쓰기 버튼 */
#trip-writing {
	margin-left: 80%;
	margin: 0 0 20px 83%;
	width: 70px;
	height: 30px;
	font-size: 15px;
	background: #6495ED;
	cursor: pointer;
	border-style: none;
	color: white;
	border-radius: 3px;
}

#trip-writing:hover {
	background-color: black;
	color: white;
}
.paging{
	margin-top: 40px;
}
/* 페이징버튼 */
.paging-button {
	background-color: white;
	border: 1px solid #e6e6e6;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	margin-bottom: 60px;
	font-weight: 700;
	color: #4285F4;
}

.paging-button:hover {
	background-color: #4285F4;
	color: white;
}

#listNull{
	padding: 10% 42% 10% 42%;
}

.TripStatus {
    text-align: center;
    display: block;
    font-weight: bold;
    color: white;
    position: relative;
    background-color: rgba(0, 0, 0, 0.5);
    border-radius: 20px;
}

#title{
	width: 100%;
    display: inline;
    margin: 0 0px 0 10px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

#GroupTitle{
	display: grid;
    width: 90%;
    align-content: space-between;
}

#GroupTitle2{
	display: grid;
    width: 60%;
    align-content: space-between;
}

#recruit {
    overflow: hidden;
    position: relative;
    margin: -208px 0px 0px 14px;
    width: 75px;
    height: 30px;
    background-color: rgba(0, 0, 0, 0.5);
    border-radius: 57px;
}

#recruitH {
    position: relative;
    width: 137px;
    height: 30px;
    background-color: rgba(0, 0, 0, 0.5);
    border-radius: 139px;
}

.box-shadow:hover > #GroupTitle2 > #recruit > #AreaH:nth-child(N){
	display: hidden;
	position: relative;
	margin: -208px 0px 0px 14px;
    width: 130px;
    height: 30px;
    background-color: rgba(0, 0, 0, 0.5);
    border-radius: 57px;
}

.box-shadow:hover > #GroupTitle2 > #recruit:nth-child(2){
	overflow: visible;
	margin: -45px 0px 0px 0px;
}

#peopleIcon{
	margin-bottom: 5px;
	height: 25px;
}

#CountIcon{
	margin-bottom: 1px;
    width: 25px;
}

/*카테고리*/
.tripCate{
	margin: 10px;
	padding: 3px;
	display: inline-block;
    height: 40px;
    border-radius: 59px;
}

.Tcate {
    text-align: center;
    font-weight: bold;
    color: #A6A6A6;
}

.Tcate:hover {
    color: #6495ED;
    cursor: pointer;
}

.Tcate:active {
    color: #6495ED;
}

#tripCateGroup {
    text-align: center;
}

.line {
    display: inline-block;
    color: #A6A6A6;
    padding: 10px;
}

#RecruitingArea{
	width: 1220px;
    margin: 0px auto;
    padding: 0 21px;
}

#Recruiting {
	border: 1px solid #6495ED;
    border-radius: 20px;
    color: #6495ED;
    font-weight: 700;
    background-color: white;
    width: 149px;
    height: 35px;
    cursor: pointer;
}


</style>
</head>
<body>

<c:import url="../common/navbar.jsp"/>

	<div class="trip-page">
		<!-- 이미지-헤더-start -->
		<div class="page-head">
			<div class="header-wrapper">
				<div class="container2">
					<div class="row2" id="rowId">
						<ol class="trip-title">
							<li class="trip-title-li" id="trip-title-text"><b>Trip</b></li>
							<li class="trip-title-li" id="trip-title-text2">Find a friend to travel with</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
		<!-- 이미지-헤더-end -->
		<!-- 검색창 -->
		<div id="search">
			<input id="searchValue" name="searchValue" type="text" placeholder="동행을 검색해보세요!" onkeypress="search(event)">
		</div>
		<!-- 검색창-end -->
		<!-- 카테고리 -->
		<div id="tripCateGroup">
			<div class="tripCate">
				<p class="Tcate" id="anything">#아무거나좋아</p>
			</div>
			<p class="line">|</p>
			<div class="tripCate">
				<p class="Tcate" id="healing">#힐링</p>
			</div>
			<p class="line">|</p>
			<div class="tripCate">
				<p class="Tcate" id="activity">#엑티비티</p>
			</div>
			<p class="line">|</p>
			<div class="tripCate">
				<p class="Tcate" id="picture">#인생사진</p>
			</div>
			<p class="line">|</p>
			<div class="tripCate">
				<p class="Tcate" id="nature">#자연</p>
			</div>
		</div>
		<!-- 카테고리-end -->
		
		<div id="RecruitingArea">
			<button id="Recruiting" name="Recruiting" value="Recruiting">모집중인 글만 보기</button>
		</div>
		<!-- 동행 리스트 -->
		<div class="row2">
			<!-- 리스트  -->
			<c:if test="${ empty list }">
			<div id="listNull">조회된 리스트가 없습니다</div>
			</c:if>
			
			<c:if test="${ !empty list }">
			<c:forEach var="t" items="${ list }">
				<div class="trip-list" onclick="checkLogin()">
					<div class="trip-list-space">
						<div class="box-shadow">
							<input class="num" type="hidden" value="${ t.tripId }">
							<input class="num" name="mNo" type="hidden" value="${ t.memberNo }">
							<input type="hidden" id="preference" value="${ t.preference }">
							<input type="hidden" id="tripStart" name="tripStart" value="${ t.tripStart }">
							<c:if test="${ t.boardId == t.tripId }"> 
								<div class="trip-img">
									<img class="trip-img-1" src="${contextPath}/resources/tuploadFiles/${t.renameFileName}">
								</div>
							</c:if>
							<div id="GroupTitle2">
								<div id="recruit">
									<jsp:useBean id="presentTime" class="java.util.Date" />
									<fmt:formatDate value="${presentTime}" pattern="yyyy-MM-dd" var="todayTime" />
									<c:if test="${t.tripStart <= todayTime}">
										<p class="TripStatus">마감</p>
									</c:if>
									<c:if test="${t.tripStart > todayTime}">
										<p class="TripStatus" id="Recruiting2">모집중</p>
									</c:if>
									<div id="AreaH">
										<div id="recruitH">
											<jsp:useBean id="presentTime2" class="java.util.Date" />
											<fmt:formatDate value="${presentTime2}" pattern="yyyy-MM-dd" var="todayTime" />
											<c:if test="${t.tripStart <= todayTime}">
												<p class="TripStatus">마감 # ${ t.preference }</p>
											</c:if>
											<c:if test="${t.tripStart > todayTime}">
												<p class="TripStatus" id="Recruiting2">모집중 # ${ t.preference }</p>
											</c:if>
										</div>
									</div>
								</div>
							</div>
							
							<div class="trip-list-in">
								<div id="GroupTitle">
									<p class="trip-list-text" id="title">${ t.boardTitle }</p>
								</div>
								<div>
									<p class="trip-list-text" id="trip-date" style="margin: 10px 0px 0px 10px;">여행날짜 : </p>
									<input id="trip-date" style="width:60px" readonly value="<fmt:formatDate value="${ t.tripStart }" pattern = "MM/dd"/>" >
									<p class="trip-list-text" id="trip-date" style="width:5px; margin: 0" >~</p>
									<input id="trip-date" readonly value="<fmt:formatDate value="${ t.tripEnd }" pattern = "MM/dd"/>" >
								</div>
								<div id="trip-list-p2">
									<p class="trip-list-text"><img id="peopleIcon" src="resources/images7/people.png">${ t.partCount }</p>
									<p class="trip-list-text"><img id="CountIcon" src="resources/images7/Count.png">${ t.boardCount }</p>
								</div>
								<p class="trip-list-text">${ t.nickName }</p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</c:if>
		</div>
		<c:if test="${ !empty loginUser }">
			<button id="trip-writing" onclick="location.href='tripWriteView.to';">글쓰기</button>
		</c:if>
		<div class="paging" align="center">
			<c:if test="${ pi.currentPage <= 1 }">
				<button class="paging-button">&lt;</button>
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
               <c:url var="before" value="tlist.to">
                  <c:param name="page" value="${ pi.currentPage - 1 }"/>
               </c:url>
               <button type="button" onclick="location.href='${ before }'" class="paging-button">&lt;</button>
            </c:if>
            
            <!-- 페이지 -->
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
               <c:if test="${ p eq pi.currentPage }">
                  <button class="paging-button" style="background-color:#6495ED; color:white;">${ p }</button>
               </c:if>
               
               <c:if test="${ p ne pi.currentPage }">
                  <c:url var="pagination" value="tlist.to">
                     <c:param name="page" value="${ p }"/>
                  </c:url>
                  <button type="button" onclick="location.href='${ pagination }'" class="paging-button">${ p }</button>
               </c:if>
            </c:forEach>
            
            <!-- [다음] -->
            <c:if test="${ pi.currentPage >= pi.maxPage }">
               <button class="paging-button">&gt;</button>
            </c:if>
            <c:if test="${ pi.currentPage < pi.maxPage }">
               <c:url var="after" value="tlist.to">
                  <c:param name="page" value="${ pi.currentPage + 1 }"/>
               </c:url>
               <button type="button" onclick="location.href='${ after }'" class="paging-button">&gt;</button>
            </c:if>
		</div>
	</div>
 	<script> 
 	 $('.trip-list').find('div').click(function(){
         var bId = $(this).find('.num').val();
         console.log(bId);
        location.href = 'tdetail.to?bId=' + bId + "&page=" + ${ pi.currentPage };
      });
 	
 	//Enter키를 눌렀을 시 검색
 	 function search(e){
           var search = document.getElementById("searchValue");
           var searchValue = document.getElementById("searchValue").value;
           if(searchValue != null && searchValue != ""){
	           if(e.keyCode == 13){
	        	   location.href="search.to?="+"&searchValue="+searchValue;
	           }
           }
      }
 	//로그인하지 않을 시 글상세보기 불가능
	function checkLogin() {
	      var id = '${ sessionScope.loginUser }';
	            // ''공백 비교
	      if (id == '') {
	         alert("로그인 후 확인 가능합니다.");
	         location.href="home.do";
	      }else if(${ loginUser.userStatus == 'S' }){
	           alert('정지 회원은 접근이 불가합니다');
	           location.href="home.do";
	       }
	   }
 	  
 	//카테고리
	$('.Tcate').click(function() {
		var preference = $(this).attr("id");
		location.href="preference.to?search="+preference
	});
 	
	$(document).ready(function(){
  		var url = $(location).attr('search');
		if(url == '?search=healing') {
			$('#healing').css('color', '#6495ED');
		} else if(url == '?search=activity') {
			$('#activity').css('color', '#6495ED');
		} else if(url == '?search=picture') {
			$('#picture').css('color', '#6495ED');
		} else if(url == '?search=nature') {
			$('#nature').css('color', '#6495ED');
		} else if(url == '?search=anything') {
			$('#anything').css('color', '#6495ED');
		}  		
  	});
	
	//모집중인 글만 보기 Recruiting
	$('#Recruiting').click(function() {
		var Recruiting = $(this).val(); 
		console.log(Recruiting);
		location.href="Recruiting.to?filt="+Recruiting
	});
	
	$(document).ready(function(){
  		var url = $(location).attr('search');
  		var Recruiting = $('#Recruiting').val(); 
  		console.log(url);
		if(url == '?filt=Recruiting') {
			$('#Recruiting').css('background-color', '#6495ED').css('color', 'white');
		}
  	});
	


	
  	</script>
	
<c:import url="../common/footer.jsp"/>

</body>
</html>