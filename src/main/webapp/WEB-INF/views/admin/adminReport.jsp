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

   
    <!-- Custom styles for this template -->
    <link href="resources/css3/admin.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/dd62c289ec.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!-- 탑버튼 -->    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	

  </head>
  <script>
  $(document).ready(function(){
	  $(".homecontent").slideDown();
	  
  });
  </script>
  <style>
  .reprotCate{
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
 	.homeModalBack{ 
 		top :0; left: 0; z-index: 1000; width: 100%; height: 100%; 
 		background-color: rgba(0,0,0,0.8); 
 		
 	} 
	#popupbox{
		position: absolute;
     	top: -5%; left: 80%;  
    	width:300px; height: 150px;
    	background-color : #fef9ef;
    	border: 2px solid #ffcb77;
    	border-radius : 10px;
		transform : translate(-50%, -50%); 
		z-index: 1002; box-sizing: border-box; 
		box-shadow: 5px 5px 5px  rgba(0,0,0,0.35);
		transition: all .4s ease;
		-webkit-animation-name: movingPara;
			-webkit-animation-duration: 2s;
			animation-name: movingPara;
			animation-duration: 2s;
			animation-fill-mode: forwards;
	}
		@-webkit-keyframes movingPara {
			from { margin-bottom: 100%; }
			to { margin-top: 11%; }
		}
		@keyframes movingPara {
			from { margin-bottom: 100%; }
			to { margin-top: 11%; }
		}
	.homecontent{
		padding: 20px; line-height: 1rem; color: #000; text-align: center;
		font-family: 'Noto Sans KR', sans-serif;
	}
	#mdclose{
		width: 80px; height: 30px;
		background-color: #ffcb77;
		padding: 5px;
		cursor: pointer;
		border-radius: 10px; 
		text-align: center;
		margin: auto;
		margin-top: 15px;
	}
	
	#alertImg{
		width: 45px;
		height: 45px;
		margin-left: -40px;
	}
	
	#repoCount{
		color : #fe6d73;
		font-weight: bold;
	}
  </style>
  <body id="page-top">
  
  
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
                    <a class="nav-link js-scroll-trigger" href="adminReport.ad" style="color :#fff;">신고 목록</a>
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
<!-- 모달창 -->
 <div class="homeModalBack">
 <div id ="popupbox">
 	<div class ="homecontent">
 	<img id="alertImg"src="https://cdn-icons-png.flaticon.com/512/1827/1827314.png">
 	<a>신규 신고접수가 <br><span id="repoCount">${ pi.listCount }</span>건 도착했습니다</a>
	<div id="mdclose" onclick="toClose();">닫기</div>
 	</div>
 	</div>
 </div>

<div class="container rounded mt-5 bg-white p-md-5" id="content_container">
	<!-- 페이지 타이틀 -->
   	<input type="checkbox"  checked="checked"><label>신고 목록</label>
        <!-- 검색 창-->
            <div class="search_section">
                <div class="boxContainer_none">
                    <table class="elementscontainer">
                        <tr>
                            <td style="width: 200px; border-bottom: none;">
                                <!-- <input type="text" placeholder="회원 아이디 검색"
                                class="search"> -->
                            </td>
                            <!-- <td style="border-bottom: none;">
                                <a href><i class="fa-solid fa-magnifying-glass"></i></a>
                            </td> -->
                        </tr>
                    </table> 
                </div>
                <!-- 회원 카운트 -->
                    <div id="member_count">
                        <input id="member_input" style="margin-right: -90px;"type="text" value="미처리 신고 내역 : ${ pi.listCount }건" readonly>
                    </div>
                <!-- 회원 카운트 -->
            </div>
        <!-- 검색 창-->
        
    <!-- 버튼 디자인 샘플 -->
   	    <!-- <button id="reviewPost"></button> -->
    <!-- 버튼 디자인 샘플 -->

    <div class="table-responsiveR">
        <table class="admin_table">
            <thead>
                <tr>
                	<th scope="col" class="report_bId" style="width: 85px;">신고 번호</th>
                    <th scope="col" style="width: 120px;">신고 분류 번호</th>                    
                    <th scope="col" class="report_content" >신고 내용</th>                    
                    <th scope="col" style="width: 100px;">신고날짜</th>
                    <th scope="col" style="width: 180px">신고회원</th>
                    <th scope="col" class="reported" style="width: 180px">신고대상</th>                                             
                    <th scope="col" style="width: 85px;">접수 여부</th>
                    <th scope="col" style="width: 85px;">신고 처리</th>                                             
                </tr>
            </thead>
            <tbody>
             <c:forEach var="r" items="${ list }">
                	<tr class="bg-blue">
                    <td class="report_id">${ r.report_id }</td>
                    <c:choose>
                    <c:when test="${ r.rcate_no eq '1'}">
                    <td class="reprotCate" >도배</td>
                    </c:when>
                    <c:when test="${ r.rcate_no eq '2' }">
                    <td class="reprotCate" >광고/홍보</td>
                    </c:when>
                    <c:when test="${ r.rcate_no eq '3' }">
                    <td class="reprotCate" >욕설</td>
                    </c:when>
                    <c:when test="${ r.rcate_no eq '4' }">
                    <td class="reprotCate">기타</td>
                    </c:when>
                    </c:choose>
                    <c:choose>
                    <c:when test="${ empty r.report_content }">
                    <td class="report_content">-</td>
                    </c:when>
                    <c:when test="${ not empty r.report_content }">
                    <td class="report_content">${ r.report_content }</td>
                    </c:when>
                    </c:choose>
                    <td>${ r.report_date }</td>
                    <td>${ r.report_user }</td>        
                    <td class="reported">${ r.target_user }</td>
                    <td class="report_accept">${ r.report_yn }</td>
                    <td><button class="report_button" value="${ r.report_id }">신고</button></td>
                </tr>
                </c:forEach>
           </tbody>
        </table>
    </div>


    <div class="row mt-5">
                 <div class="col text-center">
                   <div class="block-27" style="margin-left: 160px;">
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


