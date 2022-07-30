<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WITHTRIP :: 함께라서 좋은 여행</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Raleway&display=swap" rel="stylesheet"></head>
</head>
<style>
	html{
	font-family: 'Noto Sans KR', sans-serif;
	font-family: 'Raleway', sans-serif;
}

.find-id-page{
  width:550px;
  text-align:center;
  overflow-x:hidden;
  margin:11% auto;
  background-color:#f9f9f9;
  vertical-align: middle;
  border-radius: 10px;
}

.find-id-header {
  text-align:left;
  margin:60px 75px 0 75px;
  padding-bottom:10px;
  font-size:15pt;
  border-bottom:3px solid #6495ED;
}

.find-id-content {
  margin:30px 0 20px 85px;
  text-align:left;
}

.find-id-div {
  margin-bottom:15px;
  font-size: small;
  
}

.find-id-div1 {
  margin-bottom:12px;
  font-size: small;
  padding:24px;
}
.find-id-div span {
  font-size:14pt;
  color:#6495ED;
}

.find-id-content input[type=email] {
  width:380px;
  margin-top:5px;
  margin-bottom:5px;
  font-size:14pt;
  padding-left:10px;
  color:#666666;
}

.find-id-content input[type=text] {
  width:380px;
  margin-top:5px;
  margin-bottom:5px;
  font-size:14pt;
  padding-left:10px;
  color:#666666;
}


.find-id-button {
  padding-bottom:50px;
}

.find-id-button button {
  height:33px;
  background-color: #6495ED;
  border:none;
  color:white;
  padding-left:15px;
  padding-right:15px;
  text-align:center;
  text-decoration: none;
  display: inline-block;
  cursor:pointer;
  border-radius: 10px;
  transition: background 0.3s ease-in-out;
}

.find-id-button button:hover{
	background: #000000;
	
}
.text{

 font-size: 10px;
  width: 500px;
  height: 32px;
  border: 0;
  border-radius: 13px;
  outline: none;
  padding-left: 10px;
  background-color: white;
 

}

/* .text:focus { */
/*     outline: none !important; */
/*     border:1px solid ; */
/*     box-shadow: 0 0 8px #6495ED; */
/*     border-color: white; */
/* } */

</style>
<body>
<form action="checkId.me" , method="post">
	<c:if test="${empty member.email }">
	<div class="find-id-page" ng-controller="FindIdCtrl as findIdCtrl">
    <div class="find-id-header">아이디 찾기</div>
    <div class="find-id-content">
        <div class="find-id-div">가입하신 <span>이름</span> 을 입력하세요.</div>
        <div><input type="text" name="userName" class="text" id="userName" style="font-size: 13px;"></div>
        <br>
        <div class="find-id-div">가입하신 <span>휴대폰 번호</span> 를 입력하세요.</div>
        <div><input type="text" name="phone" class="text" id="phone" style="font-size: 13px;" onkeyup="addHypen(this);"></div>
    </div>
    <div class="find-id-button">
    	<button type="submit" id="btn">확인</button>
    </div>
</div>
	</c:if>
	<c:if test="${!empty member.email }">
	<div class="find-id-page" ng-controller="FindIdCtrl as findIdCtrl">
    <div class="find-id-content">
    <br>
        <div class="find-id-div1">
        <h3>가입하신 이메일은 ${member.email} 입니다.</h3>
        </div>
        <br>
    </div>
</div>
	</c:if>

</form>
	<script>
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




</body>
</html>