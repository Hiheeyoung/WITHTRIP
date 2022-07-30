<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WITHTRIP :: 함께라서 좋은 여행</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <link href="../../css/findPwd.css" rel="stylesheet"> -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Raleway&display=swap" rel="stylesheet"></head>
</head>
<style>
	html{
	font-family: 'Noto Sans KR', sans-serif;
	font-family: 'Raleway', sans-serif;
}

.find-password-page{
  width:550px;
  text-align:center;
  overflow-x:hidden;
  margin:11% auto;
  background-color:#f9f9f9;
  vertical-align: middle;
  border-radius : 10px;
}

.find-password-header {
  text-align:left;
  margin:60px 75px 0 75px;
  padding-bottom:10px;
  font-size:16pt;
  border-bottom:3px solid #6495ED;
}

.find-password-content {
  margin:30px 0 20px 85px;
  text-align:left;
}

.find-password-div {
  margin-bottom:15px;
  font-size: small;
}

.find-password-div span {
  font-size:14pt;
  color:#6495ED;
}

.find-password-content input[type=email] {
  width:380px;
  margin-top:5px;
  margin-bottom:5px;
  font-size:14pt;
  padding-left:10px;
  color:#666666;
}

.find-password-content input[type=text] {
  width:380px;
  margin-top:5px;
  margin-bottom:5px;
  font-size:14pt;
  padding-left:10px;
  color:#666666;
}

.find-password-button {
  padding-bottom:50px;
}

.find-password-button button {
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

.find-password-button button:hover{
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

 
/* #mail_check_input_box_false{ */
/*     background-color:#ebebe4; */
/* } */
 
/* #mail_check_input_box_true{ */
/*     background-color:white; */
/* } */



 
/* .correct{ */
/*     color : green; */
/* } */
/* .incorrect{ */
/*     color : red; */
/* } */
 
</style>
<body>

	<div class="find-password-page" ng-controller="FindIdCtrl as findIdCtrl">
    <div class="find-password-header">임시비밀번호 전송</div>
    <div class="find-password-content">
        <div class="find-password-div">등록하신 <span>E-Mail</span> 주소를 입력하세요.</div>
        <div><input type="text" name="myEmail" class="text" id="myEmail" style="font-size: 13px;" placeholder="example@withtrip.com"></div>
        
<!--         <div class="mail_check_input_box"> -->
<!--         <input type="text" class="text" id="checkNum"style="font-size: 13px;" placeholder="인증번호를 입력해주세요." > -->
<!--         <br> -->
<!--         <span id="mail_check_input_box_warn"></span> -->
<!--         </div> -->
    </div>
    <div class="find-password-button">
    	<button type="button" id="btn" >찾기</button>
    </div>
</div>


	<script>

	var code = "";   
	
	// 이메일이 자기 이메일인지 먼저 확인해야한다.
	
	
		$("#btn").click(function(){
			var email = $('#myEmail').val();
			
			$.ajax({
				type: "GET",
				url:"checkPwd.me",
				data: {myEmail: email},

		        success:function(data){
		        	console.log(data)
		        	if(data == '1'){
						alert("해당 이메일로 임시 비밀번호가 발급되었습니다.");
			        	code = data;
		        		
		        	}else{
		        		alert("이메일을 확인해주세요.");
		        	}

		        },
		        error:function(data){
		        	console.log(data)
		        }

			});
		});
	
	

	</script>
</body>
</html>