<!-- 모달창 -->
    <div class="modal_report hidden">
    <div class="bg"></div>
    <div class="modalBox">
        <div><hr class="modal_line"></div>
        <div class="modal_content"><div id="rTest" style="color:#6495ED;"></div>해당 신고를 처리 하시겠습니까?</div>
        <div><hr class="modal_line"></div>
        <div class="modal_button"><button type="submit" onclick="location.href='adminReport.ad';" id="reportM">Y</button><button class="closeBtn">N</button></div>
        
    </div>
    </div>

    <script>
    const open = () => {
        document.querySelector(".modal_report").classList.remove("hidden");
    }

    const close = () => {
        document.querySelector(".modal_report").classList.add("hidden");
    }

    let report_button = document.querySelectorAll(".report_button");
    let close_button = document.querySelectorAll(".closeBtn");
    // console.log(close_button.length);
    // console.log(report_button.length);
    for(i = 0; i < report_button.length; i++) {
        if(report_button[i].click) {
            report_button[i].addEventListener("click", open);
            for(j = 0; j < close_button.length; j++) {
                close_button[j].addEventListener("click", close);
                // document.querySelector(".closeBtn").addEventListener("click", close);
            }
            document.querySelector(".bg").addEventListener("click", close);
        }
    }

    </script>
<!-- 모달창 -->



</body>
	
    <!-- Bootstrap core JavaScript -->
    <script src="../../resources/vendor3/jquery/jquery.min.js"></script>
    <script src="../../resources/vendor3/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="../../resources/vendor3/jquery-easing/jquery.easing.min.js"></script>


    <!-- 접수 여부가 'N'인 경우, 빨강색으로 -->
    <script>
        let aTd =  document.getElementsByClassName("report_accept");
        // console.log(aTd);
        for(i = 0; i < aTd.length; i++) {
        // console.log(aTd[i].innerHTML == 'N');
        // console.log(aTd[i] === "N");
            if(aTd[i].innerHTML == 'N') {
                aTd[i].style.color = 'red';
                aTd[i].style.fontWeight = 'bold';
            }
        }
    </script>          
    
    <!-- 신고 접수  -->   
	<script>
    $(".report_button").on("click", (e) => {
    	var rId = e.target.value;
    	
    	const element = document.getElementById('rTest');
    	element.innerText = rId;
    	
    	$("#reportM").on('click', function() {
       		$.ajax({
       			url :"reportTake.ad",
       			data : {rId:rId},
       			type : 'post',
       			success : function(data){
       				location.href="adminReport.ad";
       			},
       			error: function(data){
       				console.log(data);
       			}
       		});
				$.ajax({
	       			url : "addCount.ad",
	       			data : {rId:rId},
	       			type : 'post',
	       			success : function(data){
	       				location.href="adminReport.ad";
	       			},
	       			error : function(data){
	       				console.log(data);
	       			}
	       		});
    	});
    	
    	
    });

	</script>
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

function toClose(){
	$(".homeModalBack").css("display", "none");
	document.getElementsByClassName("homeModalBack").style.display = "none";
}
</script>

<!-- footer -->
	<c:import url="../common/footer.jsp"/>
	

  </body>

</html>
    