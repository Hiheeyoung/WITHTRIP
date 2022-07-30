<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>WITHTRIP :: 함께라서 좋은 여행</title>
<style type="text/css">
	#list1, #list2, #list3, #list4, #list5{font-weight: bold;}
	#home{
		font-family: 'Raleway', sans-serif; font-weight: bold;
	}
	
	#navMyInfo:hover{cursor: pointer;}
	
</style>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap" rel="stylesheet">
</head>
<body style="overflow-x: hidden; font-family: 'Noto Sans KR', sans-serif;">
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top" id="ftco-navbar" style="border-bottom: 1px solid #F5F5F5;">
		<div class="container">
			<a href="${ contextPath }/home.do"><img alt="logo" src="resources/images4/logo4.png" width="130px"></a>
<!-- 			<a class="navbar-brand" href="index.jsp" style="font-family: 'Raleway', sans-serif;">WITHTRIP</a> -->
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a href="${contextPath}/home.do" class="nav-link" id="home">
							<svg id="svg" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
							  <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
							</svg> Home
						</a>
					</li>
					<li class="nav-item"><a href="nlist.no" class="nav-link" id="list1">공지</a></li>
					<li class="nav-item"><a href="tlist.to" class="nav-link" id="list2">동행</a></li>
					<li class="nav-item"><a href="glist.go" class="nav-link" id="list3">상점</a></li>
					<c:if test="${ !empty sessionScope.loginUser && loginUser.managerYN == 'N'  }">
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


<script>
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="resources/js4/main.js"></script>
<script src="resources/js4/bootstrap-datepicker.js"></script>
<!-- <script src="resources/js4/jquery.easing.1.3.js"></script> -->
<!-- <script src="resources/js4/google-map.js"></script> -->
</body>
</html>