<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>WITHTRIP :: 함께라서 좋은 여행</title>
<script src="resources/js6/jquery-3.6.0.min.js"></script>
<link href="resources/css6/login.css" rel="stylesheet">

</head>


<body id="loginPage" style="background-color: #ededed; background-image:url('resources/images1/5.jpg')">
<!-- header -->
<c:import url="../common/navbar.jsp"/>

<br><br>

	<div class="cont">
	<form>
	  <div class="form sign-in">
	  <span class="main">로그인</span>	 
	    <p class="p">
	        <input type="text" name="email" autocomplete="off" required id="email1" onkeyup="login();">
	        <label for="user_id"><span>Email</span>
	        </label>
      	</p>
      	
		<p class="p">
	        <input type="password" name="userPwd" required id="userPwd" onkeyup="login();" autocomplete="off">
	        <label for="user_pwd"><span>Password</span></label>
	    </p>
	    
<!-- 	    <button type="submit" class="submit" style="font-size:small;background: rgb(140,175,242);  -->
<!-- background: linear-gradient(270deg, rgba(140,175,242,1) 15%, rgba(126,169,242,1) 38%, rgba(110,156,236,1) 61%);" id="loginBtn" ><span>로그인<br></span></button> -->
	        <button onclick="loginClick();" type="button" class="submit" style="font-size:small;background: rgb(140,175,242);  -->
 background: linear-gradient(270deg, rgba(140,175,242,1) 15%, rgba(126,169,242,1) 38%, rgba(110,156,236,1) 61%);" id="loginBtn" ><span>로그인<br></span></button> 
	       
	    <div class="find_btn_cont">
		    <div class="find_btn"><button type="button" class="forgot" id="Ifind" target="_self" style="border: none; outline: none;">아이디 찾기</button></div>
		    <div class="find_btn" style="color:#ededed">/</div>
		    <div class="find_btn"><button type="button" class="forgot" id="Pfind" target="_self" style="border: none; outline: none;">비밀번호 찾기</button></div>
	<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=19256f937719bb646ad0283784d67c5b&redirect_uri=http://localhost:9980/WithTrip/kakao.me&response_type=code">
		<img src="resources/images1/kakao_login_medium_narrow.png" style="display:block; margin:auto;" >
		</a>
	    </div>
		
		

	  </div>
	 	</form>
	  <div class="sub-cont">
	    <div class="img">
	      <div class="img__text m--up">
	        <div style="color: #fff; font-size: 16px;">내 취향에 딱 맞는 여행,</div>
	        <br>
	        <h2 style="color: #fff; font-family: 'Raleway', sans-serif;">WITHTRIP</h2>
	        <!-- 여기 p태그였는데 제가 css먹여서 중앙정렬되길레 span태그로 바꿨어요!! 
	        	p태그 중앙정렬되는거 이상하면 span태그로 바꾸시면 될 것 같아요! good! 화이팅 -->
	        	<br><br>
	        <h3 style="color: #fff; font-size: 16px;">가입하고 <br> 동행을 구해보세요!</h3>
	      </div>
			      <div  class="img__text m--in">
			        <h2 style="color: #fff; font-family: 'Raleway', sans-serif; font-size: 20px;">You only life once</h2>
			        <br>
			        <h2 style="color: #fff; font-family: 'Raleway', sans-serif;">WITHTRIP</h2>
			        <br>
					<div style="font-size: 16px;">저희와<br> 동행하시겠습니까?</div>			        
			      </div>
			      <div class="img__btn"><br>
			        <span class="m--up">회원가입</span>
			        
			        <span class="m--in">로그인</span>
			      </div>
			    </div>
			    
			    <div class="form sign-up" style="overflow:auto; padding:15px;">
			    
			      <div class="main1" style="font-size:large; padding: 22px; margin-left:240px; color: black;">회원가입<br></div>
			      
			      <form action="minsert.me" method="post" enctype="Multipart/form-data"  onsubmit="return insertValidate()">  
			      	
			      <div>
			     <div class="myProfile" id="myProfile" style=" background: #cfcfcf;;  border-color: gray; width: 100px; height: 100px; margin-left: 250px; border-radius: 60px; cursor: pointer;" >
			 <img src="resources/images1/678.png" id="profile" style=" background: #cfcfcf;;  border-color: gray; width: 96px; height: 95px; margin-top:3px; margin-left:2px; margin-top:3px; border-radius: 55px;">                              
			      </div>
			      </div>
			      
				<div id="profileArea">
						<input type="file" id="profileImg" multiple="multiple" name="uploadFile" style="display : none">
					</div>
         
              
  			
  			 <p class="p">
             <input type="text" name="email" id="emailId" autocomplete="off" required >
              <label><span>EMAIL</span></label>
