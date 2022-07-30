<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>WITHTRIP :: 함께라서 좋은 여행</title>
<style>

	/* 스크롤바 START */
	body::-webkit-scrollbar {
	    width: 10px;  /* 스크롤바의 너비 */
	}
	
	body::-webkit-scrollbar-thumb {
	    height: 30%; /* 스크롤바의 길이 */
/* 	    background: #217af4; /* 스크롤바의 색상 */ 
	    background: #6495ED;
	    
	    border-radius: 10px;
	}
	
	body::-webkit-scrollbar-track {
	    background: rgba(33, 122, 244, .1);  /*스크롤바 뒷 배경 색상*/
	}
	/* 스크롤바 END */

	/* navbarMain start */
	#list1, #list2, #list3, #list4, #list5{font-weight: bold;}
	#home{
		font-family: 'Raleway', sans-serif; font-weight: bold;
	}
	/* navbarMain end */
	
	/* footer start */
	footer{font-family: 'Noto Sans KR', sans-serif;}
	.list-unstyled>li>a{
		color: rgb(174, 179, 208);
	}
	/* footer end */
	
	/* 	to top start */
	.btn-lg-square {
	    width: 48px;
	    height: 48px;
	}
	.btn-square,
	.btn-sm-square,
	.btn-lg-square {
	    padding: 0;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    font-weight: normal;
	}
	.back-to-top {
	    position: fixed;
	    display: none;
	    right: 30px;
	    bottom: 30px;
	    z-index: 99;
	}
	#top{position: absolute; right: 10px;}
	#button{right: 130px;}
	/* 	to top end */
	
	
	/* Read more 버튼 */
	#readMore {
		width: 100px;
		height: 35px;
		background: #6495ED;
		cursor: pointer;
		border-style: none;
		color: white;
		border-radius: 3px;
	}
	
	#readMore:hover {
		background-color: black;
		color: white;
	}
	
	.heading {
	 	overflow: hidden;
	 	text-overflow: ellipsis;
	 	white-space: nowrap;
	}
	
	#tSize {
		width: 100%;
	}
	
	.TripDate{
		display: inline;
		font-weight: 700;
		width: 78px;
		font-size: 18px;
		color: white;
		pointer-events: none;
		background: none;
    	border: none;
	}
	
	.two{
		display: flex;
	}
	
	#trip1{
		color: white;
    	margin-top: 3px;
	}
	.homeModalBack{
		top :0; left: 0; z-index: 1000; width: 100%; height: 100%;
/* 		background-color: rgba(0,0,0,0.8); */
	}
	#popupbox{
		position: absolute;
    	top: 35%;
    	left: 18%; width:400px; height: 450px;
		transform : translate(-50%, -50%); 
		z-index: 1002; box-sizing: border-box; 
		box-shadow: 5px 20px 10px 5px  rgba(0,0,0,0.35);
		-wekit-box-shadow : 5px 5px 10px 5px rgba(0,0,0,0.35);
		-moz-box-shadow : 5px 5px 5px 5px rgba(0,0,0,0.35);
	}
	.homecontent{
		padding: 3px; line-height: 1rem; 
	}
	.homeModalclose{
		width: 400px; height: 30px;
		background-color: #fff;
		padding: 5px;
		cursor: pointer;
	}
	
	#modalImg{
	width: 400px; height: 450px;
	}
	
	#mdclose{
		margin-left: 180px;
	}
	
	#navMyInfo:hover{cursor: pointer;}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Arizonia&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css4/animate.css">
<!-- <link rel="stylesheet" href="resources/css/owl.carousel.min.css"> -->
<!-- <link rel="stylesheet" href="resources/css/owl.theme.default.min.css"> -->
<link rel="stylesheet" href="resources/css4/magnific-popup.css">
<link rel="stylesheet" href="resources/css4/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/css4/jquery.timepicker.css">
<!-- <link rel="stylesheet" href="resources/css/flaticon.css"> -->
<link rel="stylesheet" href="resources/css4/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body style="overflow-x: hidden; font-family: 'Noto Sans KR', sans-serif;">
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<%-- <c:import url="common/navbarMain.jsp"/> --%>
<!-- navbar START -->
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light">
		<div class="container">
			<a href="<%= request.getContextPath() %>/home.do"><img alt="logo" src="resources/images4/logo4.png" width="130px"></a>
