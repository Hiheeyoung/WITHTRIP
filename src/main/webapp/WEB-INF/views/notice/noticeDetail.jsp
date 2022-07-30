<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 영어폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Babylonica&family=Noto+Sans+KR:wght@300&family=Raleway:wght@300&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Babylonica&family=Noto+Sans+KR:wght@300&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Babylonica&family=Noto+Sans+KR:wght@300&family=Raleway:wght@300&display=swap');

/* 전체페이지 */
.notice-page {
	box-sizing: border-box;
    padding: 75px 275px;
    width: 100%;
    height: 100%;
    display: block;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 16px;
}
/* 페이지 헤더 */
.page-head {
	background: url(resources/images7/n1.jpg);
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
	flex-wrap: wrap;
	display: flex;
	padding: 0px 130px;
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
/* 내용 */
.notice-cate{
    display: flex;
    vertical-align:middle;
	height: 40px;
	text-align: center;
}
.notice_num{
	font-weight: 600;
    width: 5%;
	display: block;
	height: 30px;
    margin-top: 6px;
}
.notice_title{
	font-weight: 600;
	text-align: left;
    margin-left: 13px;
    font-size: 18px;
	display: block;
	width: 80%;
	height: 30px;
    margin-top: 6px;
}
.notice_date{
	color: gray;
    font-weight: 600;
    font-size: 13px;
	display: block;
	width: 10%;
	height: 30px;
    margin-top: 12px;
}
.l{
	color: lightgray;
	margin-top: 9px;
}
.notice_count{
	color: gray;
    font-weight: 600;
    font-size: 13px;
	display: block;
	width: 10%;
	height: 30px;
    margin-top: 12px;
}
.notice_content{
	padding: 40px 60px 75px;
}
#notice_list{
	margin: 15px 0 25px 0;
    width: 70px;
    height: 30px;
    font-size: 15px;
    background: lightgray;
    cursor: pointer;
    border-style: none;
    color: white;
    border-radius: 3px;
}
#notice_list:hover{
	background-color: black;
	color: white;
}
#notice_re{
	margin: 15px 0 25px 0;
    width: 70px;
    height: 30px;
    font-size: 15px;
    background: #6495ED;
    cursor: pointer;
    border-style: none;
    color: white;
    border-radius: 3px;
}
#notice_re:hover{
	background-color: black;
	color: white;
}
#notice_de{
	margin: 15px 0 25px 0;
    width: 70px;
    height: 30px;
    font-size: 15px;
    background: #6495ED;
    cursor: pointer;
    border-style: none;
    color: white;
    border-radius: 3px;
}
#notice_de:hover{
	background-color: black;
	color: white;
}

.notice-page hr{
	margin: 1px 1px 1px 1px;
    border: 1px solid #E0E0E0;
}
</style>
</head>
<body>

<c:import url="../common/navbar.jsp"/>

	<!-- 이미지-헤더-start -->
	<form action="notceUpDetail.no" method="post"> 
		<div class="page-head">
			<div class="header-wrapper" style="background-image:url('resources/images1/noticeImg.jpg')">
				<div class="container2">
					<div class="row2">
						<ol class="trip-title">
							<li class="trip-title-li" id="trip-title-text" style="color:#6495ED;;"><b>Notice</b></li>
							<li class="trip-title-li" id="trip-title-text2" style="color:black;">Check the announcement contents</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	<!-- 이미지-헤더-end -->
	<div class="notice-page">
		<hr>
		<div class="notice-cate">
			<span class="notice_num">${ notice.noticeId }</span>
			<input type="hidden" name="noticeId" value="${ notice.noticeId }" >
			<span class="notice_title">${ notice.noticeTitle }</span>
			<input type="hidden" name="noticeTitle" value="${ notice.noticeTitle }" >
			<span class="notice_date">${ notice.noticeDate }</span>
			<input type="hidden" name="noticeDate" value="${ notice.noticeDate }">
			<span class="l"><b>|</b></span>
			<span class="notice_count">${ notice.noticeCount }</span>
			<input type="hidden" name="noticeCount" value="${ notice.noticeCount }" >
		</div>
		<hr>
		<div class="notice_content">
			${ notice.noticeContent }
			<input type='hidden' name='noticeContent' value='${ notice.noticeContent }'>
		</div>
		<hr>
		
			<input type="hidden" name=email value="${ notice.email }">
			<input type="hidden" name="page" value="${ page }">
<%-- 		<c:url var="bdelete" value="bdelete.bo"> --%>
<%-- 			<c:param name="bId" value="${ board.boardId }"/> --%>
<%-- 		</c:url> --%>
<%-- 		<c:url var="blist" value="blist.bo"> --%>
<%-- 			<c:param name="page" value="${ page }"/> --%>
<%-- 		</c:url> --%>
		
<%-- 		<c:if test="${ loginUser.id eq board.boardWriter }"> --%>
		
		
		<c:url var="ndelete" value="ndelete.no">
			<c:param name="nId" value="${ notice.noticeId }"/>				
		</c:url>
		
		<button type="button" id="notice_list" onclick="location.href='nlist.no'">목록</button>
		<c:if test="${ loginUser.email == notice.email }">
		<button id="notice_re">수정</button>
		</c:if>
		<c:if test="${ loginUser.email == notice.email }">
		<button type="button" id="notice_de" class="modal_wrap" onclick="location.href='${ ndelete }' ">삭제</button>
		</c:if>
	</div>
</form>	
	

	

</body>
</html>