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

<title>Notice</title>

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css5/bootstrap.css" />

<!--owl slider stylesheet -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<!-- nice select  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
<!-- font awesome style -->
<link href="<%=request.getContextPath() %>/css5/font-awesome.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath() %>/css5/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="<%=request.getContextPath() %>/css5/responsive.css" rel="stylesheet" />
<style>
#ntitle{
width: 100px;
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
      		 <h2 class="b_title" style="color:#6495ED;">Notice_rewrite</h2>
  				<form action="nUpdate.no" method="post" id="updateForm" >
					<table style="color: black; font-weight: bold;">
<!--                     	<tr> -->
<!--                     	 <td class="tr_title" id="ntitle" width="200px;">고정 여부</td> -->
<!--                     	 <td class="td_content" colspan="20"> -->
<!-- 						<select class="custom-select mr-3" id="fixselect" name="fix" required> -->
<!-- 							 <option value="0" selected>비고정</option> -->
<!-- 							 <option value="1">고정</option> -->
<!-- 						</select> -->
<!-- 						</td> -->
<!--                     	</tr> -->
	    				<tr>
	                          <td class="tr_title">제목</td>
	                          <td class="td_content" colspan="10">
	                            <input type="text" id="q_Title" name="noticeTitle" value="${ notice.noticeTitle }">
	                            
	                          &emsp;&emsp;<input class="form-check-input" type="checkbox" id="flexCheckChecked" name= "fix" value="${ notice.fix }">
	                          
	                           		<label class="form-check-label" for="flexCheckChecked">
						   			 고정
						 			</label>
	                          </td>
	                          
	                      </tr>
	                      <tr>
	                          <td colspan="6">
	                          <textarea cols="70px" rows="100px" style="resize:none;" name="noticeContent" >${ notice.noticeContent }</textarea>
	                          </td>
	                      </tr>
                      </table>
							<input type="hidden" name="email" value="${ loginUser.email }" readonly>
							<input type="hidden" name="page"  value="${ page }">
							<input type="hidden" name="noticeId" value="${ notice.noticeId }" readonly>
                     		
<!-- button area -->
						<br><br>
                        <div class="row md-2 mt-2 mb-2">
                        	<div class="col md-2" id="btnSubmit">
                        		<button type="submit" id="reviewPost" style=" display: inline-block;">수정</button>
                        		<button type="button" id="reviewPost" style=" display: inline-block;" onclick="location.href='javascript:history.go(-1)'" >취소</button>
                        	</div>
                        </div>
                        
                    </form>
                  </div>   
              </div>
        </div>
      </section>

  <!-- end about section -->

<!-- footer section -->
<br><br><br><br>
<c:import url="../common/footer.jsp"/>
<!-- footer section -->


<script src="<%=request.getContextPath() %>resources/js5/Review-writeForm.js"></script>

<!-- jQery -->
<script src="<%=request.getContextPath() %>resources/js5/jquery-3.4.1.min.js"></script>
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

<script>
		$('#flexCheckChecked').click(function(){
			var checked = $('#flexCheckChecked').is(':checked');
			var fix = $('#flexCheckChecked').val();
			console.log(fix);
			if(checked == true){
				fix = "1";
				console.log(fix);
			}else{
				fix = "0";
				console.log(fix);
			}
			
		});




</script>



</body>
</html>