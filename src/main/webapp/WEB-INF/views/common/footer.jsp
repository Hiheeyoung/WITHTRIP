<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WITHTRIP :: 함께라서 좋은 여행</title>
<style type="text/css">
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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Raleway:ital,wght@0,100;0,300;1,300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Merriweather:400,900,900i" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>



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