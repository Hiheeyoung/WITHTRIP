<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>WITHTRIP :: 함께라서 좋은 여행</title>

	<script src="resources/js2/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link href="resources/vendor2/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <link href="resources/vendor2/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="resources/css2/resume.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<style>
       
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
</head>
  <body id="page-top">
  
  
  <!-- 네비바-->
  <c:import url="../common/navbar.jsp"/>
 
 
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav" style="position:absolute;">
      <a class="navbar-brand js-scroll-trigger"  href="#page-top">
        <span class="d-block d-lg-none" >With Trip</span>
        
<%--         <c:if test="${ mNo != loginUser.member_no }"> --%>
<!-- 	        <span class="d-none d-lg-block" > -->
<%-- 	        	<c:if test="${loginUser.changeName == null}"> --%>
<%-- 			    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/images4/logo_whiteBackground.png" alt="기본 프로필 사진"> --%>
<%-- <%-- 			    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/image2/profil.png" alt="프로필 사진"> --%> 
<%-- 				</c:if> --%>
<%-- 				<c:if test="${loginUser.changeName != null}"> --%>
<%-- 			    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/profileUploadFiles/${loginUser.changeName}" alt="프로필 사진"> --%>
<%-- 			  	</c:if> --%>
<!-- 	        </span> -->
<%-- 		</c:if> --%>
		
<%-- 		<c:if test="${ mNo == loginUser.member_no }"> --%>
	        <span class="d-none d-lg-block" >
	        	<c:if test="${loginUser.changeName == null}">
			    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/images4/logo_whiteBackground.png" alt="기본 프로필 사진">
<%-- 			    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/image2/profil.png" alt="프로필 사진"> --%>
				</c:if>
				<c:if test="${loginUser.changeName != null}">
			    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/profileUploadFiles/${loginUser.changeName}" alt="프로필 사진">
			  	</c:if>
	        </span>
<%-- 		</c:if> --%>
      </a>
      <div class="collapse navbar-collapse"  id="navbarSupportedContent">
        <ul class="navbar-nav">
        
	        <li>
	        	<a id="nickName">${loginUser.nickName}</a>
	        </li>
			<li class="nav-item">
			  <a class="nav-link js-scroll-trigger"   onclick="location.href='updateMyInfo.me';">계정 관리</a>
			</li>
			<li class="nav-item">
			  <a class="nav-link js-scroll-trigger" onclick="location.href='myOrder.me';">주문 내역</a>
			</li>
			<li class="nav-item">
			  <a class="nav-link js-scroll-trigger" onclick="location.href='myReview.me';" style="color: white;">작성한 동행 후기</a>
			</li>
			<li class="nav-item">
			  <a class="nav-link js-scroll-trigger" onclick="location.href='myReply.me';">작성한 용품 후기</a>
			</li>
			<li class="nav-item">
			  <a class="nav-link js-scroll-trigger" onclick="location.href='myPost.me';" >작성한 동행 글</a>
			</li>
			<c:if test="${ loginUser.reportCount > 0 }">
				<li class="nav-item">
				  <a class="nav-link js-scroll-trigger" onclick="location.href='reportTo.me';" style="color: DarkOrange;">접수된 신고</a>
				</li>
			</c:if>
		
		<li class="nav-item">
		  <a class="nav-link js-scroll-trigger" onclick="location.href='travelReview.me';">동행자 후기</a>
		</li>          

        </ul>
      </div>
    </nav>
    
<div class="imgModal">
    <div class="imgModalBox">
    </div>
</div>
    
