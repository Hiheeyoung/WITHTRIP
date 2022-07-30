<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>WITHTRIP :: 함께라서 좋은 여행</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/vendor3/bootstrap/css/bootstrap_admin.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Grape+Nuts&family=Noto+Sans+KR:wght@300&family=Raleway:wght@100;&family=Titillium+Web&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
    <!-- Custom styles for this template -->
    <link href="resources/css3/admin.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/dd62c289ec.js" crossorigin="anonymous"></script>

    <!-- 탑버튼 -->    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


  </head>
  <style>

.bg-blue:hover{
	background-color: #6495ED;
	color: #fff;
	cursor: pointer;
}

#cate1{
background-color: #ccdbfd;
box-shadow: inset 2px 2px 2px;
transform :translateY(3px); 
}
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
  </style>
  <body>
  
  <!-- navbar -->
   <c:import url="../common/navbar.jsp"/>
   
 
<!-- sideNav -->
            <nav class="navbar navbar-expand-lg navbar-dark fixed-top"  id="sideNav">
	<a class="navbar-brand js-scroll-trigger"  href="#page-top">
	  <span class="d-block d-lg-none" >With Trip</span>
	  
	<c:if test="${ mNo != loginUser.member_no }">
		  <span class="d-none d-lg-block" >
			<c:if test="${loginUser.changeName == null}">
		    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="resources/image2/profile.png" alt="프로필 사진">
			</c:if>
			<c:if test="${loginUser.changeName != null}">
		    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/profileUploadFiles/${loginUser.changeName}" alt="프로필 사진">
		  	</c:if>
		  </span>
	</c:if>
	
	<c:if test="${ mNo == loginUser.member_no }">
        <span class="d-none d-lg-block" >
        	<c:if test="${loginUser.changeName == null}">
		    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/image2/profile.png" alt="프로필 사진">
			</c:if>
			<c:if test="${loginUser.changeName != null}">
		    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/profileUploadFiles/${loginUser.changeName}" alt="프로필 사진">
		  	</c:if>
        </span>
	</c:if>
	</a>
            <div class="collapse navbar-collapse"  id="navbarSupportedContent">
                <ul class="navbar-nav">
                <li>
                    <a id="nickName">관리자</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="adminIfPage.ad">계정 관리</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="adminManage.ad">회원 관리</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="adminReport.ad">신고 목록</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="noticePost.ad" style="margin-bottom: 150px; color:#fff;">작성글 관리</a>
                </li>
                <li class="nav-item">
                    <a class="prd" href="prdManage.ad">상품관리 바로가기<i class="fa-solid fa-arrow-right-long"></i></a>
                </li>
                </ul>
            </div>
            </nav> 
        <!-- sideNav -->
<!-- 프사 클릭 시 확대 모달 -->
<div class="imgModal">
    <div class="imgModalBox">
    </div>
</div>            
        
<div class="container rounded mt-5 bg-white p-md-5" id="content_container">

	<!-- 페이지 타이틀 -->
   <div  id= "catearea">
    <button class="cate" id="cate1" type="button">공지사항</button> 
    <button class="cate" id="cate2" onclick="location.href='goodsPost.ad';">여행용품</button>
    </div>
<!--  -->
    <div class="table-responsiveM">
        <table class="admin_table" >
            <thead>
                <tr>
                	<th scope="col" style="width: 80px;">번호</th>
                    <th scope="col" style="width: 700px;">글 제목</th>                    
                    <th scope="col">작성일</th>                    
                    <th scope="col">수정일</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="n" items="${ list }">
            	 <tr class="bg-blue">
            		<td>${ n.noticeId }</td>
            		<td>${ n.noticeTitle }</td>
            		<td>${ n.noticeDate }</td>
            		<c:choose>
            		<c:when test="${ empty n.modifyDate }">
            		<td>-</td>
            		</c:when>
            		<c:when test="${ not empty n.modifyDate}">
            		<td>${ n.modifyDate }</td>
            		</c:when>
            		</c:choose>
            	</tr>
            </c:forEach>
            </tbody>
            
        </table>
    </div>

			<!-- pagination -->
	         <div class="row mt-5">
                 <div class="col text-center">
                   <div class="block-27">
                     <ul>
                     <c:if test="${ pi.currentPage <=1 }">
                     	<li><a id="paging">&lt;</a></li>
                     </c:if>
                     <c:if test="${ pi.currentPage >1 }">
                     	<c:url var="before" value="${ loc }">
                     		<c:param name="page" value="${ pi.currentPage -1 }"/>
                     	</c:url>
                       <li><a href="${ before }" id="paging">&lt;</a></li>
                     </c:if>
                     
                     <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                     	<c:if test="${ p eq pi.currentPage }">
                     		<li><a class="active" id="paging" style="color : #fff;">${ p }</a></li>
                     	</c:if>
                     	
                     	<c:if test="${ p ne pi.currentPage }">
                     		<c:url var="pagination" value="${ loc }">
                     			<c:param name="page" value="${ p }"></c:param>
                     		</c:url>
                     		<li><a href="${ pagination }">${ p }</a></li>
                     	</c:if>
                     </c:forEach>
                     
                     <c:if test="${ pi.currentPage >= pi.maxPage }">
                     	<li><a id="paging">&gt;</a></li>
                     </c:if>
                     <c:if test="${ pi.currentPage < pi.maxPage }">
                     	<c:url var="after" value="${ loc }">
                     		<c:param name="page" value="${ pi.currentPage + 1 }"></c:param>
                     	</c:url>
                     	<li><a href="${ after }" id="paging">&gt;</a></li>
					</c:if>
                     </ul>
                   </div>
                 </div>
               </div>
</div>
<script>
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
</script>
<!-- footer -->
<script>
	$(".bg-blue").find("td").on('click', function(){
		var nId = $(this).parent().children('td').eq(0).text();
		location.href = 'ndetail.no?nId=' + nId + "&page=" + ${pi.currentPage};
		});
</script>
	<c:import url="../common/footer.jsp"/>
  </body>
</html>
