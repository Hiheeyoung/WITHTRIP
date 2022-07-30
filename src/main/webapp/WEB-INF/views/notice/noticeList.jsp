<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WITHTRIP :: 함께라서 좋은 여행</title>
<script src="resources/js6/jquery-3.6.0.min.js"></script>
<style type="text/css">

.darken-grey-text {
    color: #2E2E2E;
}
.input-group.md-form.form-sm.form-2 input {
    border: 1px solid #bdbdbd;
    border-top-left-radius: 0.25rem;
    border-bottom-left-radius: 0.25rem;
}
.input-group.md-form.form-sm.form-2 input.purple-border {
    border: 1px solid #9e9e9e;
}
.input-group.md-form.form-sm.form-2 input[type=text]:focus:not([readonly]).purple-border {
    border: 1px solid #ba68c8;
    box-shadow: none;
}
.form-2 .input-group-addon {
    border: 1px solid #ba68c8;
}
.danger-text {
    color: #ff3547; 
}  
.success-text {
    color: #00C851; 
}
.table-bordered.red-border, .table-bordered.red-border th, .table-bordered.red-border td {
    border: 1px solid #ff3547!important;
}        
.table.table-bordered th {
    text-align: center;
}


	/* 공지 배너 start */
	.page-head {
		background: url(resources/images/notice2.jpg);
		background-size: cover;
		background-position: center;
		background-repeat: no-repeat;
	}
	.header-wrapper {
		background-color: rgba(0, 0, 0, 0.30);
		position: relative;
		padding: 120px 0px;
	}
	.container1 {
		padding-right: 115px;
		padding-left: 115px;
		margin-right: auto;
		margin-left: auto;
		box-sizing: border-box;
	}
	.trip-title {
		background-color: transparent;
		font-size: 17px;
		float: left;
		list-style: none;
	}
	.row1 {
		flex-wrap: wrap;
		display: flex;
		padding: 0px 130px;
	}
	.trip-title-li {
		color: white;
		display: block;
		margin-bottom: 3px;
		font-size: 15px;
	}
	#trip-title-text {
		font-size: 35px;
		font-family: 'Raleway', sans-serif;
	}
	#trip-title-text2{
		font-family: 'Raleway', sans-serif;
	}
	/* 공지 배너 end */
	
		
	/* 템플릿 페이지네이션 */
	#paging:hover{
		background-color: #4285F4;
		color: white;
	}
	#adminWrite{
		border-radius: none;
		
	}
	/* 페이징버튼 */
.paging-button {
	background-color: white;
	border: 1px solid #e6e6e6;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	margin-bottom: 60px;
	font-weight: 700;
	color: #4285F4;
}

.paging-button:hover{
	background-color: #4285F4;
	color: white;
}


/* 글쓰기 버튼 */
#notice-writing {
   margin-left: 80%;
   margin: 0 0 20px 83%;
   width: 70px;
   height: 30px;
   font-size: 15px;
   background: #6495ED;
   cursor: pointer;
   border-style: none;
   color: white;
   border-radius: 3px;
}

#notice-writing:hover{
	color: white;
	 background: #000000;
	 border: 2px solid #000000;
	}

.contentTr{
	cursor: pointer;
}
	
</style>
</head>
<body class="hm-gradient" style="overflow-x: hidden; font-family: 'Noto Sans KR', sans-serif;">
<!--nav -->
<c:import url="../common/navbar.jsp"/>
<!--nav end  -->

<!-- 공지사항 배너 start -->
	<div class="hero-wrap js-fullheight h-50">
		<div class="page-head">
			<div class="header-wrapper" style="background-image:url('resources/images1/noticeImg.jpg')">
				<div class="container1">
					<div class="row1">
						<ol class="trip-title">
							<li class="trip-title-li" id="trip-title-text" style="color:#6495ED;;"><b>Notice</b></li>
							<li class="trip-title-li" id="trip-title-text2" style="color:black;">Check the announcement contents</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 공지사항 배너 end -->

<br><br><br>

