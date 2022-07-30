<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>WITHTRIP :: 함께라서 좋은 여행</title>
    
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">   
 
<style>

@media (min-width: 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

/*채팅관련 추가*/
#co4{
/* 	background-color: #F6F6F6; */
	width: 130px;
    height: 28px;
    border-radius: 5px;
    margin: 10px;
/*     float: right; */

}

#with{
	display: block;
    margin-top: 5px;
    width: 200px;
    height: 41px;
    transition: background 0.3s ease-in-out;
}

#withEnd{
	display: block;
    margin-top: 5px;
    width: 200px;
    height: 41px;
    transition: background 0.3s ease-in-out;
}

#title{
	display: block;
    width: 790px;
}

</style>

<link href="resources/css5/blog.css" rel="stylesheet">

</head>
<body>

<c:import url="../common/navbar.jsp"/>
			
<form action="tripDetailView.to" method="get">
	<div class="container2">
	
		<!-- 이미지 썸네일 영역 -->
		<c:if test="${ tboard.boardId == tboard.tripId }"> 
			<div class="row2" style="border-radius: 15px; overflow: hidden; width:1000px; height:400px; display: grid; align-content: space-around;" >
				<c:if test="${ !empty a.originName }">
					<img class="Thumbnail-image" name="renameFileName" style="border-radius: 20px; height: 100%; width: 100%;"
					src="${contextPath}/resources/tuploadFiles/${a.changeName}" >
				</c:if>
				<input type="hidden" value="${ a.changeName }" name="changeName">
				<input type="hidden" value="${ a.originName }" name="originName">
			</div>
		</c:if>
		<c:url var="tdelete" value="tdelete.to">
			<c:param name="bId" value="${ tboard.tripId }"/>
			<c:param name="changeName" value="${ a.changeName }"/>
		</c:url>
		<c:if test="${ loginUser.email eq tboard.email }">
		<div class="tripForm">
	   		<div>
	   			<button class="reviewPost">수정</button>
	   		</div>
	   		<div>
	   			<button type="button" class="reviewPost" onclick="deleteTrip()">삭제</button>
	   		</div>
	   		<script>
	   			function deleteTrip(){
	   				var yn = confirm('정말 삭제하시겠습니까?');
	   				if(yn){
	   					location.href='${ tdelete }'
	   				}
	   			}
	   		</script>
	   	</div>
		</c:if>
		<!-- 게시글 정보 -->
		<input type="hidden" value="${ tboard.tripId }" name="tripId">
	    <input type="hidden" name="memberNo" readonly value="${ tboard.memberNo }">
		<input type="hidden" value="${ page }" name="page">
		<div class="row mb-12" id="postTitle">
		  	<p id="title">${ tboard.boardTitle }</p>
		    <input type="hidden" name="boardTitle" value="${ tboard.boardTitle }">
		    <div style="display: contents; justify-content: flex-end;">
		    	<!-- 채팅 버튼 추가 -->
		   		<jsp:useBean id="presentTime" class="java.util.Date" />
				<fmt:formatDate value="${presentTime}" pattern="yyyy-MM-dd" var="todayTime" />
				<c:if test="${tboard.tripStart <= todayTime}">
						<button type="button" class="reviewPost" id="withEnd" style="background-color: black; color: white;" onclick="EndTrip()">동행 신청 마감</button>
				</c:if>
				<c:if test="${tboard.tripStart > todayTime}">
						<button type="button" class="reviewPost" id="with" onclick="location.href='chat.ch?nickName=${ tboard.nickName }'">동행 신청하기</button>
				</c:if>
		    </div>
	    </div>
	    
		<div class="row mb-2">
		<div class="col-md-12" >
	 		<div class="postInfo">
	    		<div class="row mb-12" id="postInfo2">
	    			<div class="col-md-3">
	    			<label>여행 출발일 | </label>
	    			<p><b>${ tboard.tripStart }</b></p>
	    			<input type="hidden" name="tripStart" value="${ tboard.tripStart }">
	    			</div>
	    			<div class="col-md-3">
	    			<label>여행 도착일 | </label>
	    			<p><b>${ tboard.tripEnd }</b></p>
	    			<input type="hidden" name="tripEnd" value="${ tboard.tripEnd }">
	    			</div>
	    			<div class="col-md-3">
	    			<label>모집 인원 | </label>
	    			<p id="people"><b>${ tboard.partCount }명</b></p>
	    			<input type="hidden" name="partCount" value="${ tboard.partCount }">
	    			</div>
	    		</div>
	    		<div class="row mb-12" id="postWriter">
	    			<div class="col-md-12">
	    			<label>작성자 | </label>
		    			 <p><b class="nickname"><a class="nickname" href="javascript:userPage()">${ tboard.nickName }</a></b></p>
	    			 <input type="hidden" name="nickName" value="${ tboard.nickName }">
	    			 <input type="hidden" id="mNo" name="mNo" value="${ tboard.memberNo }" >
	    			 <script>
	    			
	    			 function userPage(){
	    			    	var form = document.createElement("form");
	    			    	
	    			    	var obj;
	    			    	obj = document.createElement("input");
	    			    	obj.setAttribute("type", "hidden");
	    			    	obj.setAttribute("name", "mNo");
	    			    	obj.setAttribute("value", $('#mNo').val());
	    			    	
	    			    	form.appendChild(obj);
	    			    	form.setAttribute("method", "post");
	    			    	form.setAttribute("action", "travelReview.me");
	    			    	document.body.appendChild(form);
	    			    	form.submit();
	    			    }
	    			 </script>
	    			</div>
	    		</div>
			</div>
	      
	      <!-- 내용 부분 -->
	      	
			<div class="textView">
	        	<textarea style="resize:none;" readonly="readonly" name="content">${ tboard.boardContent }</textarea>
	        	<input type="hidden" name="boardContent" value="${ tboard.boardContent }">
	        </div>
	        <div class="row mb-12" id="postInfo1">
	        	<div class="" id="co0">
	    			<label>${ tboard.preference }</label>
	    			<input type="hidden" name="preference" value="${ tboard.preference }">
	    		</div>
	    		<div id="co1">
	    			<label>게시물번호   </label>
	    			<p>${ tboard.boardId }</p>
	    			<input type="hidden" name="boardId" value="${ tboard.boardId }">
	    		</div>
	    		<div id="co2">
	    			<label>작성일   </label>
	    			<p>${ tboard.modifyDate }</p>
	    			<input type="hidden" name="modifyDate" value="${ tboard.modifyDate }">
	    		</div>
	    		<div id="co3">
	    			<label>조회수   </label>
	    			<p>${ tboard.boardCount }</p>
	    			<input type="hidden" name="boardCount" value="${ tboard.boardCount }">
	    		</div>
	    			
	    	</div>
		</div>
		</div>
	</div>
</form>
<!-- 채팅창 열리게 -->
<script>
	document.getElementById('with').onclick = function(){
	   window.open('chat.ch?nickName=${ tboard.nickName }', '채팅',  'width=1180px, height=800px, resizable=no');
	}

	function EndTrip(){
		alert("동행 마감된 여행입니다.");
	}
	
</script>


  </body>
  <footer class="blog-footer">
    <c:import url="../common/footer.jsp"/>
</footer>
</html>