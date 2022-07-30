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
        
        <c:if test="${ mNo != loginUser.member_no }">
	        <span class="d-none d-lg-block" >
	        	<c:if test="${m.changeName == null}">
			    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/images4/logo_whiteBackground.png" alt="기본 프로필 사진">
<%-- 			    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/image2/profil.png" alt="프로필 사진"> --%>
				</c:if>
				<c:if test="${m.changeName != null}">
			    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/profileUploadFiles/${m.changeName}" alt="프로필 사진">
			  	</c:if>
	        </span>
		</c:if>
		
		<c:if test="${ mNo == loginUser.member_no }">
	        <span class="d-none d-lg-block" >
	        	<c:if test="${loginUser.changeName == null}">
			    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/images4/logo_whiteBackground.png" alt="기본 프로필 사진">
<%-- 			    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/image2/profil.png" alt="프로필 사진"> --%>
				</c:if>
				<c:if test="${loginUser.changeName != null}">
			    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/profileUploadFiles/${loginUser.changeName}" alt="프로필 사진">
			  	</c:if>
	        </span>
		</c:if>
      </a>
      
      <div class="collapse navbar-collapse"  id="navbarSupportedContent">
        <ul class="navbar-nav">
        
        <c:if test="${ mNo != loginUser.member_no }">
	        <li>
	        	<a id="nickName">${ m.nickName }</a>
	        </li>
        </c:if>
        <c:if test="${ mNo == loginUser.member_no }">
			<li>
				<a id="nickName">${loginUser.nickName}</a>
			</li>
			<li class="nav-item">
			  <a class="nav-link js-scroll-trigger"  onclick="location.href='updateMyInfo.me';">계정 관리</a>
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
			  <a class="nav-link js-scroll-trigger" onclick="location.href='myPost.me';" >작성한 동행 글</a>
			</li>
			<c:if test="${ loginUser.reportCount > 0 }">
				<li class="nav-item">
				  <a class="nav-link js-scroll-trigger" onclick="location.href='reportTo.me';" style="color: DarkOrange;">접수된 신고</a>
				</li>
			</c:if>
        </c:if>
        
        <c:if test="${ mNo == loginUser.member_no }">
			<li class="nav-item">
			<form method="post" action="travelReview.me">
			  <a class="nav-link js-scroll-trigger" style="color: white;">동행자 후기</a>
			</form>
			</li>          
        </c:if> 
        <c:if test="${ mNo != loginUser.member_no }">
			<li class="nav-item">
			  <a class="nav-link js-scroll-trigger" onclick="location.href='travelReview.me?' + 'mNo=' + ${ mNo }" style="color: white;">동행자 후기</a>
			</li>          
        </c:if>
        <c:if test="${ mNo != loginUser.member_no }"> 
		<li class="nav-item">
            <button  class="rbtn" id="modalshow" >회원 신고</button>
              <div class="modalBg">
                 <div class="modalwindow">
                   <div class="modalpopup">
				    <form action="insertReport.me" method="post">
						<div class="report-page" ng-controller="FindIdCtrl as findIdCtrl">
						    <div class="report-header">신고하기</div>
						    <div class="report-content">
						        <div class="report-div">해당 사용자의 &nbsp;<span style="font-weight: bold;">신고사유</span>를 선택하세요.</div>
						        <div class="selectButton">
							        <select id="selectOp" name="reportOption">
							        	<option value="1">기타</option>
							        	<option value="2">욕설</option>
							        	<option value="3">광고/홍보</option>
							        	<option value="4">도배</option>
							        </select>
						        </div>
						    </div>
								<div class="reason">
									<textarea rows="4" id="reportReason" name="reportReason" cols="52px" class="why" placeholder="사유를 입력해주세요"></textarea>
									<input type="hidden" name="reported" value="${ m.email }">
									<input type="hidden" name="mNo" value="${ mNo }">
								</div>
						    <div class="report-button">
						    <button type="submit" id="report-button" onclick="return reportSubmit();">확인</button>
						    <button type="button" id="modalclose" onclick="modalClose(${ mNo })">취소</button>
						    </div>
						</div>
					</form>
            	</div>
               </div>
            </div>
         </li>
         </c:if>
       </ul>
      </div>
    </nav>
    