<!-- 공지사항 리스트 -->
	<div class="container mt-4 text-center">
		<div class="card">
 			<div class="card-body">
					<!-- Grid row -->
					<div class="row">
						<!-- Grid column -->
						<div class="col-md-12">
							<h2 class="py-3 text-center font-bold font-up blue-text"></h2>
						</div>
						<!-- Grid column -->
					</div>
				                 <!-- Grid row -->
				                 <!--Table-->
             	<table class="table table-hover">
				<!--Table head start -->
                    <thead>
                    	<tr>
                            <th scope="row">글번호</th>
                            <th class="th-lg" colspan="2"><a>제목</a></th>
                            <th class="th-lg"><a>날짜</a></th>
                            <th class="th-lg"><a>작성자</a></th>
                            <th class="th-lg"><a>조회수</a></th>
                        </tr>
                    </thead>
					<c:forEach var="n" items="${ fixList }" > <!-- begin="0" end="4" -->
                    <tbody>
                        <tr class="contentTr">
                             <td scope="row" nId="${ n.noticeId }">
                             	<input type="hidden" value="${ n.noticeId }" />
                             	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
						  			<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
								</svg>
                             </td>
                             <td colspan="2">${ n.noticeTitle }</td>
                             <td>${ n.noticeDate }</td>
                             <td>관리자</td>
                             <td>${n.noticeCount}</td>
                        </tr>
					</c:forEach>
					<c:forEach var="n" items="${ list }">
                        <tr class="contentTr">
                            <td scope="row" nId="${ n.noticeId }">
                             	${ n.noticeId }
                            </td>
                            <td colspan="2">${ n.noticeTitle }</td>
                            <td>${ n.noticeDate }</td>
                            <td>관리자</td>
                        	<td>${n.noticeCount}</td>
                    	</tr>
					</c:forEach>
                    </tbody>
                    	<!--Table body end-->
                </table>
				                   
				<br>
				<c:if test="${ loginUser.managerYN == 'Y' }">                   
				<button type="button" id="notice-writing" onclick="location.href='noticeWrite.no';">글쓰기</button>
				</c:if>
				
				<!-- 페이징 처리 -->
				<div class="paging" align="center">
				
				<br>
				
				  	<c:if test="${ pi.currentPage <= 1 }">
				   		<button class="paging-button">&lt;</button>
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
				 	<c:url var="before" value="nlist.no">
				 		<c:param name="page" value="${ pi.currentPage - 1 }"/>
				 	</c:url>
				 		<button type="button" onclick="location.href='${ before }'" class="paging-button">&lt;</button>
					</c:if>
				   
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				  	<c:if test="${ p eq pi.currentPage }">
				    	<button class="paging-button" style="background-color:#6495ED; color:white;">${ p }</button>
				  	</c:if>
				  
				  	<c:if test="${ p ne pi.currentPage }">
				  	<c:url var="pagination" value="nlist.no">
				      	<c:param name="page" value="${ p }"/>
				   	</c:url>
				    	<button type="button" onclick="location.href='${ pagination }'" class="paging-button">${ p }</button>
				  	</c:if>
				</c:forEach>
				   
				<!-- [다음] -->
				   	<c:if test="${ pi.currentPage >= pi.maxPage }">
				      	<button class="paging-button">&gt;</button>
				   	</c:if>
				   	<c:if test="${ pi.currentPage < pi.maxPage }">
				     	<c:url var="after" value="nlist.no">
				         	<c:param name="page" value="${ pi.currentPage + 1 }"/>
				      	</c:url>
				      	<button type="button" onclick="location.href='${ after }'" class="paging-button">&gt;</button>
						</c:if>
				</div>
				<!-- 페이징 처리 끝 -->

			</div>
		</div>
	</div>
	
	
<!-- foot -->
<c:import url="../common/footer.jsp"/>
<!-- foot end -->	
<script>
		$('.contentTr').click(function(){
			var nId = $(this).children('td').eq(0).attr('nId');
			location.href = 'ndetail.no?nId=' + nId + "&page=" + ${pi.currentPage};
		});	

	
	
</script>

<br clear="all">


<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
</body>
</html>