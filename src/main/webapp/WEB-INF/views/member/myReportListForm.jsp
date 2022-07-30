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
		
		.warning{ font-weight: bold; position:relative; left: 270px;}
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
			    	<img id="profile2" class="img-fluid img-profile rounded-circle mb-2 mx-auto" src="${ contextPath }/resources/images4/logo_whiteBackground.png" alt="프로필 사진">
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
				  <a class="nav-link js-scroll-trigger" onclick="location.href='reportTo.me';" style="color: white;">접수된 신고</a>
				</li>
			</c:if>
<%-- 		</c:if>	 --%>
		
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
   	<input type="checkbox"  checked="checked"><label class="pageLabel">접수된 신고</label>
    
    <h6 class="warning">
    	<svg style="color: orangered;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
		  <path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/>
		  <path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
		</svg>
    	접수된 신고가 3건 이상일 경우 사이트 이용 정지 조치가 취해지므로 주의 바랍니다.
    </h6>
    <br><br>
    
	    <!-- card -->
	    <div class="rfCardDiv">
		    <c:forEach var="rList" items="${ list }">
		    <div class="container">
			    <div class="row">
			        <div class="col">
			            <div class="row " style="padding: 10px;">
			                <div class="col-xl-12">
			                    <div class="reprotCard">
			                       <div class="card-body">
			                           <div class="row" id="blockitems">
			                               <div class="reportCol">
			                                   <p class="reasonTitle">신고 사유</p>
			                                   <span>${ rList.report_date } &nbsp; 회원님께서 &nbsp; 
			                                   <span class="reportReason">
			                                   		<c:choose > 
			                                   		<c:when test="${ rList.rcate_no eq '1'}">기타 ( 관리자 문의 )</c:when>
			                                   		<c:when test="${ rList.rcate_no eq '2'}">욕설</c:when>
			                                   		<c:when test="${ rList.rcate_no eq '3'}">광고/홍보</c:when>
			                                   		<c:when test="${ rList.rcate_no eq '4'}">도배</c:when>
			                                   		</c:choose>
			                                   </span>로 신고 접수되었습니다.
			                                   </span>
			                               </div>
			                           </div>
			                       </div>
								</div>
			                </div>
			            </div>
			        </div>
				</div>
			</div>
		    </c:forEach>    
		</div>
	</div>
</div>

<br>
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
</script>
</body>
</html>