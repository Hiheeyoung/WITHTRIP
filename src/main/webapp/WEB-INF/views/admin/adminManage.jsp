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

#result{
	text-align: center;
	font-weight: bold;
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
                    <a class="nav-link js-scroll-trigger" href="adminManage.ad" style="color :#fff;">회원 관리</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="adminReport.ad">신고 목록</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="noticePost.ad" style="margin-bottom: 150px;">작성글 관리</a>
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
   	<input type="checkbox"  checked="checked"><label>회원 관리</label>
        <!-- 검색 창-->
            <div class="search_section">
                <div class="boxContainer">
                        	<form action="adminSearch.ad" method="post" id="searchform">
                    <table class="elementscontainer">
                        <tr>
                            <td style="width: 200px; border-bottom: none;">
                                <input type="search" class="search" placeholder="회원 이메일 검색" id="searchValue" name="searchValue">
                            </td>
                            <td style="border-bottom: none; padding-top: 0px;">
                                <a onclick="searchMember();" id="search"><i style="padding: 0px;"class="fa-solid fa-magnifying-glass"></i></a>
                            </td>
                        </tr>
                    </table> 
                            </form>
                </div>
                <!-- 회원 카운트 -->
                    <div id="member_count">
                   	<c:if test="${ searchValue eq null }">
                        <input id="member_input" type="text" value="전체 회원 수 : ${ pi.listCount }" readonly>
                    </c:if>
                   	<c:if test="${ searchValue ne null }">
                   	 	<input id="member_input" type="text" value="검색 된 회원 수 : ${ pi.listCount }" readonly>
                   	</c:if>
                    </div>
                <!-- 회원 카운트 -->
            </div>
        <!-- 검색 창-->
        
    <!-- 버튼 디자인 샘플 -->
   	    <!-- <button id="reviewPost"></button> -->
    <!-- 버튼 디자인 샘플 -->

    <div class="table-responsiveM">
        <table class="admin_table">
            <thead>
                <tr>
                	<th scope="col">이메일</th>
                    <th scope="col">이름</th>                    
                    <th scope="col">닉네임</th>                    
                    <th scope="col">가입일</th>
                    <th scope="col">신고 카운트</th>
                    <th scope="col">계정 상태</th>
                    <th scope="col">관리</th>                                               
                </tr>
            </thead>
            <tbody>
            <c:if test="${ pi.listCount eq '0' }">
			<td colspan="7" style="border-bottom: 1px solid #dbdbdb;">조회된 결과가 없습니다.</td>
			</c:if>
			<c:if test = "${ pi.listCount ne '0' }">
            <c:forEach var="m" items="${ list }">
                <tr class="bg-blue">
                    <td>${ m.email }</td>
                    <td>${ m.userName }</td>
                    <td>${ m.nickName }</td>
                    <td>${ m.enrollDate }</td>
                    <c:choose>
					<c:when test="${ m.userStatus eq 'N'}">
                    <td class="report_count"><a style="color: #979dac;">${ m.reportCount }</a></td>
                    </c:when>
                    <c:when test="${ m.userStatus ne 'N'}">
                    <td class="report_count">${ m.reportCount }</td>
                    </c:when>
                    </c:choose>
                    <td class="member_status">
                   	<c:choose>
                    	<c:when test="${ m.userStatus eq 'Y' }">
                    	 정상
                    	</c:when>
                    	<c:when test="${ m.userStatus eq 'S' }">
                    	 <a style="color: red; font-weight: bold;">정지</a>
                    	</c:when>
                    	<c:when test="${ m.userStatus eq 'N' }">
                    	  <a style="color: #979dac;"> 탈퇴</a>
                    	</c:when>
                    </c:choose>
                    </td>
                    <td>
                    <c:if test="${ m.userStatus eq 'Y' }">
                    <button class="suspend_button"  value="${ m.email }">정지</button>
                    </c:if>
                    <c:if test="${ m.userStatus eq 'S' }">
                    <button class="unlock_button"  value="${ m.email }">해제</button>
                    </c:if>
                    <c:choose>
                    <c:when test="${ m.userStatus ne 'N' }">
                    &nbsp;&nbsp;&nbsp;<button class="leave_button" value="${ m.email }">탈퇴</button>
                    </td>
                    </c:when>
                    <c:when test="${ m.userStatus eq 'N' }">
                    </c:when>
                    </c:choose>
                </tr>
            </c:forEach>
            </c:if>
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
                     		<c:if test="${ searchValue ne null }">
                     			<c:param name="searchValue" value="${ searchValue }"/>
                     		</c:if>
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
                     		<c:if test="${ searchValue ne null }">
                     			<c:param name="searchValue" value="${ searchValue }"/>
                     		</c:if>
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
                     	<c:if test="${ searchValue ne null }">
                     		<c:param name="searchValue" value="${ searchValue }"/>
                     	</c:if>
                     	</c:url>
                     	<li><a href="${ after }" id="paging">&gt;</a></li>
					</c:if>
                     </ul>
                   </div>
                 </div>
               </div>
</div>
    
