<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="resources/js6/jquery-3.6.0.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>WITHTRIP :: 함께라서 좋은 여행</title>
<style>
	html,
	body {
/* 		background-image:url("13.jpg"); */
		background-color: #BAD5EA;
		font-family: 'Noto Sans KR', sans-serif;
	    margin: 0;
	    padding: 0;

	}
	
	
	body {
	    width: 100vw;
	    height: 100vh;
	    font-family: 'Open sans';
	    box-sizing: border-box;
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
/* 	    background: rgba(57, 50, 173, 1) */
	}
	
	body>* {
	    margin: 0;
	    padding: 0;
	    box-sizing: inherit;
	}
	
	.wrapper {
	    width: 700px;
	    background: #FFF;
	    border-radius: 10px;
	    box-shadow: 0 25px 70px rgba(0, 0, 0, .05);
	    overflow: hidden;
	}
	
	h2.title {
	    padding: 15px 0;
	    margin-left: 25px;
	    font-weight: normal;
	    color: black;
	    text-align: center;
	    margin: auto;
	}
	
	.form {
	    width: 700px;
	}
	
	.myform {
	    background: white;
	    display: grid;
/* 	    grid-template-columns: 1fr 1fr; */
	    grid-gap: 15px;
	    border-radius: 8px;
	
	}
	
	.myform label {
	    display: block;
	    color: #A8AAC5;
	    font-weight: bold;
/* 	    font-size: .5rem; */
	    margin-bottom: 7px;
	}

	
	.full-width {
	    grid-column: -1 / 1
	}
	
	.button {
	    grid-column: -1 / 1;
/* 	    display: flex; */
		padding:10px;
	    justify-content: center;
	}
	
	.button button {
	    border: 0;
	    outline: 0;
	    width: 180px;
	    height: 40px;
	    border-radius: 50px;
	    color: #FFF;
	    font-weight: bold;
	    font-size: .9rem;
	    cursor: pointer;
/* 	    background: linear-gradient(356deg, rgba(57, 50, 173, 1) 0%, rgba(87, 50, 173, 1) 100%); */
		background-color: #6495ED;
	}
	
	.button button:hover {
		background-color: black;
/* 	    background: rgba(57, 50, 173, 1); */
	}
	
	.p {
	margin-top: 30px;
	padding: 0;
	font-family: 'Raleway', sans-serif;
}

.p input {
	padding-bottom: 0;
}

.p label {
	margin-bottom: 0;	
}

.p button {
	width: 296px;
	margin-top: 0;
}
	/*추가*/      
   
p { margin:20px auto 0; } 
/* form과 fieldset은 선택자로 사용하지 않는다. */

p { 
	position:relative; 
	width:50%; 
	height:50px;
} /* 기본세팅 */

p input { 
	box-sizing:border-box; 
	padding:10px 0 0; 
	width:100%; 
	height:100%; 
	border:0 none; 
	color:#595f63; 
	outline:none; 
	}
	
	p label { 
		position:absolute; 
		left:0%; 
		bottom:0; 
		width:100%; 
		height:100%; 
		border-bottom:1px solid #000; 
		text-align:left; 
		pointer-events:none; 
	}
	p label:after { 
		content:""; 
		position:absolute; 
		left:0; 
		bottom:-1px; 
		width:0; 
		height:100%; 
		border-bottom:1px solid #6495ED; 
		transition:all .5s ease;  /* 파란색 가로줄 */
	}


p label span { 
	position:absolute; 
	left:0; 
	bottom:2px; 
	transition:all .5s ease; 
	font-size: 10px;
}