<!-- 			<a class="navbar-brand" href="index.jsp" style="font-family: 'Raleway', sans-serif;">WITHTRIP</a> -->
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a href="home.do" class="nav-link" id="home" style="font-family: 'Raleway', sans-serif;">
							<svg id="svg" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
							  <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
							</svg> Home
						</a>
					</li>
					<li class="nav-item"><a href="nlist.no" class="nav-link" id="list1">공지</a></li>
					<li class="nav-item"><a href="tlist.to" class="nav-link" id="list2">동행</a></li>
					<li class="nav-item"><a href="glist.go" class="nav-link" id="list3">상점</a></li>
					<c:if test="${ !empty sessionScope.loginUser && loginUser.managerYN == 'N' }">
					<li class="nav-item" id="navMyInfo"><a onclick="myPage();" class="nav-link" id="list4">마이페이지</a></li>
					</c:if>
					<c:if test="${ loginUser.managerYN == 'Y' }">
					<li class="nav-item"><a href="adminManage.ad" class="nav-link" id="list4">관리자페이지</a></li>
					</c:if>
					<c:if test="${ empty sessionScope.loginUser }">
						<li class="nav-item"><a href="loginView.me" class="nav-link" id="list5">로그인 / 회원가입</a></li>
					</c:if>
					<c:if test="${ !empty sessionScope.loginUser }">
						<li class="nav-item"><a href="logout.me" class="nav-link" id="list5">로그아웃</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
<!-- 	END nav -->
 <div class="homeModalBack">
 <div id ="popupbox">
 	<div class ="homecontent">
 	<img id="modalImg" src="resources/image2/popup2.png">
 	<div class="homeModalclose">
	<a id="today_close" onclick="todayClose('popupbox', 1);">오늘 하루동안 보지 않기</a>
	<a id="mdclose" onclick="toClose();">닫기</a>
 	</div>
 	</div>
 	</div>
 </div>
	<div class="hero-wrap js-fullheight" style="background-image: url('resources/images4/mainIMG.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center" data-scrollax-parent="true">
				<div class="col-md-7 ftco-animate">
<!-- 					<span class="subheading">함께 떠나는 여행</span> -->
					<h1 class="mb-4">위드 트립에서 동행을 찾아보세요</h1>
					<p class="caps">훌쩍 떠나고 싶은데, 혼자 가기는 심심할 것 같고.. 아무나 함께 하기 싫다면? <br>
					위드 트립과 함께 취향 저격 동행자를 찾아보세요! </p>
				</div>
				<a href="https://vimeo.com/259075537" class="icon-video popup-vimeo d-flex align-items-center justify-content-center mb-4">
					<span class="fa fa-play"></span>
				</a>
			</div>
		</div>
	</div>

		<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center pb-4">
					<div class="col-md-12 heading-section text-center ftco-animate">
						<h2 class="mb-4">취향저격 동행찾기</h2>
					</div>
				</div>
				<div class="row d-flex" onclick="checkLogin()">

					<c:forEach var="tlist" begin="0" end="2" items="${ tlist }">
						<div class="col-md-4 d-flex ftco-animate">
							<div class="blog-entry justify-content-end" id="tSize">
							<c:if test="${ t.boardId == t.tripId }"> 
								<img class="block-20" src="${contextPath}/resources/tuploadFiles/${tlist.renameFileName}">
							</c:if>
								<div class="text">
									<input id="num" type="hidden" value="${tlist.boardId}">
									<div class="d-flex align-items-center mb-4 topp">
										<div class="two" >
											<input class="TripDate" readonly value="<fmt:formatDate value="${ tlist.tripStart }" pattern = "MM월dd일"/>" >
											<b id="trip1">~</b>
											<input class="TripDate" readonly value="<fmt:formatDate value="${ tlist.tripEnd }" pattern = "MM월dd일"/>" >
										</div>
									</div>
									<jsp:useBean id="presentTime" class="java.util.Date" />
									<fmt:formatDate value="${presentTime}" pattern="yyyy-MM-dd" var="todayTime" />
									<c:if test="${tlist.tripStart <= todayTime}">마감</c:if>
									<c:if test="${tlist.tripStart > todayTime}">모집중</c:if>
									<h3 class="heading">${ tlist.boardTitle }</h3>
									<div class="row">
										<div class="col">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
											  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
											  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
											</svg> ${ tlist.nickName }
										</div>
										<div class="col">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
											  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
											  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
											</svg>${ tlist.boardCount }
										</div>
									</div>
									<br>
									<button id="readMore">상세보기</button>
									<script type="text/javascript" language="javascript"> 
									 	 $('.text').click(function(){
									 		 var currentPage = 1;
									         var bId = $(this).find('#num').val();
									         
									         location.href = 'tdetail.to?bId=' + bId + "&page=" + currentPage;
									      });
									 	 
									</script>
								</div>
							</div>
						</div>
					</c:forEach>
					
				</div>
			</div>
		</section>
		
		<section class="ftco-section ftco-about img"style="background-image: url(resources/images4/bg_2.jpg);">
			<div class="overlay"></div>
			<div class="container py-md-5">
				<div class="row py-md-5">
					<div class="col-md d-flex align-items-center justify-content-center">
