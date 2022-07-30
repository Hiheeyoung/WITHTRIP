<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>WITHTRIP :: 함께라서 좋은 여행</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Raleway&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css"> 
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"> 
	<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"> 
	

    <link rel="stylesheet" href="resources/css6/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="resources/css6/animate.css">
    
    <link rel="stylesheet" href="resources/css6/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/css6/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/css6/magnific-popup.css">

    <link rel="stylesheet" href="resources/css6/aos.css">

    <link rel="stylesheet" href="resources/css6/ionicons.min.css">

    <link rel="stylesheet" href="resources/css6/bootstrap-datepicker.css">
    <link rel="stylesheet" href="resources/css6/jquery.timepicker.css">
    <link rel="stylesheet" href="resources/css6/flaticon.css">
    <link rel="stylesheet" href="resources/css6/icomoon.css">
   	
   	<!-- user css -->
    <link rel="stylesheet" href="resources/css6/style.css">
    
    <!-- 아이콘 fontawesome -->
    <script src="https://kit.fontawesome.com/dd62c289ec.js" crossorigin="anonymous"></script>
</head>

  <body class="goto-here"> 
   
   <!-- header -->
   <c:import url="../common/navbar.jsp"/>
   
    <div class="hero-wrap hero-bread" style="background-image: url(https://imgur.com/xryJjh2.jpg)";>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate ">
             <p class="breadcrumbs"><span class="mr-2">
             <span>Travel Goods</span></p>
            <h1 class="mb-0 bread">여행 용품</h1>
          </div>
        </div>
      </div>
    </div>

   <!-- 카테고리 --> 
   <form action="gupView.go" method="post">   
         <div class="container">
               <div class="category-group">
                  <div class="goods-category-pointer">
                     <div class="goods-category" id="bag"></div>
                     <b>가방</b>
                  </div>
                  <div class="goods-category-pointer">
                     <div class="goods-category" id="safety"></div>
                     <b>안전 용품</b>
                  </div>
                  <div class="goods-category-pointer">
                     <div class="goods-category" id="etc"></div>
                     <b>악세사리</b>
                  </div>
               </div>
            </div>
         <c:if test="${ !empty sessionScope.loginUser && loginUser.managerYN == 'Y' }">
            <div style="margin-left: 70%;"><!-- style="margin-left: 70%;" -->
         
             <c:url var="gdelete" value="gdelete.go">
                  <c:param name="gId" value="${ g.goodsId }" />
                  <c:forEach var="f" items="${ fList }"> 
                     <c:param name="changeName" value="${ f.changeName }" />
                    </c:forEach>
               </c:url>
               <button class="modify_btn">수정하기</button>
               <button id="deleteBtn" type="button" class="modify_btn" onclick="Gdelete()">삭제하기</button>
            </div>
         </c:if>
            
        
         <!-- 메인 상품 --> 
              <input type="hidden" name="goodsId" value="${ g.goodsId }">
              <input type="hidden" name="goodsName" value="${ g.goodsName }">
              <input type="hidden" name="price" value="${ g.price }">
              <input type="hidden" name="stock" value="${ g.stock }">
              <input type="hidden" name="gcateNo" value="${ g.gcateNo }">
              <input type="hidden" name="gContent" value="${ g.gContent }">
              <input type="hidden" name="goodsSize" value="${ g.goodsSize }">
              <input type="hidden" name="goodsColor" value="${ g.goodsColor }">
              <input type="hidden" name="goodsBrand" value="${ g.goodsBrand }">
              <input type="hidden" name="page" value="${ page }">
             
             
             <section class="ftco-section">
                <div class="container">
                   <div class="row">
                      <div class="col-lg-6 mb-5 ftco-animate">
                         
                        <!-- updateForm에 기존에 업로드한 사진이 남아있게 하기 위해 기존 파일의 원본, 바뀐 이름을 컨트롤러에 넘기기 -->
                        <c:forEach var="f" items="${ fList }">
                            <input type="hidden" name="changeName" value="${ f.changeName }">
                            <input type="hidden" name="originName" value="${ f.originName }">
                         </c:forEach>    
                         
                      <c:if test="${ !empty fList[0] }">
                            <img src="${ contextPath }/resources/guploadFiles/${ fList[0].changeName }" class="img-fluid" alt="Colorlib Template">                  
                      </c:if>    
                      </div>
                      
                      <div class="col-lg-6 product-details pl-md-5 ftco-animate">
                            <div class="rating d-flex">
                               <p class="brand"><span style="font-weight: bold; font-size: 15px;">${ g.goodsBrand }</span></p>
                            </div>
                            <h4>${ g.goodsName }</h4>
                            
                            
                            <div class="rating d-flex">
                               <p class="price" style="font-size: 25px; color: black;">￦<span id="goodsPrice" style="font-size: 25px;">${ g.price }</span></p>
                            </div>
                            
                            <p>
                               <% pageContext.setAttribute("newLineChar", "\r\n"); %>
                               ${ fn:replace(g.gContent, newLineChar, "<br>") }
                            </p>
                              <div class="row mt-4">
                                 <div class="col-md-6" style="display: flex;">
                                       <div class="form-group d-flex">
                                         <div class="select-wrap">
                                         
                                            <!-- 사이즈 -->
                                            <div>
                                               <label style="padding-right: 5px;"><strong>SIZE</strong></label>
                                               <span id="goodsSize">${ g.goodsSize }</span>
                                            </div>
                                         </div>
                                       </div>
                                    </div>
                                   
                                   <!-- 색상 -->
                                    <div class="w-100">
                                      <div style="padding-left: 15px; width: 223px; height: 52px;" >
                                      <label style="padding-right: 5px;"><strong>COLOR</strong></label>
                                      <span id="goodsColor">${ g.goodsColor }</span>
                                     </div>
                                    </div>
                                                               
                                            
                    
                                    <!-- 수량 선택 -->
                                    <div class="input-group col-md-6 d-flex mb-3">
                                           <span class="input-group-btn mr-2">
                                           <button type="button" class="quantity-left-minus btn"  data-type="minus" data-field="">
                                                 <i class="fas fa-minus"></i>
                                           </button>
                                       </span>
                                           <input type="text" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="5">
                                           <span class="input-group-btn ml-2">
                                           <button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
                                               <i class="fas fa-plus"></i>
                                         </button>
                                        </span>
                                   </div>
                                   <div class="w-100"></div>
                                   <div class="col-md-12" style="margin-top: 5px;">
                                        <i class="fa-solid fa-truck">&emsp;무료배송</i>
                                   </div>
                            </div>
                            <div style="margin-top: 10px;"></div>
                             <c:if test="${ g.stock <= 0  }">   
	                           <p style="text-align: right;">
	                              <a class="btn btn-black py-3 px-5" style="border-radius: 70px; color: #fff; cursor: default;">일시 품절</a>
	                           </p>
                        	</c:if>
	                        <c:if test="${ g.stock > 0  }">   
	                           <p style="text-align: right;">
	                              <a id="orderBtn" class="btn btn-black py-3 px-5" style="border-radius: 70px; color: #fff;">구매하기</a>
	                           </p>
	                        </c:if>
                      </div>
                   </div>
                </div>
             </section>
            </form>
            
            <hr>
             <section class="ftco-section">
                <div class="container">
                     <div class="row justify-content-center mb-3 pb-3">
                   <div class="col-md-12 heading-section text-center ftco-animate">
                     <h2 class="mb-4"></h2>
                   </div>
                 </div>         
                </div>
             </section>
             
            
             <!-- 상세보기 사진 -->
             <c:forEach var="i" begin="1" end="${ fList.size() }">
                <c:if test="${ !empty fList[i] }">   
                    <div class="text-center">
                        <img src="${ contextPath }/resources/guploadFiles/${ fList[i].changeName }"  style="margin-bottom: 100px;">
                    </div>
                </c:if>
             </c:forEach>
   
       
     <hr style="margin-bottom: 0;">
   
   <!-- 댓글  -->
   <div id="review_area">
         <div style="text-align: center;">
            <img src="https://imgur.com/5CNrGWQ.jpg">
         </div>
      
      
 	  <!-- 댓글 컨테이너 -->
      <div class="container mt-5">
          <div class="row d-flex justify-content-center">
              <div class="col-md-7">
               <c:if test="${ !empty sessionScope.loginUser }">
                     <div id="comment_outer">
                        
                        <div style="display: flex;">
                            <div class="box">
	                            <c:if test="${loginUser.changeName == null and loginUser.managerYN == 'Y' }">
	                               <img id="userprofile" src="${contextPath}/resources/image2/profile.png" width="30" height="30">
	                            </c:if>
	                            <c:if test="${loginUser.changeName == null and loginUser.managerYN == 'N' }">
	                               <img id="userprofile" src="${contextPath}/resources/images4/logo_whiteBackground.png" width="30" height="30">
	                            </c:if>
                               	   <img id="userprofile" src="${contextPath}/resources/profileUploadFiles/${loginUser.changeName}" width="30" height="30">
                            </div>
                            <div id="loginUser">
                              <span id="loginId">${ loginUser.nickName }</span>
                           </div>
                           <div id="img" style="margin-left: 385px;">
                              <label for="comment_file" style="cursor: pointer;"><i class="fa-solid fa-image fa-lg"></i></label>
                           	  <input type="file" onchange="addFile(this);" multiple style="display: none;" id=comment_file>	
                           </div>
                       </div>        
                          <div class="d-flex flex-row" id="comment_inner"> 
                             
                             <!-- 댓글 작성 칸 -->
                             <div class="w-100 comment-area" id="comment_text"> 
                                   
                                   <!-- 댓글 입력 div 영역 -->
                                   <div id="comment_box">
                                      <label for="textarea" id="content_label">후기를 작성해주세요!</label>
                                      <div id="textarea" contenteditable="true"></div>
                                   </div>
                                 
                                  <!-- 글자수 제한 -->
                                  <div id="countContent">
                                     <span class="count_area">현재 입력한 글자 수</span>
                                     <strong id="countNum">0</strong>
                                     /
                                     <span class="count_area">전체 입력 가능한 글자 수</span>
                                     <span id="wirte_total">150</span>
                                  </div>
                                 
                                  <!-- 사진첨부 영역 -->
                                  <div class="fileList"></div>
                                 
                                  <!-- 후기작성 버튼 -->
                                  <div style="padding-top: 10px;">
                                     <button class="btn-block post-btn" id="rSubmit">후기작성</button>
                                  </div> 
                             </div>
                         </div>
                    </div>  
               </c:if>
               <c:if test="${ empty sessionScope.loginUser }">
                  <div id="loginMsg">후기 작성은 로그인 후 가능합니다.</div>
               </c:if>             
                      
                  <br>
                   
                  <!-- 작성된 댓글 리스트-->
                  <table class="replyTable" id="rTb" style="width: 700px; padding: 15px;">
                     <thead>
                        <tr>
                           <td colspan="2" style="padding-bottom: 50px;"><b id="rCount"></b></td>
                        </tr>
                     </thead>
                     <tbody></tbody>
                  </table>
                 
              </div>
          </div>
      </div>
   </div>
   
      
      