<div class="imgModal">
    <div class="imgModalBox">
    </div>
</div>
    
<div class="container rounded mt-5 bg-white p-md-5">
    <div class="main">
   	<input type="checkbox" checked="checked"><label class="pageLabel">동행자 후기</label>
   	
   	<c:if test="${ mNo != loginUser.member_no }">
		<button class="reviewPost" id="modalshow2">후기 작성</button>
		<!-- 후기 모달 START -->
			<div class="modalBg2">
				<div class="modalwindow2">
					<div class="modalpopup2">
						<form action="insertReview.me">
<!-- 						<form action="insertReview.me" method="post" id="formId"> -->
							<div class="rivewRow">
								<h4 style="color: #6495ED; font-weight: bold; margin-left: 10px;">withtrip</h4>
							<br>
								<div class="rivewContent">
									<h4>${ m.nickName }님과의 여행 후기</h4>
									<input type="hidden" id="mNo" name="mNo" value="${ mNo }">
									<input type="hidden" id="email" name="email" value="${ m.email }">
									<input type="hidden" id="review_nickname" name="review_nickname" value="${ nickName }">
									<hr  style="background-color: white;">
		                              <textarea class="rivewForm" id="reviewContent" name="reviewContent" placeholder="동행과의 후기를 작성해주세요" rows="4"></textarea>
			                          <div class="ReBtns">
				                          <button type="submit" id="reviewSubmit" class="reviewSend">등록 하기</button>
				                          <button type="button" id="modalclose2" onclick="modalClose(${ mNo })">취소</button>
			                         </div>
                        		</div>
                     		</div>
						</form>
					</div>
				</div>
			</div>
		<!-- 후기 모달 END -->
	</c:if>	
			
	<div class="tableline">
		<div class="table-responsive">
	        <table class="table">
	            <thead>
	                <tr>
	                	<th scope="col">후기 번호</th>
	                    <th scope="col">내용</th>                    
	                    <th scope="col">작성일</th>                                      
	                </tr>
	            </thead>
	            <c:if test="${ empty list }">
	            	<tbody>
	                   <tr>
	                     <td colspan="5" style="align-items: center;">작성된 동행자들의 후기가 없습니다 !</td>
	                   </tr>
	               </tbody>
	            </c:if>
	            <c:if test="${ !empty list }">
		            <c:forEach var="rv" items="${ list }" varStatus="status">
			            <tbody>
			                <tr class="bg-blue">
			                <td>
								<c:if test="${ pi.endPage ne 1 }">
									<c:if test="${ pi.currentPage eq pi.startPage }">
										${ pi.listCount - status.index }
									</c:if>
									<c:if test="${ pi.currentPage ne pi.startPage and pi.currentPage ne pi.endPage }">
										${ pi.listCount - pi.boardLimit * (pi.currentPage - 1) - status.index }
									</c:if>
									<c:if test="${ pi.currentPage eq pi.endPage }">
										<c:if test="${ pi.listCount % pi.boardLimit ne 0 }">
											${ pi.listCount % pi.boardLimit - status.index }
										</c:if>
										<c:if test="${ pi.listCount % pi.boardLimit eq 0 }">
											${ pi.listCount - pi.boardLimit * (pi.currentPage - 1) - status.index }
										</c:if>
									</c:if>
								</c:if>
								<c:if test="${ pi.endPage eq 1 }">
									${ pi.listCount - status.index }
								</c:if>
							</td>
					      		<td>${ rv.review_content }</td>
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

<!-- 로그인 회원이 페이지 주인일 경우 -->
<c:if test="${ loginUser.member_no == mNo }">
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
			<c:url var="before" value="travelReview.me">
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
				<c:url var="pagination" value="travelReview.me">
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
			<c:url var="after" value="travelReview.me">
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
</c:if>

<!-- 로그인 회원이 타인의 페이지에 놀러온 경우 -->
<c:if test="${ loginUser.member_no != mNo }">
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
			<c:url var="before" value="travelReview.me">
				<c:param name="page" value="${ pi.currentPage - 1 }"/>
				<c:param name="mNo" value="${ mNo }"/>
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
				<c:url var="pagination" value="travelReview.me">
					<c:param name="page" value="${ p }"/>
					<c:param name="mNo" value="${ mNo }"/>
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
			<c:url var="after" value="travelReview.me">
				<c:param name="page" value="${ pi.currentPage + 1 }"/>
				<c:param name="mNo" value="${ mNo }"/>
			</c:url>
			<li>
				<a href="${ after }" id="paging">&gt;</a>
			</li>
		</c:if>
      </ul>
    </div>
  </div>
