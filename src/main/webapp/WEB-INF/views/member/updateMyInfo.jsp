<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
  <head>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>WITHTRIP :: 함께라서 좋은 여행</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/vendor1/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/css1/resume.min.css" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Square+Peg&display=swap" rel="stylesheet">

    <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/vendor/devicons/css/devicons.min.css" rel="stylesheet">
    <link href="resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crosssorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100&display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="resources/css1/resume.min.css" rel="stylesheet">

<style type="text/css">

       #ftco-navbar { 
          z-index: 500; 
       } 

	/* 비밀번호 변경 모달 */
      .modal {
        position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }

      .modal.show {
        display: block;
      }

      .modal_body {
        position: absolute;
        top: 50%;
        left: 50%;

        width: 400px;
        height: 430px;

        padding: 40px;

        text-align: center;

        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

        transform: translateX(-50%) translateY(-50%);
      }
      .checkDiv{padding-bottom: 20px; color: orangered; font-size: 13px;}
      
      
      
		/* 사진 클릭하면 해당 사진 모달 띄우기 */
		/* image modal */
		.imgModal {
		    display: none;
		    z-index: 500;
		    width: 100%;
		    height: 100%;
		    position: fixed;
		    top: 0;
		    left: 0;
		    background-color: rgba(0, 0, 0, 0.4);
		}
		.imgModalBox {
		    position: relative;
		    text-align: center;
		    top : 20%;
		    left : 50%;
		    position : sticky;
		}
		/* image modal end */
		
		/* 반갑습니다 & 아래 세 버튼 위치 조정 */
		#myNickName{position: absolute; right: 425px; top: -40px;}
		#pwdChange{position: absolute; right: 700px; top: 20px;}
		#myProfile{position: absolute; right: 370px; top: 20px;}
		#deleteMember{position: absolute; right: 40px; top: 20px;}
		
		/* 회원 탈퇴 모달 START */
		.deleteModal {
	        position: fixed; z-index: 500;
	        top: 0; left: 0;
	        width: 100%; height: 100%;
	        display: none; background-color: rgba(0, 0, 0, 0.4);
		}

		.deleteModal.show {
			display: block;
		}

		.deleteModal_body {
			position: absolute; top: 50%; left: 50%;
			width: 400px; height: 225px;
			padding: 40px;
			text-align: center;
			background-color: rgb(255, 255, 255);
			border-radius: 10px;
			box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
			transform: translateX(-50%) translateY(-50%);
		}
		
		.yBtn{
			background-color: grey; 
			width: 30%; 
			position: absolute; top: 170px; left: 140px;
			font-size:15px;
			color:white;
			cursor: pointer;
			border-radius: 5px;
			border:none;
			height: 30px;
		}
		/* 회원 탈퇴 모달 END */
		
		#email{background-color: AliceBlue; border: none; cursor: default; text-align: center;}
		
		.updateText{
			text-align: center; width: 400px;
		}
		
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body id="page-top">

<c:import url="../common/navbar.jsp"/>
	
<!-- 기둥 네비 START -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
	<a class="navbar-brand js-scroll-trigger"  href="#page-top">
	  <span class="d-block d-lg-none" >With Trip</span>
	  
<%-- 	<c:if test="${ mNo != loginUser.member_no }"> --%>
<!-- 		  <span class="d-none d-lg-block" > -->
<%-- 			<c:if test="${loginUser.changeName == null}"> --%>
<%-- 		    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/images4/logo_whiteBackground.png" alt="프로필 사진"> --%>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${loginUser.changeName != null}"> --%>
<%-- 		    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/profileUploadFiles/${loginUser.changeName}" alt="프로필 사진"> --%>
<%-- 		  	</c:if> --%>
<!-- 		  </span> -->
<%-- 	</c:if> --%>
	
<%-- 	<c:if test="${ mNo == loginUser.member_no }"> --%>
        <span class="d-none d-lg-block" >
        	<c:if test="${loginUser.changeName == null && loginUser.originName == 'Count.png'}">
		    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/images4/logo_whiteBackground.png" alt="프로필 사진">
        	</c:if>
        	<c:if test="${loginUser.changeName == null && loginUser.originName != 'Count.png'}">
		    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/images4/logo_whiteBackground.png" alt="프로필 사진">