<!-- 모달창 start -->
    <div class="modal_suspend hidden">
        <div class="bg"></div>
        <div class="modalBox">
            <div><hr class="modal_line"></div>
            <div class="modal_content">
            <div id="sTest" style="color:#6495ED;"></div>해당 계정을 정지 처리 하시겠습니까?</div>
            <div><hr class="modal_line"></div>
            <div class="modal_button">
                <button type="submit" onclick="location.href='adminManage.ad';" id="suspendM">Y</button>
                <button class="closeBtn">N</button></div>
            </div>
    </div>


    <div class="modal_leave hidden">
        <div class="bg"></div>
        <div class="modalBox" style="height: 300px;">
            <div><hr class="modal_line"></div>
            <div class="modal_content">
            <div id="nTest" style="color:#6495ED;"></div>해당 계정을 탈퇴 처리 하시겠습니까?<br><span style="color:red; font-size: 13px;">(탈퇴 시 복구가 불가능합니다.)</span></div>
            <div><hr class="modal_line"></div>
            <div class="modal_button">
                <button type="submit" onclick="location.href='adminManage.ad';" id="deleteM">Y</button>
                <button class="closeBtn">N</button></div>
            </div>
    </div>
    
    <div class="modal_unlock hidden">
        <div class="bg"></div>
        <div class="modalBox">
            <div><hr class="modal_line"></div>
            <div class="modal_content">
            <div id="uTest" style="color:#6495ED;"></div>해당 계정의 정지를 해제 하시겠습니까?</div>
            <div><hr class="modal_line"></div>
            <div class="modal_button">
                <button type="submit" onclick="location.href='adminManage.ad';" id="unlockM">Y</button>
                <button class="closeBtn" onclick="location.href='javascript:history.go(0)'">N</button></div>
            </div>
    </div>
    <script>
        /* 회원 정지 & 회원 탈퇴 */
        const open_suspend = () => {
            document.querySelector(".modal_suspend").classList.remove("hidden");
        }
        
        const open_leave = () => {
            document.querySelector(".modal_leave").classList.remove("hidden");
        }
        
        const open_unlock = () => {
            document.querySelector(".modal_unlock").classList.remove("hidden");
        }
        
        const close = () => {
            document.querySelector(".modal_suspend").classList.add("hidden");
            document.querySelector(".modal_leave").classList.add("hidden");    
            document.querySelector(".modal_unlock").classList.add("hidden");    
        }

        let report_button = document.querySelectorAll(".suspend_button");
        let leave_button = document.querySelectorAll(".leave_button");
        let unlock_button = document.querySelectorAll(".unlock_button");
        let close_button = document.querySelectorAll(".closeBtn");
        let bg = document.querySelectorAll(".bg");

//         console.log(bg);
        // console.log(close_button.length);
        // console.log(report_button.length);
		for(i = 0; i < report_button.length; i++) {
            if(report_button[i].click || leave_button[i].click) {
                report_button[i].addEventListener("click", open_suspend);
                leave_button[i].addEventListener("click", open_leave);
                for(j = 0; j < close_button.length; j++) {
                    close_button[j].addEventListener("click", close);
                    // document.querySelector(".closeBtn").addEventListener("click", close);
                }
                for(p = 0; p < bg.length; p++) {
                    bg[p].addEventListener("click", close);
                }

					
            }
        }
		for(i = 0; i < unlock_button.length; i++) {
            if(unlock_button[i].click) {
                unlock_button[i].addEventListener("click", open_unlock);
                for(j = 0; j < close_button.length; j++) {
                    close_button[j].addEventListener("click", close);
                    // document.querySelector(".closeBtn").addEventListener("click", close);
                }
                for(p = 0; p < bg.length; p++) {
                    bg[p].addEventListener("click", close);
                }

					
            }
        }
    </script>
<!-- 모달창 end -->
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
<!-- report 회원 관련 -->
    <script>
        let rTd =  document.getElementsByClassName("report_count");
        // console.log(rTd);
        for(i = 0; i < rTd.length; i++) {
        // console.log(rTd[i].innerHTML == 3);
            if(rTd[i].innerHTML == 3) {
                rTd[i].style.color = 'red';
                rTd[i].style.fontWeight = 'bold';
            }
        }
    </script>  
    
    <script>
    function searchMember() {
    	var searchValue = $("#searchValue").val();
    	
    	location.href="adminSearch.ad?&searchValue=" + searchValue;
    	$('#searchform').submit();
    }
    </script>
    <!-- 회원 정지 -->
    <script>
    $(".suspend_button").on("click", (e) => {
    	var mEmail = e.target.value;
    	
    	const element = document.getElementById('sTest');
    	element.innerText = mEmail;
    	
    	$("#suspendM").on('click', function() {
       		$.ajax({
       			url :"suspendMember.ad",
       			data : {mId:mEmail},
       			type : 'post',
       			success : function(data){
       				location.href='adminManage.ad';
       			},
       			error: function(data){
       				console.log(data);
       			}
       		});
        });
    });
    </script>
    <!-- 회원 삭제 -->
    <script>
    $(".leave_button").on("click", (e) => {
    	var mEmail = e.target.value;
    	
    	const element = document.getElementById('nTest');
    	element.innerText = mEmail;
    	
    	$("#deleteM").on('click', function() {
       		$.ajax({
       			url :"deleteMember.ad",
       			data : {mId:mEmail},
       			type : 'post',
       			success : function(data){
       				location.href='adminManage.ad';
       			},
       			error: function(data){
       				console.log(data);
       			}
       		});
        });
    });
    </script>
    
    <!-- 회원 정지 해제 -->
    <script>
    $(".unlock_button").on("click", (e) => {
    	var mEmail = e.target.value;
    	
    	const element = document.getElementById('uTest');
    	element.innerText = mEmail;
    	
    	$("#unlockM").on('click', function() {
       		$.ajax({
       			url :"unlockMember.ad",
       			data : {mId:mEmail},
       			type : 'post',
       			success : function(data){
       				location.href='adminManage.ad';
       			},
       			error: function(data){
       				console.log(data);
       			}
       		});
        });
    });
    </script>

<!-- footer -->
	<c:import url="../common/footer.jsp"/>
  </body>
</html>