<!--                 <button type="button" class="add" target="_self" style="border: none; outline: none;" >아이디 중복확인</button> -->
                <span style="text-align: center;  padding-left: 80px; font-size: small;" id="emResult"></span>
            </p>
            <p class="p">
              <input    type="text" name="userName" id="name" maxlength="25" autocomplete="off" required >
              <label><span>NAME</span></label>
              <span style="text-align: center;  padding-left: 80px; font-size: small" id="nameResult"></span>
            </p>
           <p class="p">
              <input type="password" name="userPwd" id="joinfPwd" maxlength="25" autocomplete="off" required >
              <label><span>PASSWORD</span></label>
              <span style="text-align: center; padding-left: 30px; font-size: small" id="pwResult0"></span>
            </p>
            <p class="p">
              <input type="password" name="userPwd2" id="joinfPwd2" maxlength="25" autocomplete="off" required >
              <label><span>CHECK PASSWORD</span></label>
               <span style="text-align: center; padding-left: 100px; font-size: small" id="pwResult1"></span>
            </p>
          <p class="p">
              <input type="text" name="nickName" id="nickName" maxlength="25" autocomplete="off" required >
              <label><span>NICKNAME</span></label>
                <span style="padding-left: 70px; font-size: small;" id="nickResult"></span>
            </p>
           <p class="p">
              <input type="text" name="phone" id="phone" autocomplete="off" onkeyup="addHypen(this);" required >
              <label><span>PHONE</span></label>
              <span style="text-align: center; padding-left: 40px; font-size: small;" id="phResult"></span>
            </p>
            
 		      <p class="p">
			       <input type="text" name="address1" id="address_kakao" placeholder="click!" autocomplete="off" required >
			       <label><span>ADDRESS</span></label>
		      </p>
		      <p class="p">
			       <input type="text" name="address_detail" id="address" autocomplete="off" required >
			       <label><span>DETAIL_ADDRESS</span></label>
		    	</p>
		      	
	      	
	      		 <div class="custom-control custom-checkbox" style="padding-left: 190px;">
	            	<input type="checkbox" class="custom-control-input" id="aggrement" required>
	            	<label class="custom-control-label" for="aggrement" style="padding-right: 40px;" >개인정보 수집 및 이용에 동의</label>
	          	</div>		      	
	          	
			 <button type="submit" class="submit" style="font-size: small; border: none; background: rgb(140,175,242);
				background: linear-gradient(270deg, rgba(140,175,242,1) 15%, rgba(126,169,242,1) 38%, rgba(110,156,236,1) 61%); 
				outline: none;" ><span>가입하기<br></span></button>
			   </form>   
<!-- 			      <button type="button" class="fb-btn">Join with <span>kakao</span></button> -->
			    </div>
			  </div>
			</div>
		

<!-- <a href="https://dribbble.com/shots/3306190-Login-Registration-form" target="_blank" class="icon-link"> -->
<!--   <img src="http://icons.iconarchive.com/icons/uiconstock/socialmedia/256/Dribbble-icon.png"> -->
<!-- </a> -->
<!-- <a href="https://twitter.com/NikolayTalanov" target="_blank" class="icon-link icon-link--twitter"> -->
<!--   <img src="https://cdn1.iconfinder.com/data/icons/logotypes/32/twitter-128.png"> -->
<!-- </a> -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
	// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
	$(function(){
		$("#profileArea").hide();
		
		$("#myProfile").click(function(){
			$("#profileImg").click();
		});
	});
	



	// 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수 (이미지 미리보기)
    var sel_files = [];
	
	$(document).ready(function(){
		$('#profileImg').on('change' , handleImgsFilesSelect);
	});
	
    function handleImgsFilesSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("jpg,jpeg,png,bmp 확장자만 가능합니다.");
                return;
            }

            sel_files.push(f);

            var reader = new FileReader();
            reader.onload = function(e) {
            
            	var imgTag = $('<img>');
            	imgTag.attr('class', 'img-fluid image');
            	imgTag.attr('src', e.target.result);
            	imgTag.css({'width' : '100%', 'height' : '100%', 'border-radius' : '30px'});
            	
            	$('#myProfile').html(imgTag);

            }
            reader.readAsDataURL(f);
        });
    }
	



		document.querySelector('.img__btn').addEventListener('click', function() {
			  document.querySelector('.cont').classList.toggle('s--signup');
			});
		
		document.getElementById('Ifind').onclick = function(){
			window.open('findId.me', '아이디 찾기', 'width=590px, height=520px, resizable=no');
		}
		
		document.getElementById('Pfind').onclick = function(){
			window.open('findPwd.me', '비밀번호 찾기', 'width=580px, height=440px, resizable=no');
		}
		
		
	      
		/* 회원가입 영역 */