<%-- 		    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/image2/profil.png" alt="프로필 사진"> --%>
			</c:if>
			<c:if test="${loginUser.changeName != null}">
		    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/profileUploadFiles/${loginUser.changeName}" alt="프로필 사진">
		  	</c:if>
        </span>
<%-- 	</c:if> --%>
	
	</a>
     <div class="collapse navbar-collapse"  id="navbarSupportedContent">
        <ul class="navbar-nav">
        
<%--         <c:if test="${ mNo != loginUser.member_no }"> --%>
<!-- 	        <li> -->
<%-- 	        	<a id="nickName">${ list[0].review_nickname }</a> --%>
<!-- 	        </li> -->
<%--         </c:if> --%>
<%--         <c:if test="${ mNo == loginUser.member_no }"> --%>
			<li>
				<a id="nickName">${loginUser.nickName}</a>
			</li>
			<li class="nav-item">
			  <a class="nav-link js-scroll-trigger"  onclick="location.href='updateMyInfo.me';" style="color: white;">계정 관리</a>
			</li>
			<li class="nav-item">
			  <a class="nav-link js-scroll-trigger" onclick="location.href='myOrder.me';">주문 내역</a>
			</li>
			<li class="nav-item">
			  <a class="nav-link js-scroll-trigger" onclick="location.href='myReview.me';">작성한 동행 후기</a>
			</li>
			<li class="nav-item">
			  <a class="nav-link js-scroll-trigger" onclick="location.href='myReply.me';">작성한 용품 후기</a>
			</li>
			<li class="nav-item">
			  <a class="nav-link js-scroll-trigger" onclick="location.href='myPost.me';">작성한 동행 글</a>
			</li>
			<c:if test="${ loginUser.reportCount > 0 }">
				<li class="nav-item">
				  <a class="nav-link js-scroll-trigger" onclick="location.href='reportTo.me';" style="color: DarkOrange;">접수된 신고</a>
				</li>
			</c:if>
<%-- 		</c:if> --%>
			
			<li class="nav-item">
			  <a class="nav-link js-scroll-trigger" onclick="location.href='travelReview.me';">동행자 후기</a>
			</li>          
         	
        </ul>
      </div>
	</nav>
<!-- 기둥 네비 END -->	

<!-- 프사 클릭 시 확대 모달 -->
<div class="imgModal">
    <div class="imgModalBox">
    </div>
</div>

<!-- 페이지 타이틀 -->
<div class="container rounded mt-5 bg-white p-md-5">
<input type="checkbox"  checked="checked"><label>계정 관리</label>
</div>

