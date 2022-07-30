<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<title>WITHTRIP :: 함께라서 좋은 여행</title>

<style>

#gName:hover {
   color: #6495ED;
}

.project-wrap:hover {
   cursor: pointer;
}

</style>

	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Arizonia&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="resources/css4/animate.css">
	<link rel="stylesheet" href="resources/css4/magnific-popup.css">
	<link rel="stylesheet" href="resources/css4/bootstrap-datepicker.css">
	<link rel="stylesheet" href="resources/css4/jquery.timepicker.css">
	<link rel="stylesheet" href="resources/css4/style.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>

<body style="overflow-x: hidden; font-family: 'Noto Sans KR', sans-serif;">
		
		<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>

		<div class="row" id="goods_area"> 
			<c:forEach var="g" items="${ gList }"> 
				<div class="col-md-4 ftco-animate">
					<div class="project-wrap">
						<a class="img" style="background-image: url(${ contextPath }/resources/guploadFiles/${ g.changeName });">
						</a>
						<div class="text p-4" style="height: 200px;">
							<input type="hidden" value="${ g.goodsId }" class="goodsId">
							<c:if test="${ g.gcateNo == 1 }">
								<span class="days">#${ g.goodsBrand } #가방 </span>
							</c:if>
							<c:if test="${ g.gcateNo == 2 }">
								<span class="days">#${ g.goodsBrand } #안전용품 </span>
							</c:if>
							<c:if test="${ g.gcateNo == 3 }">
								<span class="days">#${ g.goodsBrand } #악세사리</span>
							</c:if>
								<div style="height: 100%; overflow: hidden;">
									<h5><a id="gName">${ g.goodsName }</a></h5>
									<div style="margin-top: 20px;">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-tags" viewBox="0 0 16 16">
									  <path d="M3 2v4.586l7 7L14.586 9l-7-7H3zM2 2a1 1 0 0 1 1-1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 2 6.586V2z"/>
									  <path d="M5.5 5a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm0 1a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zM1 7.086a1 1 0 0 0 .293.707L8.75 15.25l-.043.043a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 0 7.586V3a1 1 0 0 1 1-1v5.086z"/>
									</svg>
										<c:set var="price" value="${ g.price }"/>
										<span style="color: black; font-size: 17px; margin-left: 5px;">${ fn:split(price,'/')[0]}원</span>
									</div>
								</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>


<script>
	$('.project-wrap').click(function(){
		var currentPage = 1;
		var gId = $(this).find('.goodsId').val();
		location.href = 'gdetail.go?gId=' + gId + "&page=" + currentPage;
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
<script src="resources/js4/main.js"></script>
<script src="resources/js4/bootstrap-datepicker.js"></script>

</body>
</html>