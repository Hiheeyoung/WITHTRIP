<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="<%=request.getContextPath() %>/images/favicon.png" type="">
  <link href="<%=request.getContextPath() %>/css5/Review-writeForm.css" rel="stylesheet">
  <link rel="stylesheet" href="resources/css5/Review-writeForm.css">

  <title>WITHTRIP :: 함께라서 좋은 여행</title>

<!-- 영어폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Babylonica&family=Noto+Sans+KR:wght@300&family=Raleway:wght@300&display=swap" rel="stylesheet">

<style>
@import url('https://fonts.googleapis.com/css2?family=Babylonica&family=Noto+Sans+KR:wght@300&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Babylonica&family=Noto+Sans+KR:wght@300&family=Raleway:wght@300&display=swap');
#f1{
	color: black;
    padding-left: 12px;
    font-weight: 600;
}
.upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 78%;
    color: #999999;
}
#fileList label{
	margin: 8px;
    display: inline-block;
    padding: 6px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #6495ED;
    border-radius: 5px;
    cursor: pointer;
    height: 40px;
    margin-left: 10px;
}

#fileList label:hover{
	color: white;
	background-color: black;
}

#fileList input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}
</style>

</head>
<body class="sub_page">

<c:import url="../common/navbar.jsp"/>


<section class="trip_section layout_padding">
	<div class="container">
		<div class="heading_container heading_center">
        </div>
            
            