<!-- card -->
<div class="updateMyInfo">
	<div class="cardDiv">
    
        <div class="container">
    		<div class="row">
		        <div class="col">
		            <div class="row " style="padding: 10px;">
		                <div class="col-xl-12">
		                    <div class="card">
		                    	<br><br>
		                    	<c:if test="${loginUser.changeName == null}">
		                  			<img id="profile" class="img-fluid img-profile rounded-circle mb-2 w-25 mx-auto" src="${ contextPath }/resources/images4/logo_whiteBackground.png" alt="" style="border-color: lightgrey; border-width :thin; border-style: solid">
		                    	</c:if>
		                    	<c:if test="${loginUser.changeName != null}">
		                  			<img id="profile" class="img-fluid img-profile rounded-circle mb-2 w-25 mx-auto" src="${ contextPath }/resources/profileUploadFiles/${loginUser.changeName}" alt="">
	                            </c:if>
	                            <div class="imgModal">
								    <div class="imgModalBox">
								    </div>
								</div>
	                            <div class="card-body">
	                                <div class="row" id="blockitems">
	                                    <div class="col">
	                                    <div class= "like">
	                                        <span id="myNickName">${ loginUser.nickName }&nbsp;님 반갑습니다!</span>
	                                        <br><br>
	                                        
	                                        <!-- 비번 변경 모달창 START -->
	                                        <form action="pwdUpdate.me" method="post">
											    <div class="modal">
												    <div  class="modal_body">
												    	<p id="infoTitle">비밀번호 변경</p>
				                                        <div class="area">
						                                    <input type="text" id="currentPwd" name="currentPwd" class="modalInput" placeholder="현재 비밀번호">
						                                    <input type="hidden" id="userPwd" value="${loginUser.userPwd}">
						                                    	<div class="checkDiv" id="pwdCheck"></div>
						                                    <input type="password" id="newPwd" name="newPwd" class="modalInput" placeholder="새비밀번호">
						                                    	<div class="checkDiv" id="pwdForm"></div>
						                                    <input type="password" id="newPwdChk" name="newPwdChk" class="modalInput" placeholder="새비밀번호 확인">
						                                    	<div class="checkDiv" id="pwdFormCheck"></div>
						                                    <button type="submit" class="infoBtn" style="width: 100px;" onclick="return clickPwdUpdate();">비밀번호 변경</button>
				                                        </div>
		                                        	</div>
												</div>
												<!-- 비번 변경 모달창 END -->
	                                        	<button type="button" class="infoBtn" id="pwdChange">비밀번호 변경</button>
	                                        </form>
	                                        <!-- 각 url로 갈 때 userEmail 가져가기 -->
											<form name="userInfo">
												<input type="hidden" name="userEmail" id="userEmail" value="${ loginUser.email }">
											</form>
	                                        
	                                        <form action="userUpdate.me" method="post" enctype="Multipart/form-data">
		                                        <button type="button" class="infoBtn" id="myProfile">프로필 변경</button>
		                                        <!-- 프로필 새로 등록 -->
												<input type="file" id="profileImg" name="reloadFile" style="display : none">
												<!-- 회원이 원래 갖고 있던 프로필 -->
												<input type="hidden" name="userEmail" value=${ loginUser.email }>
												<input type="hidden" name="changeName" value="${ loginUser.changeName }">
											
<!-- 											<button type="button" class="infoBtn" id="basicProfile">기본 이미지로 변경</button> -->
											
	                                        
	                                       	<button type="button" class="infoBtn" id="deleteMember" style="background-color: lightgrey;">회원 탈퇴</button>
	                                        <!-- 회원 탈퇴 모달 START -->
										    <div class="deleteModal">
											    <div  class="deleteModal_body">
													<div><hr class="modal_line"></div>
										            	<div class="modal_content">동일 이메일로 재가입이 불가능합니다.<br/>정말 탈퇴 하시겠습니까?</div>
										            <div><hr class="modal_line"></div>
										            <div class="modal_button">
										                <button type="button" class="yBtn" onclick="clickDel(userInfo)">탈퇴하기</button>
										            </div>
	                                        	</div>
											</div>
											<!-- 회원 탈퇴 모달 END -->
											
											<div style="position:absolute; bottom:-30px; left:250px;"> * 프로필 사진은 하단 개인 정보 수정 버튼을 클릭해야 최종 변경이 이루어집니다</div>
											
	                                    </div>
	                                    </div>
	                                </div>
	                            </div>
		                    </div>
		                </div>
		            </div>
		        </div>
            </div>
        </div>
        
	
	    <div class="container">
		    <div class="row">
		        <div class="col">
		            <div class="row " style="padding: 10px;">
		                <div class="col-xl-12">
		                    <div class="card">
	                            <div class="card-body" style="padding-left: 80px;">
		                             <div class="row" id="blockitems">
		                                 <div class="col">
		                                 <p id="infoTitle">이메일</p>
			                                 <div class="area">
			                                     <input type="email" id="email" class="updateText" name="email" readonly value="${ loginUser.email }">
			                                 </div>
		                                 </div>
		                             </div>
	                                
	                                <div class="row" id="blockitems">
	                                    <div class="col">
	                                    <p id= "infoTitle">이름</p>
	                                        <div class="area">
	                                      		<input type="text" class="updateText" id="userName" name="userName" value="${ loginUser.userName }">
	                                      		<!-- span은 유효성 검사 문구 -->
	                                          	<span id="checkName">&nbsp;</span>
	                                        </div>
	                                    </div>
	                                </div>
	                                
	                                <div class="row" id="blockitems">
	                                    <div class="col">
	                                    <p id= "infoTitle">닉네임</p>
	                                        <div class="area">
	                                      		<input type="text" id="inputNickName" class="updateText" name="nickName" value="${ loginUser.nickName }">
	                                      		<!-- span은 유효성 검사 문구 -->
	                                          	<span id="checkNick" class="checkSpan">&nbsp;</span>
	                                        </div>
	                                    </div>
	                                </div>
	                                
	                                <div class="row" id="blockitems">
	                                    <div class="col">
	                                    <p id= "infoTitle">휴대전화</p>
	                                        <div class="area">
	                                      		<input type="text" id="phone" class="updateText" name="phone" value="${ loginUser.phone }" onkeyup="addHypen(this);">
	                                      		<!-- span은 유효성 검사 문구 -->
	                                          	<span id="checkPhone">&nbsp;</span>
	                                        </div>
	                                    </div>
	                                </div>
	                                
	                                
		                            <div class="row" id="blockitems">
		                               <div class="col">
		                               <p id="infoTitle">주소</p>
		                                   <div class="area">
		                                   <input type="text" class="updateText" name="address" id="address" value="${ loginUser.address }">
