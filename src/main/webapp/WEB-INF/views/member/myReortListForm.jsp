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

  <body id="page-top">
  
  
  <!-- 네비바-->
  <c:import url="../common/navbar.jsp"/>
 
 
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav" style="position:absolute;">
      <a class="navbar-brand js-scroll-trigger"  href="#page-top">
        <span class="d-block d-lg-none" >With Trip</span>
        <span class="d-none d-lg-block" >
          <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="resources/image2/profil.png" alt="">
        </span>
      </a>
      <div class="collapse navbar-collapse"  id="navbarSupportedContent">
        <ul class="navbar-nav">
        <li>
        	<a id="nickName">닉네임</a>
        </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger"  onclick="location.href='updateMyInfo.me';">계정 관리</a>
          </li>
                    <li class="nav-item">
            <a class="nav-link js-scroll-trigger" onclick="location.href='myReview.me';">내가 쓴 후기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" onclick="location.href='myReply.me';">내가 쓴 댓글</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" onclick="location.href='myPost.me';" >내가 쓴 글</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" onclick="location.href='travelReview.me';">동행자 후기</a>
          </li>          
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" onclick="location.href='reportTo.me';">신고</a>
          </li>
          
          
          
         
<li class="nav-item">
            <button  class="rbtn" id="modalshow" >회원 신고</button>
              <div class="modalBg">
                           <div class="modalwindow">
                             <div class="modalpopup">
    <form>
		<div class="report-page" ng-controller="FindIdCtrl as findIdCtrl">
		    <div class="report-header">신고하기</div>
		    <div class="report-content">
		        <div class="report-div">해당 사용자의 &nbsp;<span style="font-weight: bold;">신고사유</span>를 선택하세요.</div>
		        <div class="selectButton">
			        <select id="selectOp">
			        	<option value="option1">기타</option>
			        	<option value="option2">욕설</option>
			        	<option value="option3">광고/홍보</option>
			        	<option value="option4">도배</option>
			        </select>
		        </div>
		    </div>
				<div class="reason" style="display:hidden;">
					<textarea rows="4" cols="52px" class="why" placeholder="사유를 입력해주세요"></textarea>
				</div>
		    <div class="report-button">
		    <button type="submit" id="report-button">확인</button>
		    <button id="modalclose">취소</button>
		    </div>
		</div>
	</form>
	
            	</div>
               </div>
            </div>
          </li>
        </ul>
      </div>
    </nav>
 	 <div class="container rounded mt-5 bg-white p-md-5">
    <div class="main">
	<!-- 페이지 타이틀 -->
   	<input type="checkbox"  checked="checked"><label class="pageLabel">신고</label>
    <!-- card -->
    <div class="rfCardDiv">
    <div class="container">
    <div class="row">
        <div class="col">
            <div class="row " style="padding: 10px;">
                <div class="col-xl-12">
                    <div class="reprotCard">
                            <div class="card-body">
                                <div class="row" id="blockitems">
                                    <div class="reportCol">
                                        <p class="reasonTitle">신고사유</p>
                                        <span>회원님께서 &nbsp; <span class="reportReason">도배</span>로 신고접수되었습니다.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
            </div>
        </div>
            <div class="container">
    <div class="row">
        <div class="col">
            <div class="row " style="padding: 10px;">
                <div class="col-xl-12">
                    <div class="reprotCard">
                            <div class="card-body">
                                <div class="row" id="blockitems">
                                    <div class="reportCol">
                                        <p class="reasonTitle">신고사유</p>
                                        <span>회원님께서 &nbsp; <span class="reportReason">욕설</span>로 신고접수되었습니다.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
            </div>
        </div>
                    <div class="container">
    <div class="row">
        <div class="col">
            <div class="row " style="padding: 10px;">
                <div class="col-xl-12">
                    <div class="reprotCard">
                            <div class="card-body">
                                <div class="row" id="blockitems">
                                    <div class="reportCol">
                                        <p class="reasonTitle">신고사유</p>
                                        	<span>회원님께서 &nbsp; <span class="reportReason">광고/홍보</span>로 신고접수되었습니다.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
            </div>
        </div>
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
		})
    </script>
</body>
</html>