p input:focus + label span, 
p input:valid + label span { 
	transform:translateY(-150%); 
	font-size:10px; 
	color:#8fa1c7; }  
	/* input에 글을 입력하고 포커스가 지나간 상태에서 제어하려면 valid 선택자를 써야한다. */
	
/* 포커스 될 때 label span(name)이 위로 올라감 */
p input:focus + label::after,
p input:valid + label::after { 
	width:100%; 
	transform:translateX(0); 
	} 
input, button {
  border: none;
  outline: none;
  background: none;
/*   font-family: "Open Sans", Helvetica, Arial, sans-serif; */
}
input {
  display: block;
  width: 100%;
  margin-top: 5px;
  padding-bottom: 5px;
  font-size: 16px;
  border-bottom: 1px solid rgba(0, 0, 0, 0.4);
  text-align: center;
}
.img__btn span.m--in {
  transform: translateY(-72px);
}
.cont.s--signup .img__btn span.m--in {
  transform: translateY(0);
}
.cont.s--signup .img__btn span.m--up {
  transform: translateY(72px);
}

</style>	


</head>
<body>
<%-- <c:import url="../common/navbar.jsp"/> --%>
<br>
	 <div class="wrapper" style="overflow:auto;">
     <div class="form">
     <br>
         <h2 class="title">정보 입력</h2>
         <form action="kakaoUserInfo.me" class="myform" method="post" style="text-align: center;" onsubmit="return insertValidate();">

            	<input type="hidden" name="email" value="${ userInfo.email }" readonly>

			<p class="p">
              <input type="text" name="userName" id="name" maxlength="25" autocomplete="off"  required>
              <label><span>NAME</span></label>
              <span style="text-align: center; font-size: small;" id="nameResult"></span>
            </p>

			<p class="p">
              <input type="text" name="nickName" id="nickName" maxlength="25" autocomplete="off" required >
              <label><span>NICKNAME</span></label>
              <span style="text-align: center;  font-size: small;" id="nickResult"></span>
            </p>
			
			<p class="p">
              <input type="text" name="phone" id="phone" maxlength="25" autocomplete="off" onkeyup="addHypen(this);" required >
              <label><span>PHONE</span></label>
              <span style="text-align: center; font-size: small;" id="phResult"></span>
            </p>
	
			<p class="p">
              <input type="text" name="address" id="address_kakao" maxlength="25" autocomplete="off"  placeholder="click!" required>
              <label><span>ADDRESS</span></label>
            </p>
            
            <p class="p">
              <input type="text" name="address_detail" id="address_detail" maxlength="25" autocomplete="off" required>
              <label><span>ADDRESS DETAIL</span></label>
            </p>
            
            <br>
             <div class="button">
                 <button type=submit id="register">저장</button>
                 <button type=button id="register1" onclick="cancel();">취소</button>
             </div>
             <br>
        
         </form>
     </div>
 </div>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	   window.onload = function(){
	       document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
	           //카카오 지도 발생
	           new daum.Postcode({
	               oncomplete: function(data) { //선택시 입력값 세팅
	                   document.getElementById("address_kakao").value = data.address; // 주소 넣기
	                   document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
	               }
	           }).open();
	       });
	   }
	
	   function cancel(){
		   location.href = '${pageContext.request.contextPath}/home.do';
		   
		   
	   }
	   
	   
	   
	   /* 정규식 (한글, 영문, 숫자만 가능하며 2-10자리 가능) */
	   $('#nickName').on('keyup', function(){
	      var nickname = $('#nickName').val().trim()
	      if (!/^([a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]).{4,10}$/.test(nickname) && nickname != ("")){
	         $('#nickResult').text('한글,영어,숫자 조합으로 10자리 이내').css('color', 'orangered');
	         return false;
	      }else{
	         $('#nickResult').text('');
	      }
	   });
	   
	      
	   /* 닉네임(중복확인) */
	   var isUserble = false;   // id 중복 시 false, 사용 가능 시 true
	   var isNiChecked = false;
	   $('#nickName').on('keyup', function(){
	      var nickName = $('#nickName').val().trim()
	            $.ajax({
	               url: 'dupNick.me',
	               data: {nickName:nickName},
	               success: function(data){
	                  console.log(data);
	                  if(data == "0"){
	                	  
	                  isUsable = true;
	                  isNiChecked = true;
	                  
	               } else if(data == "1"){
	                  $('#nickResult').text("이미 사용중인 '닉네임'입니다.").css('color', "orangered");
	                  isUsable = false;
	                  isNiCheked = false;
	               }
	            },
	            error: function(data){
	               console.log(data);
	            }   
	         });
	   });
	   
  		function insertValidate(){
   			if(isUsable && isNiChecked){
   				
   				return true;
   			} else {
   				
   				$('#nickResult').text('닉네임 중복확인을 해주세요.');
   				return false;
   			}
   			
   		}
  		
  		
  		
  	// < 이름 >
  		/* 정규식(한글,영어만 사용가능) */
  		$('#name').on('change paste keyup', function(){
  			var userName = $('#name').val().trim();
  			var regex = /^[가-힣a-zA-Z]+$/;
  			
  			if(regex.test(userName) || userName ==('')) {
  				$('#nameResult').text('');
  				// $(this).val('');
  				$(this).focus();
  		
  				return false;
  			} else {
  				$('#nameResult').text('이름을 확인해주세요.').css('color' , 'orangered');
  			}
  		});



  	// < 연락처 > 
  		/* 정규식(010-xxxx-xxxx 양식 '-' 사용가능) */
  		$("#phone").on('change paste keyup', function(){
  			var phone = $('#phone').val().trim();
  			var regPhone = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
  			if (regPhone.test(phone) === true) {
  				$('#phResult').text('사용 가능한 번호입니다.').css('color', 'green');
  			}else {
  				$('#phResult').text("연락처를 확인해주세요.").css('color', "orangered");
  				
  				return false;
  			}
  		});
  		

  	 	/* 연락처 하이폰(-) 자동생성 */			
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