<%-- 				                                <input type="text" class="updateText" name="address" value="${ loginUser.address }"> --%>

				                                <br><br><br><br>
				                    			<button type="submit" onclick="clickUpdate(userInfo)" class="infoBtn" style="width: 400px;">개인 정보 수정</button>
		                                   </div>
		                               </div>
		                            </div>
	                            </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
	    </div>
	</form>
    
    
  </div>
</div>
        
<br><br><br><br>  

  <c:import url="../common/footer.jsp"/>
 <!-- Bootstrap core JavaScript -->
    <script src="resources/vendor2/jquery/jquery.min.js"></script>
    <script src="resources/vendor2/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="resources/vendor2/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="resources/js2/resume.min.js"></script>

	<script>
      $("#modalshow").click(function() {
    	  $('.modalBg').css({"visibility" : "visible"});
    });
    
    
    // 신고 '기타' 선택시 사유쓰는 칸 나오게
	$(document).ready(function() {
		  $('#selectOp').change(function() {
			    var result = $('#selectOp option:selected').val();
			    if (result == 'option1') {
			      $('.reason').show();
			    } else {
			      $('.reason').hide();
			    }
		  }); 
	})
		
	// 기둥이 스크롤 따라오게
	$(document).ready(function(){
		  var currentPosition = parseInt($("#sideNav").css("top"));
		  $(window).scroll(function() {
		    var position = $(document).scrollTop(); 
		    // 푸터 전에 멈추게 하는 조건
		    if($(window).scrollTop() <= $(document).height() - $(window).height() - $('footer').outerHeight()){
		    	$("#sideNav").stop().animate({"top":position+currentPosition+"px"},1000);
		    }
		  });
 	});
    
    // 비밀번호 변경 모달
    const body = document.querySelector('body');
    const modal = document.querySelector('.modal');
    const btnOpenPopup = document.querySelector('#pwdChange');

    btnOpenPopup.addEventListener('click', function(){
    	modal.classList.toggle('show');
		if (modal.classList.contains('show')) {
			body.style.overflow = 'hidden';
        }
    });
    
    modal.addEventListener('click', function(event){
        if (event.target === modal) {
			modal.classList.toggle('show');

			if (!modal.classList.contains('show')) {
				body.style.overflow = 'auto';
			}
        }
      });
    
    // 프로필 사진 클릭 시 사진 모달 띄우기
    $(function(){
	    $("img").click(function(){
	        let img = new Image();
	        img.src = $(this).attr("src")
	        $('.imgModalBox').html(img);
	        $(".imgModal").show();
	    });
		// 모달 클릭할때 이미지 닫음
    	$(".imgModal").click(function (e) {
    		$(".imgModal").toggle();
  		});
	});
    
    
    // 회원 탈퇴 모달
    const bodyTag = document.querySelector('body');
    const deleteModal = document.querySelector('.deleteModal');
    const deleteMember = document.querySelector('#deleteMember');

    deleteMember.addEventListener('click', function(){
    	deleteModal.classList.toggle('show');
		if (deleteModal.classList.contains('show')) {
			bodyTag.style.overflow = 'hidden';
        }
    });
    
    deleteModal.addEventListener('click', function(event){
        if (event.target === deleteModal) {
        	deleteModal.classList.toggle('show');

			if (!deleteModal.classList.contains('show')) {
				bodyTag.style.overflow = 'auto';
			}
        }
      });
    
    
    // 프로필 이미지 변경시 미리보기
    var inputImage = document.getElementById("profileImg");
    if(inputImage != null){
    	inputImage.addEventListener("change", function(){
    		// this : 이벤트가 발생한 요소(input type="file" id="profileImg")
    		// files : input type="file"만 사용 가능한 속성. 선택된 파일 목록(배열)을 반환
    		
    		// 파일 목록에서 첫번째 파일 객체 얻어오기
    		if(this.files[0] != undefined){	// 파일 선택이 되었으면
    			var reader = new FileReader();
    			// FileReader : 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 사용하는 객체
    			
    			reader.readAsDataURL(this.files[0]);
    			// 지정된 파일의 내용을 읽기 시작함
    			// 읽기가 완료되면 result 속성 data:에
    			// 읽어온 파일의 위치를 나타내는 URL이 포함된다.
    			// 이렇게 읽어온 URL을 이용하여 브라우저에서 이미지를 볼 수 있다.
    			// data:url(파일경로);
    			
    			// FileReader.onload = function(){}
    			// ---> FileReader가 파일을 다 읽어왔을 때 수행하는 함수
    			reader.onload = function(e){	//고정 이벤트 모델
    				// e : 이벤트 발생 객체
    				// e.target : 이벤트가 발생한 요소(객체) (여기서는 FileReader)
    				// e.target.result : FileReader가 읽어온 파일의 URL
    				
    				// 프로필 이미지 src속성의 값을 FileReader가 읽어온 파일의 URL로 변경하기
    				var profileImage = document.getElementById("profile");
    				profileImage.setAttribute("src", e.target.result);
    				var profileImage2 = document.getElementById("profile2");
    				profileImage2.setAttribute("src", e.target.result);
    				// setAttribute() 호출 시, 중복되는 속성이 존재하면 덮어쓰기가 된다
    				
    			}
    		}
    	});
    }
    
	// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
	$(function(){
		$("#profileArea").hide();
		
		$("#myProfile").click(function(){
			$("#profileImg").click();
		});
	});
	
	// 탈퇴하기 버튼 누르면 deleteUser.me로 가기
	function clickDel(formName){
		formName.action = "deleteUser.me";
		formName.method = "post";
		formName.submit();
	}
 
	// 비번 변경 모달에서 비밀번호 변경을 눌렀을때 실행하는 함수
	function clickPwdUpdate(){
		if($(".checkDiv").val() == '' && $('#newPwd').val() != ''){
// 			userInfo.action = "pwdUpdate.me";
// 			userInfo.method = "post";
// 			userInfo.submit();
			return true;
		} else {
			alert("비밀번호를 올바르게 입력해주세요");
			return false;
		}
	}
	
	var userPwd = $('#userPwd').val();
	console.log("userPwd : " + userPwd);
	var userEmail = $('#userEmail').val();
	console.log("userEmail : " + userEmail);
	// var currentPwd = $('#currentPwd').val(); 이렇게 하면 currentPwd에 계속 empty값이 들어감. 
	// 왜? 아무것도 입력하지 않은 상태의 $('#currentPwd').val()을 가져오기 때문. 입력 이벤트가 발생한 후의 $('#currentPwd').val()을 변수에 담아야 한다. 
	
	$('#currentPwd').on('keyup', function(){
		
		var currentPwd = $('#currentPwd').val();
		console.log(currentPwd);
		
		$.ajax({
			url: 'pwdCheck.me',
			data: {currentPwd:currentPwd, userEmail:userEmail},
			type: 'post',
			success: function(data){
				console.log(data);	// 맞는 비번이면 1, 틀리면 0
				if(data == 1){
					$('#pwdCheck').text('');
				} else {
					$('#pwdCheck').text('현재 비밀번호와 일치하지 않습니다');
				}
			},
			error: function(data){
				console.log(data);
			}
		});
	}).on('blur', function(){
		if($('#pwdCheck').text() != ''){
			$('#currentPwd').val('');
		} else if ($('#currentPwd').val() == ''){
			$('#pwdCheck').text('현재 비밀번호를 입력해 주세요');
			$('#currentPwd').focus();
		}
	});
	
	// 비밀번호 정규식
	var regPwd = !/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
	$('#newPwd').keyup(function(){
		if(regPwd.test($('#newPwd').val())){
			$('#pwdForm').html('');
		} else {
			$('#pwdForm').html('영어 소문자, 숫자, 특수문자를 포함하여 </br> 최소 8자 이상 입력해 주세요');
		}
	});
	
	$('#newPwdChk').keyup(function(){
		if($('#newPwdChk').val() == $('#newPwd').val()){
			$('#pwdFormCheck').text('');
		} else {
			$('#pwdFormCheck').text('새비밀번호가 일치하지 않습니다');
		}
	});
	
	// 하이픈 자동완성
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
 
 // < 연락처 > 
    /* 정규식(010-xxxx-xxxx 양식 '-' 사용가능) */
    $("#phone").on('keyup', function(){
       var phone = $('#phone').val().trim();
       var regPhone = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
       if (regPhone.test(phone) == false || phone == ('')) {
          $('#checkPhone').text("유효하지 않는 휴대전화 번호입니다").css('color', "orangered");
       }else {
          $('#checkPhone').text('');
          return false;
       }
    });


 	// < 닉네임 >
    /* 정규식 (한글, 영문, 숫자만 가능하며 2-10자리 가능) */
	$('#inputNickName').on('change paste keyup', function(){
		var nickname = $('#inputNickName').val().trim()
		if (!/^[a-zA-Zㄱ-힣0-9-_.]{2,12}$/.test(nickname) && nickname != ("")){
			$('#checkNick').text('한글,영어,숫자,-_ 중 자유롭게 사용 가능').css('color', 'orangered');
			return false;
		}else{
			$('#checkNick').text('');
	         
			var isUserble = false;   // 중복 시 false, 사용 가능 시 true
			var isNiChecked = false;
	         
			// 중복 검사
			$.ajax({
				url: 'dupNick.me',
				data: {nickName:nickname},
				success: function(data){
					console.log(data);
					if(data == '0'){
						isUsable = true;
						isNiChecked = true;
					} else if(data = '1'){
						$('#checkNick').text("이미 사용중인 닉네임입니다.").css('color', "orangered");
						$('#inputNickName').val('');
						isUsable = true;
						isNiCheked = false;
					}
				},
				error: function(data){
					console.log(data);
				}	
			});
			
		}
	});
    
	// < 이름 >
		/* 정규식(한글,영어만 사용가능) */
		$('#userName').on('change paste keyup', function(){
			var userName = $('#userName').val().trim();
			var regex = /^[가-힣a-zA-Z]+$/;
			
			if(regex.test(userName) || userName ==('')) {
				$('#checkName').text('');
				// $(this).val('');
				$(this).focus();
		
				return false;
			} else {
				$('#checkName').text('이름을 확인해주세요.').css('color' , 'orangered');
			}
		});
    
    // 주소 input을 클릭하면 카카오맵 팝업창 실행
    $('#address').on('click', function(){
        new daum.Postcode({
            oncomplete: function(data) {
			     // 팝업에서 검색 결과 주소를 클릭 했을 때 주소 input칸에 입력되게 함 
                document.querySelector('#address').value = data.address;
            }
        }).open();
    })
    
	// 최종적으로 개인 정보 수정 버튼을 눌렀을 때 모든 값이 잘 입력 되어 있는지 검사
    function clickUpdate(userInfo){
    	if($('.checkSpan').val() == '' && $('.updateText')[0].classList != ''){
    		return true;
    	} else {
    		alert("회원 정보를 올바르게 입력해주세요");
    		return false;
    	}
    }
	
    </script>
  </body>
</html>