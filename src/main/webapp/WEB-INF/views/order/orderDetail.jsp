<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>WITHTRIP :: 함께라서 좋은 여행</title>
    
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">   
 
<style>
body{
background-color: #F6F6F6 !important;
}
.page{
/*  	display: table-cell;  */
    vertical-align: middle;
/* 	background-color: #F6F6F6; */
	color: black;
	box-sizing: border-box;
	width: 100%;
	height: 900px;
 	margin: 80px auto; 
}
.img {
    margin-top: 50px;
   text-align: center;
    display: inline-block;
   width: 165px;
   height: 135px;
   background: url(resources/images7/z.jpg);
   background-size: cover;
   background-position: center;
   background-repeat: no-repeat;
}
.p {
    margin-bottom: 1px;
    width: 279px;
    display: inline-block;
    text-align: right;
}
#title{
	background-color: white;
	display: block;
	position: relative;
/*     margin: 80px 320px;  */
 	margin: 80px auto 80px; 
    width: 850px;
    height: 800px;
    border: 1px solid lightgray;
    text-align: center;
}
#title1{
   font-size: 25px;
    display: block;
}
#listPage{
   border: none;
   background-color: #6495ED;
   width: 130px;
    height: 45px;
   border-radius: 5px; 
   color: white;
   cursor: pointer;
   background-color: #6495ED;
   margin-right: 10px;
   font-size: 15px;
}
#listPage:hover{
   background-color: black;
   color: white;
}
#homePage{
   border: none;
   background-color: #6495ED;
   width: 80px;
    height: 45px;
   border-radius: 5px; 
   color: white;
   cursor: pointer;
   background-color: #6495ED;
   margin-right: 10px;
   font-size: 15px;
}
#homePage:hover{
   background-color: black;
   color: white;
}
.m{
   text-align: justify;
}

#line{
   width: 750px;
    height: 1px;
    background-color: lightgray;
    text-align: center;
    display: inline-block;
    margin: 25px;
}
#orederButton{
   right: 130px;
    text-align: center;
    margin: 50px;
}
.b {
    display: inline-block;
    width: 89px;
    float: left;
    margin-left: 160px;
}
#bInfo {
    height: 80px;
}
#short{
   display: inline-block;
    text-align: right;
    margin-bottom: 0;
}
#i {
    display: inline;
    float: right;
    padding-right: 160px;
    width: 590px;
}
#no{
   color: #6495ED;
}
#goods{
   width: 150px;
    height: 150px;
    position: absolute;
}
#goods img {
    width: 100%;
    height: 100%;
    object-fit: fill;
    margin-left: 160px;
}
#goodsInfo2 {
    height: 150px;
}
#goodsInfoName {
    display: contents;
}
#goodsInfoSC {
    display: contents;
}
</style>

</head>
<body>
<c:import url="../common/navbar.jsp"/>

<div class="page" id="pageArea">
	<div id="title">
		<div class="img"></div>
		<b id="title1">주문이 확인되었습니다.</b>
		<div>
			<span>${order.orderDate} 주문하신 상품의</span><br>
			<span>주문번호는 <b id="no">${orderNo}</b> 입니다.</span>
		</div>
		<div id="line"></div>
		<br>
		<div id="goods">
            <img src="${ contextPath }/resources/guploadFiles/${ goods.changeName }" style="border-radius: 8px;">
		</div>
		<div id="goodsInfo2">
			<p id="goodsInfoName"><b>${ goods.goodsName }</b></p><br>
			<p id="goodsInfoSC">${ goods.goodsSize } / ${ goods.goodsColor }</p>
		</div>
		<div id="line"></div>
		<div class="m">
			<b class="b">주문 날짜</b>
		</div>
			<p class="p">${order.orderDate}</p><br>
		<div class="m" id="info">
			<b class="b" id="bInfo">배송지 정보</b>
		</div>
			<p class="p">${order.phone}</p><br>
			<p class="p">${order.recipient}</p><br>
<%-- 			<p id="short">${order.zipCode}</p>| --%>
			<p class="p" id="i">${order.orderAddress}</p><br>
		<div class="m">
			<b class="b">배송비</b>
		</div>
			<p class="p">무료</p><br>
		<div class="m" id="price">
			<b class="b">결제액</b>
		</div>
			<p class="p">${order.price}원</p>
		
	</div>
	<div id="orederButton">
		<button id="listPage" onclick="location.href='glist.go'">쇼핑 계속하기</button>
		<button id="homePage" onclick="location.href='home.do'">홈으로</button>
	</div>
</div>

</body>
<c:import url="../common/footer.jsp"/>
</html>