// < ID(이메일)  >
	/* 정규식(앞자리(숫자,영어대소문자),(-,.@)포함),뒤에 2,3글자여야 함)*/
	$("#emailId").on('change paste keyup', function(){
		var email = $('#emailId').val().trim()
      	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		if (regEmail.test(email) === true || email == ('')) {
			$('#emResult').text('');
      	}else {
      		$('#emResult').text("Email을 확인해 주세요.").css('color', "orangered");
      		return false;
      	}
  	});

	
	
	/* ID(중복확인) */
	var isUserble = false;   // id 중복 시 false, 사용 가능 시 true
	var isIdChecked = false;
	
	$('#emailId').on('keyup', function(){
		var emailId = $('#emailId').val().trim()
		
      		$.ajax({
      			url: 'dupId.me',
      			data: {id:emailId},
      			success: function(data){
      				console.log(data);
      				if(data == '0'){
						isUsable = true;
						isIdChecked = true;
					} else if(data = '1'){
						$('#emResult').text('이미 사용중인 Email입니다.').css('color', "orangered");
						$('#emailId').val('');
						isUsable = true;
						isIdCheked = false;
					}
				},
				error: function(data){
					console.log(data);
				}	
			});
	});
	
	



		// < 비밀번호 > 
		   /* 비밀번호 일치 확인 */
		   $('#joinfPwd2').on('change paste keyup', function(){
		      var password = $('#joinfPwd').val().trim()
		      var password2 = $('#joinfPwd2').val().trim()
		      if(password != ("") && password2 != ("") && password != password2){
		         $('#pwResult1').text('비밀번호 불일치').css('color' , 'orangered');
		         $(this).focus();
		         return false;
		      } else {
		         $('#pwResult1').text('')
		      }
		   });
		   
		   /* 정규식(8자리 이상의(영대소문자+특수문자+숫자)) */
		   $("#joinfPwd").on('change paste keyup', function(){
		      var password = $('#joinfPwd').val().trim()
		       if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password) && password != ("")){            
		          $('#pwResult0').text('숫자+영문+특수문자 조합으로 8자리 이상').css('color' , 'orangered');
		           return false;
		        } else {
		         $('#pwResult0').text('')
		       }        
		    return true;
		   });    
		   
		   
		// < 닉네임 >
		   /* 정규식 한글, 영문, 특수문자 (- _ .) 포함한 2 ~ 12글자 닉네임 */
		   $('#nickName').on('change paste keyup', function(){
		      var nickname = $('#nickName').val().trim()
		      if (!/^[a-zA-Zㄱ-힣0-9-_.]{2,12}$/.test(nickname) || nickname ==('')){
		    	  $('#nickResult').text('한글,영어,숫자,-_ 조화롭게 사용').css('color', "orangered"); 
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
		                  if(data == '0'){
		                     isUserble = true;
		                  isNiChecked = true;
		               } else if(data = '1'){
		                  $('#nickResult').text("이미 사용중인 '닉네임'입니다.").css('color', "orangered");
		                  isUserble = true;
		                  isNiChecked = false;
		               }
		            },
		            error: function(data){
		               console.log(data);
		            }   
		         });
		   });
		   
		   
		   
		   function insertValidate(){
		      if(isUserble && isNiChecked){
		         return true;
		      } else{
		         alert('닉네임 중복확인을 해주세요');
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
		      if (regPhone.test(phone) === false || phone == ('')) {
		         $('#phResult').text("010-xxx-xxxx와 같이 '-' 을 넣어 작성").css('color', "orangered");
		         return false;
		      }else {
		         $('#phResult').text('');
		         return true;
		      }
		   });
		   
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
			
			//< 카카오 지도(API) >
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
			

		function enterkey() {
	
		}	
			
		
		function login() {
			
			if(window.event.keyCode == 13) {
				
			var email = $("#email1").val();
			var userPwd = $("#userPwd").val();
// 			console.log(email);
// 			console.log(userPwd);
			
				if(email.trim() == '') {
					alert('아이디를 입력하세요.');
					$("#email1").focus();
				} else if(userPwd.trim() == '') {
					alert('비밀번호를 입력하세요.');
					$("#userPwd").focus();
				} else {
					
					$.ajax({
						url: 'login.me',
						type: "post",
						data: {email:email, userPwd:userPwd},
						success: function(data){
// 							console.log(data);
							if(data == 'false'){
								alert('존재하지 않는 회원입니다.');
							} else {
								location.href = 'home.do';
							}
						},
						error: function(data){
							console.log(data);
						}
					});
				}
			}
		}
			
		
		function loginClick() {
			var email = $("#email1").val();
			var userPwd = $("#userPwd").val();
// 			console.log(email);
// 			console.log(userPwd);
			
			if(email.trim() == '') {
				alert('아이디를 입력하세요.');
				$("#email1").focus();
			} else if(userPwd.trim() == '') {
				alert('비밀번호를 입력하세요.');
				$("#userPwd").focus();
			} else {
				
				$.ajax({
					url: 'login.me',
					type: "post",
					data: {email:email, userPwd:userPwd},
					success: function(data){
						console.log(data);
						if(data == 'false'){
							alert('존재하지 않는 회원입니다.');
						} else {
							location.href = 'home.do';
						}
						
					},
					error: function(data){
						console.log(data);
					}
				});
			}
		}
	   		

		
</script>

<!-- footer -->
<c:import url="../common/footer.jsp"/>

</body>
</html>