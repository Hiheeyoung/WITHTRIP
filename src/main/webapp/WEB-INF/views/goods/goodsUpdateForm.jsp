<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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

</head>

<body class="sub_page">

<c:import url="../common/navbar.jsp"/>

<section class="trip_section layout_padding">
   <div class="container">
      <div class="heading_container heading_center"></div>
            
	  <!-- 사용할 부분 board list 시작-->
      <div class="detail_outer"> 
        <br>
            <div class="table-area">
              <form action="gupdate.go" method="post" id="detailForm" enctype="multipart/form-data"> 
                
                <table style="color: black; font-weight: bold;">
                    <header><h2 class="b_title" style="color:#6495ED;">Goods_Sale</h2></header>
                  
                      <tr> 
                        <td class="tr_title">용품 카테고리</td>
                        <td class="td_content">
							<input type="hidden" name="goodsId" value="${ goods.goodsId }">
							<input type="hidden" name="page" value="${ page }">
	                           
                            <select name="gcateNo" class="form-select" aria-label="Default select example" >
                              <option>판매용품 선택</option>
	                            <c:if test="${ goods.gcateNo == 1 }">             
	                              <option value="1" selected>가방</option>
	                              <option value="2">안전용품</option>
	                              <option value="3">악세사리</option>
	                            </c:if>
	                            <c:if test="${ goods.gcateNo == 2 }">   
	                              <option value="1">가방</option>
	                              <option value="2" selected>안전용품</option>
	                              <option value="3">악세사리</option>
	                            </c:if>
	                            <c:if test="${ goods.gcateNo == 3 }">
	                              <option value="1">가방</option>
	                              <option value="2">안전용품</option>
	                              <option value="3" selected>악세사리</option>
	                            </c:if>    
                           </select>
                        </td>
                      </tr>
                         
                      <tr>
                        <td class="tr_title">재고</td> 
                        <td class="td_content"> 
                          <input type="text" onchange="getNumber(this);" onkeyup="getNumber(this);" name="stock" id="ssMaxPrice" class="inputNum" value="${ goods.stock }"/>
                        </td>
                      
                      	<!-- 추가 -->
                   		<td class="tr_title">Size</td>
                   		<td class="td_content">
                   			<input type="text" id="goodsSize" name="goodsSize" value="${ goods.goodsSize }">
                   		</td>
                   	  </tr>
                      
                      <tr>
                    	<td class="tr_title">가격</td>
                        <td class="td_content" >
                   			<input type="text" onchange="getNumber(this);" onkeyup="getNumber(this);" name="price" id="ssMaxPrice" class="inputNum" value="${ goods.price }"/>
                        </td>
                        <!-- 추가 -->
                  		<td class="tr_title">Color</td>
                  		<td class="td_content" colspan="3">
                  			<input type="text" id="goodsColor" name="goodsColor" value="${ goods.goodsColor }">
                  		</td>
                  	  </tr>
                      
                      <tr>
                   		<td class="tr_title">제품 명</td>
                         <td class="td_content">	<!--  colspan="10" -->
                            <input type="text" id="q_Title" name="goodsName" value="${ goods.goodsName }">
                         </td>
                  	
                  		<td class="tr_title">브랜드</td>
                  		<td class="td_content" colspan="3">
                  			<input type="text" id="goodsBrand" name="goodsBrand" value="${ goods.goodsBrand }">
                  		</td>
                  	  </tr>
                     
                      <tr>
                         <td class="tr_title">내용</td>
                         <td colspan="6"><textarea cols="70px" rows="15px" style="resize:none;" name="gContent">${ goods.gContent }</textarea></td>
                      </tr>
                </table>
                     
                     
                     
                      <!-- 파일 첨부 test -->
				      <table id="fileList2">
				        <c:forEach var="i" begin="0" end="${ fileList.size() }">
		                   <c:if test="${ fileList[i] != null && !empty fileList[i] }">
	                         <tr onMouseOver="fileList.clickedRowIndex=this.rowIndex" >
	                      	   <c:if test="${ fileList[i] == fileList[0] }">
			                      <td class="file" id="f1" style="font-size: 14px;">썸네일</td>
			                   </c:if>
			                   
			                    <c:if test="${ fileList[i] != fileList[0] }">
			                        <td class="file" id="f1" style="font-size: 14px;">사진</td>
			                    </c:if>
			                         
		                        <td class="file">
		                        	<input type=file name=reUploadFiles multiple="multiple">
		                        	<br>현재 업로드한 파일 : 
									<a href="${ contextPath }/resources/guploadFiles/${ fileList[i].changeName }" download="${ fileList[i].originName }">
										${ fileList[i].originName }
									</a>
								
									<!-- 기존에 저장되어있던 파일 view로 넘기기(새 파일을 업로드 했을 때 기존 파일 삭제를 위해) --> 
									<input type="hidden" name="originalFile" value=${ fileList[i].changeName }>
			                    </td>
	                        </tr>
		                   </c:if>  
	                    </c:forEach>
                      </table> 
                     
                  <br><br>
                  
                      <div class="row md-2 mt-2 mb-2">
                         <div class="col md-2" id="btnSubmit">
                            <button type="submit" id="reviewPost" style=" display: inline-block;">등록</button>
                            <button type="button" id="reviewPost" style=" display: inline-block;" onclick="location.href='glist.go'">취소</button>
                         </div>
                      </div>
         	  </form>   
          </div>   
      </div>
	</div>
</section>

 <script>
  //천자리 콤마 찍기
  var rgx1 = /\D/g;  // /[^0-9]/g 와 같은 표현
  var rgx2 = /(\d+)(\d{3})/;

  function getNumber(obj){
     var num01;
     var num02;
     num01 = obj.value;
     num02 = num01.replace(rgx1,"");
     num01 = setComma(num02);
     obj.value =  num01;
  }

  function setComma(inNum){
     var outNum;
     outNum = inNum;
    while (rgx2.test(outNum)) {
        outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
     }
     return outNum;
  }

  $(function(){
   $(".inputNum").each(function(){
     getNumber(this);
   });
  });
  
 </script>
  
  
  
  
  
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
  <script src="<%=request.getContextPath() %>/resources/js5/Review-writeForm.js"></script>
  <!-- jQery -->
  <script src="<%=request.getContextPath() %>/resources/js5/jquery-3.6.0.min.js"></script>
  
  
  <c:import url="../common/footer.jsp"/>
  
  </body>
  <footer class="blog-footer">
</footer>
</html>