<div class="container rounded mt-5 bg-white p-md-5">
    <div class="main">
	<!-- 페이지 타이틀 -->
   	<input type="checkbox" checked="checked" id="pageTitle"><label class="pageLabel">작성한 동행 후기</label>
   	<div class="tableline">
    <div class="table-responsive">
        <table class="table">
            <thead class="thead">
                <tr>
                	<th scope="col">후기 번호</th>
                    <th scope="col">후기 내용</th>                    
                    <th scope="col">후기 대상 회원</th>                    
                    <th scope="col">작성일</th>                                      
                </tr>
            </thead>
            <c:if test="${ empty list }">
            	<tbody>
                   <tr>
                     <td colspan="5" style="align-items: center;">작성한 동행 후기가 없습니다.</td>
                   </tr>
               </tbody>
            </c:if>
            <c:if test="${ !empty list }">
	            <c:forEach var="rv" items="${ list }" varStatus="status">
		            <tbody>
		                <tr class="bg-blue">
	<%-- 	                	<td>${ rv.review_id }</td>     --%>
							<td id="td"><input type="hidden" name="mNo" id="mNo" value="${ rv.member_no }">
								<c:if test="${ pi.endPage ne 1 }">
									<c:if test="${ pi.currentPage eq pi.startPage }">
										${ pi.listCount - status.index }
									</c:if>
									<c:if test="${ pi.currentPage ne pi.startPage and pi.currentPage ne pi.endPage }">
										${ pi.listCount - pi.boardLimit * (pi.currentPage - 1) - status.index }
									</c:if>
									<c:if test="${ pi.currentPage eq pi.endPage }">
										${ pi.listCount % pi.boardLimit - status.index }
									</c:if>
								</c:if>
								<c:if test="${ pi.endPage eq 1 }">
									${ pi.listCount - status.index }
								</c:if>
							</td>
			      			<td>${ rv.review_content }</td>
			      			<td>
			      				<a href="javascript:userPage()" style="color: black;">${ rv.review_nickname }</a>
			      			</td>
			      			<td>${ rv.review_date }</td>   
		                </tr>
		            </tbody>
	            </c:forEach>
            </c:if>
        </table>
        </div>
    </div>
	</div>
    </div>
               <!-- main템플릿 페이지네이션 -->
 				<div class="pagination">
                 <div class="col text-center">
                   <div class="block-27">
                     <ul>
                     <!-- 이전 -->
                     <c:if test="${ pi.currentPage <= 1 }">
                       <li>
                       		<a style="cursor: default;" id="paging">&lt;</a>
                       </li>
                     </c:if>
                     <c:if test="${ pi.currentPage > 1 }">
                     	<c:url var="before" value="myReview.me">
                     		<c:param name="page" value="${ pi.currentPage - 1 }"/>
                     	</c:url>
                       <li>
                       		<a href="${ before }" id="paging">&lt;</a>
                       </li>
                     </c:if>
                     
                     <!-- 페이징 -->
                     <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                       <c:if test="${ p eq pi.currentPage }">
                       		<font><li class="active"><a id="paging">${ p }</a></li></font>
                       </c:if>
                       
                       <c:if test="${ p ne pi.currentPage }">
                       		<c:url var="pagination" value="myReview.me">
                       			<c:param name="page" value="${ p }"/>
                       		</c:url>
                       		<li><a href="${ pagination }" id="paging">${ p }</a></li>
                       </c:if>
                     </c:forEach>
                       
                       <!-- 다음 -->
                       <c:if test="${pi.currentPage >= pi.maxPage }">
                       		<li>
                       			<a style="cursor: default;" id="paging">&gt;</a>
                       		</li>
                       </c:if>
                       <c:if test="${ pi.currentPage < pi.maxPage }">
                       		<c:url var="after" value="myReview.me">
                       			<c:param name="page" value="${pi.currentPage + 1 }"/>
                       		</c:url>
                       		<li>
                       			<a href="${ after }" id="paging">&gt;</a>
                       		</li>
                       </c:if>
                       
                     </ul>
                   </div>
                 </div>
               </div>
<br><br><br><br>
                    
<br clear="all">

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
  	});
  		
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
  	
    // 프로필 사진 클릭 시 사진 모달 띄우기
    $(function(){
	    $("img").click(function(){
	        var img = new Image();
	        img.src = $(this).attr("src")
	        $('.imgModalBox').html(img);
	        $(".imgModal").show();
	    });
		// 모달 클릭할때 이미지 닫음
    	$(".imgModal").click(function (e) {
    		$(".imgModal").toggle();
  		});
	});
    
    $('.bg-blue').find('td').mouseenter(function(){
    	nickname = $(this).parents().children('td').eq(2).text();
    	mNo = $(this).parents().children('td').find('input[name="mNo"]').val();
    	console.log('mNo : ' + mNo);
    	console.log("nickname : " + nickname.trim());
    });
    
    function userPage(){
    	var form = document.createElement("form");
    	
    	var obj;
    	obj = document.createElement("input");
    	obj.setAttribute("type", "hidden");
    	obj.setAttribute("name", "nickname");
    	obj.setAttribute("value", nickname.trim());
    	
    	obj.setAttribute("type", "hidden");
    	obj.setAttribute("name", "mNo");
    	obj.setAttribute("value", mNo);
    	
    	form.appendChild(obj);
    	form.setAttribute("method", "post");
    	form.setAttribute("action", "travelReview.me");
    	document.body.appendChild(form);
    	form.submit();
    }
</script>
</body>
</html>