<!-- 						<a href="https://vimeo.com/45830194" class="icon-video popup-vimeo d-flex align-items-center justify-content-center mb-4"> -->
<!-- 							<span class="fa fa-play"></span> -->
<!-- 						</a> -->
					</div>
				</div>
			</div>
		</section>
		
		
		<!-- 여행용품 메인 시작 -->
		<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center pb-4">
					<div class="col-md-12 heading-section text-center ftco-animate">
						<span class="subheading">여행의 시작</span>
						<h2 class="mb-4">취향저격 여행용품</h2>
					</div>
				</div>
				
				<!-- ajax로 바뀔 부분(mainGoodsList.jsp 부분) -->
				<div class="row" id="goods_area"></div>
				
				
			</div>
		</section>
		<script>
		$(document).ready(function(){
			$.ajax({
				url: 'goodsList.go',
				success: function(data) {
					console.log(data);
					
					$("#goods_area").replaceWith(data);				
									
				},
				error: function(data){
					console.log(data);
				}
			});			
		});
		
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

		
		   console.log("무슨 상태야? = " + "${ loginUser.userStatus }");
		   function myPage(){
		      if(${ loginUser.userStatus == 'S' }){
		         alert('정지 회원은 접근이 불가합니다');
		         return false;
		      } else {
		         location.href="updateMyInfo.me";
		         return true;
		      }
		   }
		
		</script>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


<!-- footer, toTop, chat -->
<%-- <c:import url="common/footer.jsp"/> --%>

<br>


<!-- footer start -->
		<footer class="bg-bottom ftco-no-pt" style="background-image: url(resources/images4/footer1.jpg); ">
			<div class="container" style="font-weight: bolder">
				<div class="row mb-0" style="color: rgb(174, 179, 208);">
					<div class="col-md pt-0">
						<div class="ftco-footer-widget pt-md-5 mb-4">
							<img alt="logo" src="resources/images4/logo6.png" width="200px">
						</div>
					</div>
					<div class="col-md pt-1">
						<div class="ftco-footer-widget pt-md-5 mb-4 ml-md-5">
							<h6 class="ftco-heading-2" style="color: #fff; font-weight: bolder">INFORMATION</h6>
							<ul class="list-unstyled">
								<li><a href="${ contextPath }/privacy.do" class="py-2 d-block">개인정보처리방침</a></li>
		                        <li><a href="${ contextPath }/service.do" class="py-2 d-block">이용약관</a></li>
		                        <li><a href="${ contextPath }/refund.do" class="py-2 d-block">취소 및 환불 정책</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md pt-1">
						<div class="ftco-footer-widget pt-md-5 mb-4" style="font-weight: bolder">
							<h6 class="ftco-heading-2" style="color: #fff; font-weight: bolder">고객센터</h6>
							<ul class="list-unstyled">
								<li><a href="${ contextPath }/nlist.no" class="py-2 d-block">공지사항</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md pt-1">
						<div class="ftco-footer-widget pt-md-5 mb-4">
							<h6 class="ftco-heading-2" style="color: #fff; font-weight: bolder">(주)위드트립</h6>
							<div class="block-23 mb-3">
								<ul>
									<li>
										<span class="icon fa fa-map-marker"></span>
										<span style="color: #fff; font-weight: bolder">서울특별시 강남구 역삼동</span>
									</li>
									<li>
										<span class="icon fa fa-phone"></span>
										<span style="color: #fff; font-weight: bolder">010-9468-8140</span>
									</li>
									<li>
										<span class="icon fa fa-paper-plane"></span>
										<span style="color: #fff; font-weight: bolder">rosemary4110@naver.com</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				</div>
			</footer>