<!-- 사용할 부분 board list 시작-->
		<div class="detail_outer">
        <br>
      		<div class="table-area">
  				<form action="tupdate.to" method="post" id="detailForm" enctype="Multipart/form-data">
					<input type="hidden" readonly="readonly" value="${ tboard.tripId }" name="tripId">
					<input type="hidden" name="boardId" readonly="readonly" value="${ tboard.boardId }">
					<input type="hidden" value="${ tboard.email }" readonly="readonly" name="email">
	                <input type="hidden" id="q_Date" name="memberNo" readonly value="${ loginUser.member_no }">
					<input type="hidden" value="${ page }" readonly="readonly" name="page">
					<input type="hidden" name="changeName" value="${ a.changeName }">
					 <h2 class="b_title" style="color:#6495ED;">With trip</h2>
					<table style="color: black; font-weight: bold;">
                   
						 <tr>
						      <td class="tr_title">작성자</td>
	                          <td class="td_content">
	                         	 ${ loginUser.nickName }
	                         	 <a href="${ loginUser.nickName }"></a>
	                            <input type="hidden" id="q_Date" name="nickName" readonly value="${ loginUser.nickName }">
	                         	<input type="hidden" id="q_Date" name="email" readonly value="${ loginUser.email }">
	                          </td>
	                      </tr>
	                      
	                      <tr>
	                          <td class="tr_title">참여 인원 </td>
	                          <td class="td_content" id="select1"> 
	                          	<select class="form-select" aria-label="Default select example" name="partCount" value="${ tboard.partCount }">
								  	<option value="">모집 인원</option>
								  	<option value="1"
								  		<c:if test="${tboard.partCount==1}">selected</c:if>>1</option>
								  	<option value="2"
								  		<c:if test="${tboard.partCount==2}">selected</c:if>>2</option>
								  	<option value="3"
								  		<c:if test="${tboard.partCount==3}">selected</c:if>>3</option>
								  	<option value="4"
								  		<c:if test="${tboard.partCount==4}">selected</c:if>>4</option>
								  	<option value="5"
								  		<c:if test="${tboard.partCount==5}">selected</c:if>>5</option>
							 	</select>
							 </td>
							 <td class="tr_title">취향 선택</td>
							 <td class="td_content"> 
	                          	<select id="${ tboard.preference }" class="form-select" aria-label="Default select example" name="preference" value="${ tboard.preference }">
	                          		<option value="" >취향 선택</option>
									<option value="아무나좋아"
									  	<c:if test="${tboard.preference=='아무나좋아'}">selected</c:if>>#아무나좋아</option>
									<option value="힐링"
										<c:if test="${tboard.preference=='힐링'}">selected</c:if>>#힐링</option>
									<option value="엑티비티"
										<c:if test="${tboard.preference=='엑티비티'}">selected</c:if>>#엑티비티</option>
									<option value="인생사진"
										<c:if test="${tboard.preference=='인생사진'}">selected</c:if>>#인생사진</option>
									<option value="자연"
										<c:if test="${tboard.preference=='자연'}">selected</c:if>>#자연</option>
							 	</select>
							 </td>
	                      </tr>
	                      
	                       <tr>
    						  <td class="tr_title">여행 출발일</td>
	                          <td class="td_content"> 
	                            <input type="date" id="q_Date" name="tripStart" value="${ tboard.tripStart }">
	                          </td>
	                          <td class="tr_title">여행 도착일</td>
	                          <td class="td_content"> 
	                            <input type="date" id="q_Date" name="tripEnd" value="${ tboard.tripEnd }">
	                          </td>
	                      </tr>
	    				  <tr>
							 <td class="tr_title">제목</td>
	                         <td class="td_content" colspan="10">
	                            <input type="text" id="q_Title" name="boardTitle" value="${ tboard.boardTitle }">
	                         </td>
	                      </tr>
	    				  
	    				  <tr>
	    				  	 <td class="tr_title">내용</td>
	    				  </tr>
	                      <tr>
	                          <td colspan="6"><textarea cols="70px" rows="15px" style="resize:none;" name="boardContent">${ tboard.boardContent }</textarea></td>
	                      </tr>
                      </table>
					<!-- 파일 첨부 -->
                      <table id="fileList">
	                   <tr onMouseOver="fileList.clickedRowIndex=this.rowIndex" >
	                       <td class="file" id="f1">사진</td>
	                       <td class="file">
	                        <input class="upload-name" placeholder="첨부파일" name="reuploadFile" value="${ a.originName }">
							    <label for="file">파일찾기</label> 
							    <input type="file" id="file" name="reuploadFile">
							    <c:if test="${ !empty a.originName }">
							    	<a href="${ contextPath }/resources/tuploadFiles/${ a.changeName }" download="${ a.originName }"></a>
								</c:if>
	                       </td>
					   </tr>
                 	  </table>
                      <script>
	                      $("#file").on('change',function(){
	                    	  var fileName = $("#file").val();
	                    	  $(".upload-name").val(fileName);
	                    	});
                      </script>
						<!-- button area -->
						<br><br>
                        <div class="row md-2 mt-2 mb-2">
                        	<div class="col md-2" id="btnSubmit">
                        		<button type="submit" id="reviewPost" style=" display: inline-block;">수정하기</button>
                        		<c:url var="blist" value="tlist.to">
									<c:param name="page" value="${ page }"/>
								</c:url>
                        		<button type="button" id="reviewPost" style=" display: inline-block;" onclick="location.href='javascript:history.go(-1);'">취소</button>
                        	</div>
                        </div>
                        
                    </form>
                  </div>   
              </div>
        </div>
      </section>

  <!-- end about section -->

  <!-- footer section -->
  

  
  <!-- footer section -->


  <script src="<%=request.getContextPath() %>/resources/js5/Review-writeForm.js"></script>

  <!-- jQery -->
  <script src="<%=request.getContextPath() %>/resources/js5/jquery-3.6.0.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  <script src="<%=request.getContextPath() %>resources/js5/bootstrap.js"></script>
  <!-- owl slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <!-- isotope js -->
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <!-- nice select -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <!-- custom js -->
  <script src="<%=request.getContextPath() %>/js5/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js5?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
  </script>
  <!-- End Google Map -->
  
  <c:import url="../common/footer.jsp"/>
  
  </body>
  <footer class="blog-footer">
</footer>
</html>