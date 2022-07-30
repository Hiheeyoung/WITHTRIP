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
              <form action="ginsert.go" method="post" id="detailForm" enctype="multipart/form-data" onsubmit="return writeForm();"> 
                 <table style="color: black; font-weight: bold; width: 1050px;">
                    <header><h2 class="b_title" style="color:#6495ED;">Goods_Sale</h2></header>
                  
                         <tr>
                       	 	<td class="tr_title">용품 카테고리</td>
                            <td class="td_content"> 
                            	<select name="gcateNo" class="form-select" id="gcate" aria-label="Default select example" >
		                            <option selected>판매용품 선택</option>
		                            <option value="1">가방</option>
		                            <option value="2">안전용품</option>
		                            <option value="3">악세사리</option>
	                        	</select>
                            </td>
                         </tr>
	                         
                         <tr>
                            <td class="tr_title">재고</td> 
                             <td class="td_content"> 
                             	<input type="text" onchange="getNumber(this);" onkeyup="getNumber(this);" name="stock" id="gStock" class="inputNum" />
                             </td>
                             <td class="tr_title">Size</td>
                             <td class="td_content" colspan="3">
                               <input type="text" id="goodsSize" name="goodsSize">
                             </td> 
                         </tr>
	                      
                         <tr>
                      		<td class="tr_title">가격</td>
                            <td class="td_content">
                     			<input type="text" onchange="getNumber(this);" onkeyup="getNumber(this);" name="price" id="gPrice" class="inputNum" />
                            </td>
                            <td class="tr_title">Color</td>
                            <td class="td_content" colspan="3">
                               <input type="text" id="goodsColor" name="goodsColor">
                            </td> 
                         </tr>
                         
                         <tr>
                     		<td class="tr_title">제품 명</td>
                            <td class="td_content">
                               <input type="text" id="gTitle" name="goodsName">
                            </td>
                            <td class="tr_title">브랜드</td>
                             <td class="td_content" colspan="3">
                               <input type="text" id="goodsBrand" name="goodsBrand">
                             </td> 
                         </tr>
                         
                    	 <tr>
                         	<td class="tr_title">내용</td>
                            <td colspan="6"><textarea cols="70px" rows="15px" style="resize:none;" name="gContent" id="gContent"></textarea></td>
                         </tr>
	             
	             </table>
                      
			     <!-- 파일 첨부 -->
                 <table id="fileList2">
                   <tr onMouseOver="fileList.clickedRowIndex=this.rowIndex" >
                  	 <td class="file" style="font-size: 14px; width: 120px;">썸네일</td>
                     <td class="file" colspan="9">
                        <input type=file name=fileNm multiple="multiple" id="thumbnail">
                     </td>
                   </tr>
                   <tr onMouseOver="fileList.clickedRowIndex=this.rowIndex" >
                     <td class="file" style="font-size: 14px;">사진</td>
                     <td class="file">
                        <input type=file name=fileNm id="detail">
                     </td>
                   </tr>
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
  

  // 모든 정보가 입력된 후 글 작성
  $('#reviewPost').click(function writeForm(){
	 if($('#gcate').val() == '판매용품 선택') {
		 alert('용품 카테고리를 선택하세요.');
		 $('#gcate').focus(); 
		 return false;
	 } else if($('#gStock').val().trim() == '') {
		 alert('재고를 입력하세요');
		 $('#gStock').focus(); 
		 return false;
	 } else if($('#gPrice').val().trim() == '') {
		 alert('가격을 입력하세요');
		 $('#gPrice').focus(); 
		 return false;
	 } else if($('#gTitle').val().trim() == '') {
		 alert('상품 명을 입력하세요');
		 $('#gTitle').focus(); 
		 return false
	 } else if($('#goodsBrand').val().trim() == '') {
		 alert('상품 브랜드를 입력하세요');
		 $('#goodsBrand').focus(); 
		 return false;
  	 } else if($('#goodsSize').val().trim() == '') {
		 alert('상품 사이즈를 입력하세요');
		 $('#goodsSize').focus(); 
		 return false;
  	 } else if($('#goodsColor').val().trim() == '') {
  		 alert('상품 색상을 입력하세요');
  		 $('#goodsColor').focus(); 
		 return false;
  	 } else if($('#gContent').val().trim() == '') {
		 alert('상품 설명을 입력하세요');
		 $('#gContent').focus(); 
		 return false;
	 } else if($('#thumbnail').val().trim() == '') {
		 alert('썸네일 사진을 첨부하세요');
		 $('#thumbnail').focus(); 
		 return false;
	 } else if($('#detail').val().trim() == '') {
		 alert('상세 사진을 첨부하세요');
		 $('#detail').focus(); 
	 	 return false;
	 }
	 	return true;
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
</html>