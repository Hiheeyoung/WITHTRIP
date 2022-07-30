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
		
		/* 글 삭제 모달 START */
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
		/* 글 삭제 모달 END */
		/* 글 삭제 버튼(모달아님 리스트에 있는 버튼) */
		#deleteBtn{
		background-color: lightgrey; border: none; color:white; border-radius: 5px;}
</style>
</head>
<body id="page-top">
  
  
<!-- 네비바-->
<c:import url="../common/navbar.jsp"/>
 
 
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav" style="position:absolute;">
	<a class="navbar-brand js-scroll-trigger"  href="#page-top">
		<span class="d-block d-lg-none" >With Trip</span>
		
			<span class="d-none d-lg-block" >
				<c:if test="${loginUser.changeName == null}">
					<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/images4/logo_whiteBackground.png" alt="기본 프로필 사진">
				</c:if>
				<c:if test="${loginUser.changeName != null}">
					<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/profileUploadFiles/${loginUser.changeName}" alt="프로필 사진">
				</c:if>
			</span>
	</a>
	
	<div class="collapse navbar-collapse"  id="navbarSupportedContent">
		<ul class="navbar-nav">
		
			<li>
				<a id="nickName">${loginUser.nickName}</a>
			</li>
			
			<li class="nav-item">
				<a class="nav-link js-scroll-trigger" onclick="location.href='updateMyInfo.me';">계정 관리</a>
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
				<a class="nav-link js-scroll-trigger" onclick="location.href='myPost.me';" style="color: white;">작성한 동행 글</a>
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
   	<input type="checkbox" checked="checked" id="pageTitle"><label class="pageLabel">모집한 동행</label>
	   	<div class="tableline">
	    	<div class="table-responsive">
				<table class="table">
		            <thead class="thead">
		                <tr>
		                	<th scope="col">글 번호</th>
		                    <th scope="col">글 제목</th>                    
		                    <th scope="col">작성일</th>                                      
		                    <th scope="col">최종 수정일</th>                                      
		                    <th scope="col">삭제</th>                                      
		                </tr>
		            </thead>
		            <c:if test="${ empty list }">
		            	<tbody>
		                   <tr>
		                     <td colspan="5" style="align-items: center;">모집한 동행 글이 없습니다.</td>
		                   </tr>
		               </tbody>
		            </c:if>
		            <c:if test="${ !empty list }">
			            <c:forEach var="tb" items="${ list }">
				            <tbody>
				                <tr class="bg-blue">
					                <td>${ tb.tripId }
						      			<input type="hidden" id="bId" value="${ tb.tripId }">
						      			<input type="hidden" id="changeName" value="${ tb.renameFileName }">
						      		</td>
						      		<td id="bTitle">
				      					<a href="javascript:userPage()" style="color: black;">${ tb.boardTitle }</a>
						      		</td>
						      		<td>${ tb.createDate }</td>        
						      		<td>${ tb.modifyDate }</td>        
						      		<td><button type="button" value="${ tb.tripId }" id="deleteBtn" class="deleteBtn">삭제</button></td>        
				                </tr>
				            </tbody>
			            </c:forEach>
		            </c:if>
				</table>
	        </div>
	    </div>
	</div>
 </div>
 
 
<!-- 동행 글 삭제 모달 START -->
    <div class="deleteModal">
	    <div  class="deleteModal_body">
			<div><hr class="modal_line"></div>
            	<div class="modal_content">해당 글을 삭제하시겠습니까?</div>
            <div><hr class="modal_line"></div>
            <div class="modal_button">
                <button  type="button" class="yBtn" onclick="clickDel()">삭제하기</button>
            </div>
       	</div>
	</div>
<!-- 동행 글 삭제 모달 END -->
 
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
                     	<c:url var="before" value="myPost.me">
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
                       		<c:url var="pagination" value="myPost.me">
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
                       		<c:url var="after" value="myPost.me">
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
	 
    const bodyTag = document.querySelector('body');
    const deleteModal = document.querySelector('.deleteModal');
    const deleteBtn = document.querySelector('#deleteBtn');	 

	// 동행 글 삭제 버튼 클릭 시 모달 띄우기
    $(".deleteBtn").on("click", (e) => {
        bId = e.target.value;
//         console.log(bId);
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
	 
	 // 내가 쓴 동행 글 삭제
	 function clickDel(){
		 console.log(bId);
			location.href="myTdelete.to?bId="+bId;
	 }
	 
	 // 글 리스트 누르면 해당 글 상세보기
	 $('.bg-blue').find("td").mouseenter(function(){
		 bId = $(this).parents().children('td').eq(0).text();	// bId를 전역변수로 선언
	 });
    function userPage(){
    	var form = document.createElement("form");
    	var obj;
    	obj = document.createElement("input");
    	obj.setAttribute("type", "hidden");
    	obj.setAttribute("name", "bId");
    	obj.setAttribute("value", bId);
    	
    	form.appendChild(obj);
    	form.setAttribute("method", "post");
    	form.setAttribute("action", "tdetail.to?bId=" + bId);
    	document.body.appendChild(form);
    	form.submit();
    }
</script>
</body>
</html>