<!-- footer end -->



<!-- to Top -->
   <a class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top" id="button">
   	<svg xmlns="http://www.w3.org/2000/svg" width="25" height="30" fill="currentColor" class="bi bi-chevron-double-up" viewBox="0 0 16 16" id="top">
	  <path fill-rule="evenodd" d="M7.646 2.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 3.707 2.354 9.354a.5.5 0 1 1-.708-.708l6-6z"/>
	  <path fill-rule="evenodd" d="M7.646 6.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 7.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
	</svg>
   </a>
<!-- to Top -->


<!-- 관리자와의 1:1 채팅 start -->
<!--Start of Tawk.to Script-->
    <script type="text/javascript">
    var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
    (function(){
    var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
    s1.async=true;
    s1.src='https://embed.tawk.to/62a950987b967b11799496c9/1g5im5lc6';
    s1.charset='UTF-8';
    s1.setAttribute('crossorigin','*');
    s0.parentNode.insertBefore(s1,s0);
    })();
    </script>
<!--End of Tawk.to Script-->
<!-- 관리자와의 1:1 채팅 end -->

<script>
		var btn = $('#button');
		
		$(window).scroll(function() {
		  if ($(window).scrollTop() > 300) {
		    btn.addClass('show');
		  } else {
		    btn.removeClass('show');
		  }
		});
		
		btn.on('click', function(e) {
		  e.preventDefault();
		  $('html, body').animate({scrollTop:0}, '300');
		});
</script>

<script>
	todayOpen('popupbox');
	// 창열기  
	function todayOpen(winName) {
	  var blnCookie = getCookie(winName);
	  var obj = eval("window." + winName);
	  console.log(blnCookie);
	  if (!blnCookie) {
	    obj.style.display = "block";
	  } else {
	    obj.style.display = "none";
	  }
	}
	// 창닫기  
	function todayClose(winName, expiredays) {
	  setCookie(winName, "expire", expiredays);
	  var obj = eval("window." + winName);
	  obj.style.display = "none";
	}
	// 쿠키 가져오기  
	function getCookie(name) {
	  var nameOfCookie = name + "=";
	  var x = 0;
	  while (x <= document.cookie.length) {
	    var y = (x + nameOfCookie.length);
	    if (document.cookie.substring(x, y) == nameOfCookie) {
	      if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
	        endOfCookie = document.cookie.length;
	      return unescape(document.cookie.substring(y, endOfCookie));
	    }
	    x = document.cookie.indexOf(" ", x) + 1;
	    if (x == 0)
	      break;
	  }
	  return "";
	}
	
	//24시간 기준 쿠키 설정하기  
	// 만료 후 클릭한 시간까지 쿠키 설정  
	function setCookie(name, value, expiredays) {
	  var todayDate = new Date();
	  todayDate.setDate(todayDate.getDate() + expiredays);
	  document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}


function toClose(){
	$(".homeModalBack").css("display", "none");
	document.getElementsByClassName("homeModalBack").style.display = "none";
	

}
</script>
<script src="resources/js4/jquery.min.js"></script>
<script src="resources/js4/jquery-migrate-3.0.1.min.js"></script>
<script src="resources/js4/popper.min.js"></script>
<script src="resources/js4/bootstrap.min.js"></script>
<script src="resources/js4/jquery.waypoints.min.js"></script>
<script src="resources/js4/jquery.stellar.min.js"></script>
<script src="resources/js4/owl.carousel.min.js"></script>
<script src="resources/js4/jquery.magnific-popup.min.js"></script>
<script src="resources/js4/jquery.animateNumber.min.js"></script>
<script src="resources/js4/scrollax.min.js"></script>
<script src="resources/js4/main.js"></script>
<script src="resources/js4/bootstrap-datepicker.js"></script>
<!-- <script src="resources/js4/google-map.js"></script> -->
<!-- <script src="resources/js4/jquery.easing.1.3.js"></script> -->
</body>
</html>