</div>
</c:if>


<br><br><br><br>
                    
<br clear="all">

<c:import url="../common/footer.jsp"/>
       
       <script>
       $("#modalshow2").click(function() {
     	  $('.modalBg2').css({"visibility" : "visible"});
     });
       </script>
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
    
    
      // 신고, 후기 등록 버튼 클릭 시 상세 내용 안쓰면 안넘어가게하고 focus주기
  	$(document).ready(function() {
			$('#report-button').on("click", function(){
				if($('#reportReason').val() == ''){
					alert('사유를 입력해주세요');
					$('#reportReason').focus();
					return false;
				}
			});
			
			$('#reviewSubmit').on('click', function(){
				if($('#reviewContent').val() == ''){
					alert('후기를 작성해주세요');
					$('#reviewContent').focus();
					return false;
				} 
// 				else {
// 					var form = document.createElement('form');
			    	
// 			    	var obj;
// 			    	obj = document.createElement('input');
// 			    	obj.setAttribute('type', 'hidden');
// 			    	obj.setAttribute('name', 'reviewContent');
// 			    	obj.setAttribute('value', $('#reviewContent').val());
			    	
// 			    	var obj2;
// 			    	obj2 = document.createElement('input');
// 			    	obj2.setAttribute('type', 'hidden');
// 			    	obj2.setAttribute('name', 'mNo');
// 			    	obj2.setAttribute('value', $('#mNo').val());
			    	
// 			    	var obj3;
// 			    	obj3 = document.createElement('input');
// 			    	obj3.setAttribute('type', 'hidden');
// 			    	obj3.setAttribute('name', 'email');
// 			    	obj3.setAttribute('value', $('#email').val());
			    	
// 			    	var obj4;
// 			    	obj4 = document.createElement('input');
// 			    	obj4.setAttribute('type', 'hidden');
// 			    	obj4.setAttribute('name', 'review_nickname');
// 			    	obj4.setAttribute('value', $('#review_nickname').val());
			    	
// 			    	form.appendChild(obj);
// 			    	form.appendChild(obj2);
// 			    	form.appendChild(obj3);
// 			    	form.appendChild(obj4);
// 			    	form.setAttribute('method', 'post');
// 			    	form.setAttribute('action', 'insertReview.me');
// 			    	document.body.appendChild(form);
// 			    	form.submit();
// 				} 
				
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
    
//     function reviewSubmit(){
//     	var form = document.createElement('form');
    	
//     	var obj;
//     	obj = document.createElement('input');
//     	obj.setAttribute('type', 'hidden');
//     	obj.setAttribute('name', 'reviewContent');
//     	obj.setAttribute('value', $('#reviewContent').val());
    	
//     	obj.setAttribute('type', 'hidden');
//     	obj.setAttribute('name', 'mNo');
//     	obj.setAttribute('value', $('#mNo').val());
    	
//     	obj.setAttribute('type', 'hidden');
//     	obj.setAttribute('name', 'email');
//     	obj.setAttribute('value', $('#email').val());
    	
//     	obj.setAttribute('type', 'hidden');
//     	obj.setAttribute('name', 'review_nickname');
//     	obj.setAttribute('value', $('#review_nickname').val());
    	
//     	form.appendChild(obj);
//     	form.setAttribute('method', 'post');
//     	form.setAttribute('action', 'insertReview.me');
//     	document.body.appendChild(form);
//     	form.submit();
    	
//     }
    
    
    function modalClose(mNo){
    	var form = document.createElement('form');
    	
    	var obj;
    	obj = document.createElement('input');
    	obj.setAttribute('type', 'hidden');
    	obj.setAttribute('name', 'mNo');
    	obj.setAttribute('value', mNo);
    	
    	form.appendChild(obj);
    	form.setAttribute('method', 'post');
    	form.setAttribute('action', 'travelReview.me');
    	document.body.appendChild(form);
    	form.submit();
    }
</script>
</body>
</html>