<script>
	
	// 댓글에 사진 추가 미리보기
	var fileNo = 0; // 각 첨부파일의 고유 번호(삭제 시 사용, 배열의 인덱스와 같은 번호 부여)
	var filesArr = new Array(); // 첨부파일을 담을 배열 선언
	
	function addFile(obj){
		var maxFileCnt = 3; // 첨부파일 최대 개수 
		var attFileCnt = document.querySelectorAll('.filebox').length; // 기존 추가된 첨부파일 개수
		var ramainFileCnt = maxFileCnt - attFileCnt; // 추가로 첨부가능한 개수
		var curFileCnt = obj.files.length; // 현재 선택된 첨부파일 개수
		
		// 첨부파일 개수 확인
		if(curFileCnt > ramainFileCnt) {
			alert('첨부파일은 최대 ' + maxFileCnt + '개 까지 첨부 가능합니다.');
		}
	
		for(var i = 0; i < Math.min(curFileCnt, ramainFileCnt); i++) {
			
			const file = obj.files[i];
			
			// 첨부파일 검증
			if(validation(file)) {  // validation(file)함수의 return값 받기
				//파일 배열에 담기
				var reader = new FileReader();
				reader.onload = function() {
					filesArr.push(file);
				};
				reader.readAsDataURL(file);
				
				// 목록 추가
				var html = '';
				html += '<div id="file' + fileNo + '" class="filebox">';
				html += '<img src="' + URL.createObjectURL(file) + '" class="preview" alt="이미지 로딩 실패">'
				html += '<button onclick="deleteFile(' + fileNo + ');" class="removeImg"><i class="fa-solid fa-circle-minus" style="color: gray; border: 1px solid white; border-radius: 60px; background-color: white;"></i></button>';
				html += '</div>';
			
				$('.fileList').append(html);  // append로 파일 리스트를 추가하므로 기존 첨부파일에 덧붙여서 사진 추가 가능
				fileNo++; // 각 파일마다 고유번호를 붙여주기위해 fileNo를 증가
				
			} else {
				continue;  // 파일 검증에 실패할 시 다음 file(obj.files[i]) 검증 진행(continue문은 해야할 명령을 하지 않고 그 다음 명령문 실행)
			}
		}
		
		// 초기화
		document.querySelector(".preview").value = "";
		
	}
	
	// 첨부파일 검증
	function validation(obj){
		const fileTypes = ['image/jpeg', 'image/png', 'image/jpg'];
		if(!fileTypes.includes(obj.type)) {
			alert("파일은 (jpeg, jpg, png) 형식만 등록 가능합니다.");
			return false;
		} else if(obj.name.length > 100) {
			alert('파일 명이 100자 이상이므로 첨부가 불가능합니다.');
			return false;
		}
		
		return true;
	}
		
		
	// 첨부파일 삭제
	function deleteFile(num) {
		 document.querySelector("#file" + num).remove(); // 사진 미리보기에서 해당 fileNo에 해당하는 사진 미리보기 삭제
		 filesArr[num].is_delete = true; // 배열의 num번째 인덱스에 해당하는 파일 삭제
		 console.log(num);
		 console.log(filesArr.length);
	}

 
    // 댓글 등록
    $('#rSubmit').click(function(){
       
       if($('#textarea').text().length == 0 || $('#textarea').text().trim() == '') {
                alert('내용을 입력하세요');
          } else {
          
          var rContent = $('#textarea').text();
          
          // 아래에서 로그인유저와 댓글 작성자 비교를 위해 로그인 유저의 email 담기
          var isWriter = "${loginUser.email}";
          var manager = "${loginUser.managerYN}";
          var goodsId = ${g.goodsId};
          
          // formData에 replyContent, gId, attach_file 담아서 controller로 보내기
          var formData = new FormData();
          formData.append("replyContent", rContent);
          formData.append("goodsId", goodsId);
          for (var i = 0; i < filesArr.length; i++) {
              // 삭제되지 않은 파일만 폼데이터에 담기
              if (!filesArr[i].is_delete) {
                  formData.append("replyFiles", filesArr[i]);
              }
          }
            
          $.ajax({
              url: 'addReply.go',
              contentType: false,
              processData: false,
              type: 'POST',
              data: formData,
              success: function(data){
                
                $('#textarea').text(''); // 댓글창 비우기
                $('#countNum').text('0'); // 글자 카운트 초기화
                $('.fileList').html(''); // 첨부파일 비우기
                $('#content_label').css('display', 'inline'); // div에 라벨 넣기
                filesArr.splice(0, filesArr.length);
                
                $tableBody = $('#rTb tbody');
                $tableBody.html(''); 
                
                $('#rCount').text('등록된 후기(' + data.length +'개)'); 
                
                var replyArr = []; // 댓글 배열
                var rfileArr = []; // 파일 배열
                
                if(data.length > 0){
				                    
                   	// 댓글 data 배열에 담기
                      for(var i in data) {
                    	   replyArr.push(data[i]);
                      }
                      	
                      // 파일 data 배열에 담기    
                   	  $.ajax({
                   		 url: 'rFile.go',
               	         data : {gId: goodsId},
               	         success: function(file){
               	        	   
               	        	for(var i in file) {
               	        	   		
               	        	   rfileArr.push(file[i]);
                             
               	        	}
               	        	
               	        	// 화면 구성
                          	for(var i = 0; i < replyArr.length; i++) {
                          		
                             	$userTr = $('<tr>').css('padding', '10px 5px');
          	               		$profileTd = $('<td class="profileTd">');
          	                  
         	                    if(replyArr[i].profileImg == null && replyArr[i].manager_yn == 'Y') {
         	                 	  $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/image2/profile.png");
         	                    } else if(replyArr[i].profileImg == null && replyArr[i].manager_yn == 'N') {
         	                	   $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/images4/logo_whiteBackground.png");
         	                    } else {
         	 	                  $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/profileUploadFiles/" + replyArr[i].profileImg);
         	                    }
          	                  
         	                    $writer = $('<td class="rwriter">').text(replyArr[i].nickName);
         	                    $date = $('<td colspan="2" class="rdate">').text(replyArr[i].modifyDate);
         	                    $btnTr = $('<tr>').css({'text-align':'right', 'width':'150px', 'background-color': 'none'});
         	                    $upbtn = $('<td colspan="3"><button id="update' + replyArr[i].replyId + '" class="rupdateBtn">수정</button><button id="submit' + replyArr[i].replyId + '" class="rsubmitBtn" style="display:none;">등록</button>');
         	                    $debtn = $('<td class="deleteBtn"><button id="delete' + replyArr[i].replyId + '" class="rdeleteBtn"">삭제</button>')
          	                  
          	              	    $contentTr = $('<tr>');
          	               		$content = $('<td colspan="4" id="content' + replyArr[i].replyId + '" class="rContent">').text(replyArr[i].replyContent);
          	               
         	               	    $fileTr = $('<tr>')
         	               	    $fileTd = $('<td colspan="4">')
         	               	   
         	               	    for(var j = 0; j < rfileArr.length; j++) {
         	               	   			if(replyArr[i].replyId == rfileArr[j].replyId) {

         	               	   				$file = $('<img id="file' + rfileArr[j].fileId + '" class="rfiles">').attr("src", "${contextPath}/resources/ruploadFiles/" + rfileArr[j].changeName);
            	               		    $fileTd.append($file);
               	                   	}
         	               	    }		
            	               		   
          	               
         	               	    $updateArea = $('<tr><td colspan="4" width="400px"><div id="updateArea' + replyArr[i].replyId + '" class="updateArea" contenteditable="true">');
            	              	    $countContent = $('<tr><td colspan="4" width="400px"><div id="countContent' + replyArr[i].replyId + '" class="countContent"><span class="count_area">현재 입력한 글자 수</span><strong id="countNum' + replyArr[i].replyId + '" class="countNum">0</strong>/<span class="count_area">전체 입력 가능한 글자 수</span><span id="wirte_total' + replyArr[i].replyId + '" class="wirte_total">150</span></td>');
            	              	 
 	             	            $profileTd.append($profile);
            	                    $userTr.append($profileTd);
            	                    $userTr.append($writer);
            				        $userTr.append($date);
            	                  
          	                    // 댓글 작성자 = 로그인 유저 같은 경우 수정, 삭제 버튼 보이게
          	                    var rWriter = replyArr[i].email;
          	                    if(isWriter === rWriter) {
          	                       $btnTr.append($upbtn);
          	                       $btnTr.append($debtn);
          	                    } else if(manager == 'Y') {
          	                       $debtn = $('<td colspan="4" class="deleteBtn"><button id="delete' + replyArr[i].replyId + '" class="rdeleteBtn"">삭제</button>')
          	                       $btnTr.append($debtn);
          	                    }
           	                   
            	                  
            	                   $contentTr.append($content);
            	                
            	                   $fileTr.append($fileTd);
            	                
            	                   $tableBody.append($userTr);
            	                   $tableBody.append($btnTr);
            	                   $tableBody.append($fileTr);   
            	                   $tableBody.append($contentTr);
            	                
            	                   $tableBody.append($updateArea);
            	                   $tableBody.append($countContent);
                           	   
                          	}	
               	        	   
             	        }
               	        	
                   	});

                } else {
              	  $tr = $('<tr>');
                    $content = $('<td colspan="3">').text('등록된 후기가 없습니다.');
                    
                    $tr.append($content);
                    $tableBody.append($tr);
                }
              },
             error: function(data){
                console.log(data);
             }
          });
        }
    });   
      
      
      // 댓글 목록 조회
      $(document).ready(function getReplyList(){
        // 아래에서 로그인유저와 댓글 작성자 비교를 위해 로그인 유저의 email 담기
        var isWriter = "${loginUser.email}";
        var manager = "${loginUser.managerYN}";
        var goodsId = ${g.goodsId};
   
         $.ajax({
           url: 'rList.go',
           data : {goodsId: goodsId},
           success: function(data){
             console.log(data);
             
            $tableBody = $('#rTb tbody');
            $tableBody.html(''); 
            
            
            $('#rCount').text('등록된 후기(' + data.length +'개)'); 
            
            var replyArr = []; // 댓글 배열
               var rfileArr = []; // 파일 배열
               
               if(data.length > 0){
					                    
                  	// 댓글 data 배열에 담기
                     for(var i in data) {
                   	   replyArr.push(data[i]);
                     }
                     	
                     // 파일 data 배열에 담기    
                   	$.ajax({
                   		 url: 'rFile.go',
               	         data : {gId: goodsId},
               	         success: function(file){
               	        	   
               	        	for(var i in file) {
               	        	   		
               	        	   rfileArr.push(file[i]);
                             
               	        	}
               	        	// 화면 구성
                          	for(var i = 0; i < replyArr.length; i++) {
                          	
                             	$userTr = $('<tr>').css('padding', '10px 5px');
          	               		$profileTd = $('<td class="profileTd">');
          	                  
         	                    if(replyArr[i].profileImg == null && replyArr[i].manager_yn == 'Y') {
         	                 	  $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/image2/profile.png");
         	                    } else if(replyArr[i].profileImg == null && replyArr[i].manager_yn == 'N') {
         	                	   $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/images4/logo_whiteBackground.png");
         	                    } else {
         	 	                   $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/profileUploadFiles/" + replyArr[i].profileImg);
         	                    } 
          	                  
         	                    $writer = $('<td class="rwriter">').text(replyArr[i].nickName);
         	                    $date = $('<td colspan="2" class="rdate">').text(replyArr[i].modifyDate);
         	                    $btnTr = $('<tr>').css({'text-align':'right', 'width':'150px', 'background-color': 'none'});
         	                    $upbtn = $('<td colspan="3"><button id="update' + replyArr[i].replyId + '" class="rupdateBtn">수정</button><button id="submit' + replyArr[i].replyId + '" class="rsubmitBtn" style="display:none;">등록</button>');
         	                    $debtn = $('<td class="deleteBtn"><button id="delete' + replyArr[i].replyId + '" class="rdeleteBtn"">삭제</button>')
          	                  
          	              	    $contentTr = $('<tr>');
          	               		$content = $('<td colspan="4" id="content' + replyArr[i].replyId + '" class="rContent">').text(replyArr[i].replyContent);
          	               
         	               	    $fileTr = $('<tr>')
         	               	    $fileTd = $('<td colspan="4">')
         	               	   
         	               	    for(var j = 0; j < rfileArr.length; j++) {
         	               	   			if(replyArr[i].replyId == rfileArr[j].replyId) {
										$fId = ('<td id="fId' + rfileArr[j].fileId + '" style="display: none;">');	
										$btnTr.append($fId);
      	               	   					
										$file = $('<img id="file' + rfileArr[j].fileId + '" class="rfiles">').attr("src", "${contextPath}/resources/ruploadFiles/" + rfileArr[j].changeName);
             	               		    $fileTd.append($file);
                 	               }
         	               	    }		
          	               
	             	        $profileTd.append($profile);
           	                $userTr.append($profileTd);
           	                $userTr.append($writer);
           				    $userTr.append($date);
          	                  
        	                    // 댓글 작성자 = 로그인 유저 같은 경우 수정, 삭제 버튼 보이게
        	                    var rWriter = replyArr[i].email;
        	                    if(isWriter === rWriter) {
        	                       $btnTr.append($upbtn);
        	                       $btnTr.append($debtn);
        	                    } else if(manager == 'Y') {
        	                       $debtn = $('<td colspan="4" class="deleteBtn"><button id="delete' + replyArr[i].replyId + '" class="rdeleteBtn"">삭제</button>')
        	                       $btnTr.append($debtn);
        	                    }
         	                   
          	                  
          	                   $contentTr.append($content);
          	                
           	               $fileTr.append($fileTd);
	           	              // $btnTr.append($fId);
           	                
           	               $tableBody.append($userTr);
           	               $tableBody.append($btnTr);
           	               $tableBody.append($fileTr);   
           	               $tableBody.append($contentTr);
           	                
           	               // 수정 역역
        	               $updateArea = $('<tr><td colspan="4" width="400px"><div id="updateArea' + replyArr[i].replyId + '" class="updateArea" contenteditable="true">');
         	               $countContent = $('<tr><td colspan="4" width="400px"><div id="countContent' + replyArr[i].replyId + '" class="countContent"><span class="count_area">현재 입력한 글자 수</span><strong id="countNum' + replyArr[i].replyId + '" >0</strong> / <span class="count_area">전체 입력 가능한 글자 수</span><span id="wirte_total' + replyArr[i].replyId + '" class="wirte_total">150</span></td>');
           	                
   	               	   	   $updateFileTd = $('<td colspan="4" class="updateFile">')
           	               for(var j = 0; j < rfileArr.length; j++) {
   	               	   			if(replyArr[i].replyId == rfileArr[j].replyId) {
          	              	 		$updateImg = $('<img id="updateImg' + replyArr[i].replyId + '" class="updateImg">').attr("src", "${contextPath}/resources/ruploadFiles/" + rfileArr[j].changeName);
          	              	 		$updateFileTd.append($updateImg);
   	               	   			}
   	               	   	   }	
          	                 
          	                   $tableBody.append($updateArea);
          	                   $tableBody.append($countContent);
           	                   // $tableBody.append($updateImg);
          	                   $tableBody.append($updateFileTd);
                           	   
                          	}	
       	            }
               	        	
                  	});

               } else {
             	  $tr = $('<tr>');
                   $content = $('<td colspan="3">').text('등록된 후기가 없습니다.');
                   
                   $tr.append($content);
                   $tableBody.append($tr);
               }
             },
           error: function(data){
              console.log(data);
           }
         });
      
      });

		
     // 사진 클릭 시 이미지 확대 축소
     $(document).on("click", ".rfiles", function(){
    	var fId = $(this).attr("id").substring(4);
    	var rimg = $("#file" + fId);
    	
    	rimg.toggleClass('largeImg');
     });
	     
     var htmlup = "";
     // 댓글 수정
     $(document).on("click", ".rupdateBtn", function(){
        var rId = $(this).attr("id").substring(6);
     	var rContent = $('#content' + rId).text();
     	var fId = $('#update' + rId).parent('td').parent('tr').children('td');
     	console.log(fId);
      
        $("#updateArea" + rId).css('display', 'block').focus().text(rContent);
        $("#countContent" + rId).css('display', 'block');
        $('#submit' + rId).css('display', 'inline');
        $('#update' + rId).css('display', 'none');
        $('#count').css('display','inline');

        // 수정 댓글 글자 수
        var comment = $("#updateArea" + rId).text();
        $('#countNum' + rId).text(comment.length);
      
        $('#updateArea' + rId).keyup(function(){
        
        	var comment = $("#updateArea" + rId).text();
        	$('#countNum' + rId).text(comment.length);
       
	        if(comment.length >= 150){
	      	 alert("최대 150글자까지 입력 가능합니다");
	           $(this).text(comment.substring(0,149));
	        }
       });
     });
         
         
     $(document).on("click", ".rsubmitBtn", function(){
          var rId = $(this).attr("id").substring(6);
	      var rContent = $('#updateArea' + rId).text();
	      var goodsId = ${g.goodsId};
	      var isWriter = "${loginUser.email}";
	      var manager = "${loginUser.managerYN}";
      
	      $("#updateArea" + rId).css('display', 'none');
	      $("#countContent" + rId).css('display', 'none');
	      $('#submit' + rId).css('display', 'none');
	      $('#update' + rId).css('display', 'inline-block');
      
      
	      if($('#updateArea' + rId).text().length == 0 || $('#updateArea' + rId).text().trim() == '') {
	     	alert('내용을 입력하세요');
	      } else {
      
		      $.ajax({
		         url: 'rupdate.go',
		         data: {replyId:rId, replyContent:rContent, goodsId:goodsId},
		         success: function(data){
		             
		            $tableBody = $('#rTb tbody');
		            $tableBody.html(''); 
		            $('#rCount').text('등록된 후기(' + data.length +'개)'); 
		            
		            var replyArr = []; // 댓글 배열
		            var rfileArr = []; // 파일 배열
		               
		               if(data.length > 0){
		                  	 // 댓글 data 배열에 담기
		                     for(var i in data) {
		                   	   replyArr.push(data[i]);
		                     }
		                     	
		                     // 파일 data 배열에 담기    
		                   	 $.ajax({
		                   		 url: 'rFile.go',
		               	         data : {gId: goodsId},
		               	         success: function(file){
		               	        	   
		               	        	for(var i in file) {
		               	        	   rfileArr.push(file[i]);
		               	        	}
		               	        	
		               	        	// 화면 구성
		                          	for(var i = 0; i < replyArr.length; i++) {
		                          	
		                             	$userTr = $('<tr>').css('padding', '10px 5px');
		          	               		$profileTd = $('<td class="profileTd">');
		          	                  
		         	                    if(replyArr[i].profileImg == null && replyArr[i].manager_yn == 'Y') {
		         	                 	  $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/image2/profile.png");
		         	                    } else if(replyArr[i].profileImg == null && replyArr[i].manager_yn == 'N') {
		         	                	  $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/images4/logo_whiteBackground.png");
		         	                    } else {
		         	 	                  $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/profileUploadFiles/" + replyArr[i].profileImg);
		         	                    }
		          	                  
		         	                    $writer = $('<td class="rwriter">').text(replyArr[i].nickName);
		         	                    $date = $('<td colspan="2" class="rdate">').text(replyArr[i].modifyDate);
		         	                    $btnTr = $('<tr>').css({'text-align':'right', 'width':'150px', 'background-color': 'none'});
		         	                    $upbtn = $('<td colspan="3"><button id="update' + replyArr[i].replyId + '" class="rupdateBtn">수정</button><button id="submit' + replyArr[i].replyId + '" class="rsubmitBtn" style="display:none;">등록</button>');
		         	                    $debtn = $('<td class="deleteBtn"><button id="delete' + replyArr[i].replyId + '" class="rdeleteBtn"">삭제</button>')
		          	                  
		          	              	    $contentTr = $('<tr>');
		          	               		$content = $('<td colspan="4" id="content' + replyArr[i].replyId + '" class="rContent">').text(replyArr[i].replyContent);
		          	               
		         	               	    $fileTr = $('<tr>')
		         	               	    $fileTd = $('<td colspan="4">')
		         	               	   
		         	               	    for(var j = 0; j < rfileArr.length; j++) {
		         	               	   			if(replyArr[i].replyId == rfileArr[j].replyId) {
		
		         	               	   				$file = $('<img id="file' + rfileArr[j].fileId + '" class="rfiles">').attr("src", "${contextPath}/resources/ruploadFiles/" + rfileArr[j].changeName);
		            	               		    $fileTd.append($file);
		               	                   	}
		         	               	   	}		
		            	               		   
		          	               
		         	               	   $updateArea = $('<tr><td colspan="4" width="400px"><div id="updateArea' + replyArr[i].replyId + '" class="updateArea" contenteditable="true">');
		            	               $countContent = $('<tr><td colspan="4" width="400px"><div id="countContent' + replyArr[i].replyId + '" class="countContent"><span class="count_area">현재 입력한 글자 수</span><strong id="countNum' + replyArr[i].replyId + '">0</strong>/<span class="count_area">전체 입력 가능한 글자 수</span><span id="wirte_total' + replyArr[i].replyId + '">150</span></td>');
		            	              	 
		 	             	           $profileTd.append($profile);
		            	               $userTr.append($profileTd);
		            	               $userTr.append($writer);
		            				   $userTr.append($date);
		            	                  
		          	                    // 댓글 작성자 = 로그인 유저 같은 경우 수정, 삭제 버튼 보이게
		          	                    var rWriter = replyArr[i].email;
		          	                    if(isWriter === rWriter) {
		          	                       $btnTr.append($upbtn);
		          	                       $btnTr.append($debtn);
		          	                    } else if(manager == 'Y') {
		          	                       $debtn = $('<td colspan="4" class="deleteBtn"><button id="delete' + replyArr[i].replyId + '" class="rdeleteBtn"">삭제</button>')
		          	                       $btnTr.append($debtn);
		          	                    }
		           	                   
		            	                  
		            	                  $contentTr.append($content);
		            	                  $fileTr.append($fileTd);
		            	                
		            	                  $tableBody.append($userTr);
		            	                  $tableBody.append($btnTr);
		            	                  $tableBody.append($fileTr);   
		            	                  $tableBody.append($contentTr);
		            	                  $tableBody.append($updateArea);
		            	                  $tableBody.append($countContent);
		                          	}	
		               	        	   
		               	         }
		               	        	
		                   	});
		
		               } else {
		             	  $tr = $('<tr>');
		                   $content = $('<td colspan="3">').text('등록된 후기가 없습니다.');
		                   
		                   $tr.append($content);
		                   $tableBody.append($tr);
		               }
		             },
		         	 error: function(data){
		       	      console.log(data);
   		             }
		      });
     	 } 
     });
     	
     
     // 댓글 삭제 클릭 시 confirm
     function Gdelete(){
        var ans = confirm('삭제하시겠습니까?');
        if(ans){
           location.href='${ gdelete }'
        }
     }    
         
         
     // 댓글 삭제
     $(document).on("click", ".rdeleteBtn", function(){
        var rId = $(this).attr("id").substring(6);
        // 아래에서 로그인유저와 댓글 작성자 비교를 위해 로그인 유저의 email 담기
        var goodsId = ${g.goodsId};
        var isWriter = "${loginUser.email}";
        var manager = "${loginUser.managerYN}";
        
        var ans = confirm("선택하신 댓글을 삭제하시겠습니까?");
        if(!ans) return false;
        
        $.ajax({
	        url: 'rdelete.go',
	        data: {replyId:rId, goodsId:goodsId},
	        success: function(data){
            	console.log(data);
            
            $tableBody = $('#rTb tbody');
            $tableBody.html(''); 
           
           $('#rCount').text('등록된 후기(' + data.length +'개)'); 
           
           var replyArr = []; // 댓글 배열
           var rfileArr = []; // 파일 배열
           
           if(data.length > 0){
		                    
              	// 댓글 data 배열에 담기
                 for(var i in data) {
               	   replyArr.push(data[i]);
                 }
                 	
                // 파일 data 배열에 담기    
               	$.ajax({
               		 url: 'rFile.go',
           	         data : {gId: goodsId},
           	         success: function(file){
           	        	   
           	        	for(var i in file) {
           	        	   rfileArr.push(file[i]);
           	        	}
           	        	
           	        	// 화면 구성
                      	for(var i = 0; i < replyArr.length; i++) {
                      	
                         	$userTr = $('<tr>').css('padding', '10px 5px');
      	               		$profileTd = $('<td class="profileTd">');
      	                  
     	                    if(replyArr[i].profileImg == null && replyArr[i].manager_yn == 'Y') {
     	                 	  $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/image2/profile.png");
     	                    } else if(replyArr[i].profileImg == null && replyArr[i].manager_yn == 'N') {
     	                	   $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/images4/logo_whiteBackground.png");
     	                    } else {
     	 	                  $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/profileUploadFiles/" + replyArr[i].profileImg);
     	                    }
      	                  
     	                    $writer = $('<td class="rwriter">').text(replyArr[i].nickName);
     	                    $date = $('<td colspan="2" class="rdate">').text(replyArr[i].modifyDate);
     	                    $btnTr = $('<tr>').css({'text-align':'right', 'width':'150px', 'background-color': 'none'});
     	                    $upbtn = $('<td colspan="3"><button id="update' + replyArr[i].replyId + '" class="rupdateBtn">수정</button><button id="submit' + replyArr[i].replyId + '" class="rsubmitBtn" style="display:none;">등록</button>');
     	                    $debtn = $('<td class="deleteBtn"><button id="delete' + replyArr[i].replyId + '" class="rdeleteBtn"">삭제</button>')
      	                  
      	              	    $contentTr = $('<tr>');
      	               		$content = $('<td colspan="4" id="content' + replyArr[i].replyId + '" class="rContent">').text(replyArr[i].replyContent);
      	               
     	               	    $fileTr = $('<tr>')
     	               	    $fileTd = $('<td colspan="4">')
     	               	   
     	               	    for(var j = 0; j < rfileArr.length; j++) {
   	               	   			if(replyArr[i].replyId == rfileArr[j].replyId) {
   	               	   				$file = $('<img id="file' + rfileArr[j].fileId + '" class="rfiles">').attr("src", "${contextPath}/resources/ruploadFiles/" + rfileArr[j].changeName);
         	               		    	$fileTd.append($file);
           	                   	}
     	               	    }		
           	               		   
     	               
   	               	   		$updateArea = $('<tr><td colspan="4" width="400px"><div id="updateArea' + replyArr[i].replyId + '" class="updateArea" contenteditable="true">');
       	              	    $countContent = $('<tr><td colspan="4" width="400px"><div id="countContent' + replyArr[i].replyId + '" class="countContent"><span class="count_area">현재 입력한 글자 수</span><strong id="countNum' + replyArr[i].replyId + '" class="countNum">0</strong>/<span class="count_area">전체 입력 가능한 글자 수</span><span id="wirte_total' + replyArr[i].replyId + '" class="wirte_total">150</span></td>');
       	              	 
        	           		$profileTd.append($profile);
       	                    $userTr.append($profileTd);
       	                    $userTr.append($writer);
       				        $userTr.append($date);
        	                  
      	                    // 댓글 작성자 = 로그인 유저 같은 경우 수정, 삭제 버튼 보이게
      	                    var rWriter = replyArr[i].email;
      	                    if(isWriter === rWriter) {
      	                       $btnTr.append($upbtn);
      	                       $btnTr.append($debtn);
      	                    } else if(manager == 'Y') {
      	                       $debtn = $('<td colspan="4" class="deleteBtn"><button id="delete' + replyArr[i].replyId + '" class="rdeleteBtn"">삭제</button>')
      	                       $btnTr.append($debtn);
      	                    }
       	                   
        	                  
       	                   $contentTr.append($content);
       	                   $fileTr.append($fileTd);
        	                
       	                   $tableBody.append($userTr);
       	                   $tableBody.append($btnTr);
       	                   $tableBody.append($fileTr);   
       	                   $tableBody.append($contentTr);
       	                   $tableBody.append($updateArea);
       	                   $tableBody.append($countContent);
                       	   
                      	}	
           	         }
               	});

           } else {
         	  $tr = $('<tr>');
               $content = $('<td colspan="3">').text('등록된 후기가 없습니다.');
               
               $tr.append($content);
               $tableBody.append($tr);
           }
         },
         error: function(data){
           console.log(data);
         } 
      	});
     });
         
     
    // 댓글 입력 폼 안에 라벨 제거
    $(document).ready(function(){
       $('#textarea').keyup(function(){
          
          // div안에 라벨 없애기   
          if($('#textarea').text().length == 0 || $('#textarea').text() == '') {
             $('#content_label').css('display', 'inline');
          } else {
             $('#content_label').css('display', 'none');
          }
          
          // 댓글 글자 수 세기
          var comment = $(this).text();
          $('#countNum').text(comment.length);
       
         if(comment.length >= 150) {
           alert("최대 150글자까지 입력 가능합니다");
           $(this).text(comment.substring(0,149));
         } 
       }); 
    });


    // 용품 수량 카운트
    $(document).ready(function(){

    	 var quantitiy=0;
       $('.quantity-right-plus').click(function(e){
            
            e.preventDefault();
            var quantity = parseInt($('#quantity').val());
                $('#quantity').val(quantity + 1);
       });

         $('.quantity-left-minus').click(function(e){
            e.preventDefault();
            var quantity = parseInt($('#quantity').val());
                if(quantity>0){
                	$('#quantity').val(quantity - 1);
                }
        });
    });
      
      
    // 카테고리분류
    $('.goods-category').click(function(){
       var cate = $(this).attr("id");
    	 location.href='gCate.go?category=' + cate      
    });
      
      
    // 구매하기 버튼 클릭
    $("#orderBtn").click(function(){
      var goodsSize = $("#goodsSize").text();
      var goodsColor = $("#goodsColor").text();
      var goodsPrice = $("#goodsPrice").text().replace(",", "");
      var goodsQtt = $("#quantity").val();
      var totalPrice = (goodsPrice * goodsQtt);
      
      if(${loginUser == null}) {
         alert("로그인 후 구매 가능합니다.");
         window.location.href="loginView.me";
      } else {
         location.href="order.od?goodsId="+${g.goodsId}+"&goodsName="+"${g.goodsName}"+"&goodsBrand="+"${g.goodsBrand}"
                  +"&goodsSize="+goodsSize+"&goodsColor="+goodsColor+"&totalPrice="+totalPrice+"&changeName="+"${fList[0].changeName}"
                  +"&goodsQtt="+goodsQtt;
         }    
    });

</script>
   
   
   
   
  <script src="resources/js6/jquery.min.js"></script>
  <script src="resources/js6/jquery-migrate-3.0.1.min.js"></script>
  <script src="resources/js6/popper.min.js"></script>
  <script src="resources/js6/bootstrap.min.js"></script>
  <script src="resources/js6/jquery.easing.1.3.js"></script>
  <script src="resources/js6/jquery.waypoints.min.js"></script>
  <script src="resources/js6/jquery.stellar.min.js"></script>
  <script src="resources/js6/owl.carousel.min.js"></script>
  <script src="resources/js6/jquery.magnific-popup.min.js"></script>
  <script src="resources/js6/aos.js"></script>
  <script src="resources/js6/jquery.animateNumber.min.js"></script>
  <script src="resources/js6/bootstrap-datepicker.js"></script>
  <script src="resources/js6/scrollax.min.js"></script>
  <script src="resources/https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="resources/js6/google-map.js"></script>
  <script src="resources/js6/main.js"></script>
  <script src="resources/js6/user.js"></script>
    
    <!-- footer -->
    <c:import url="../common/footer.jsp"/>
    
 </body>
</html>