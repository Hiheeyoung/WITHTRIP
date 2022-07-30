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
    <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Grape+Nuts&family=Noto+Sans+KR:wght@300&family=Raleway:wght@100;&family=Titillium+Web&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
    <!-- Custom styles for this template -->
    <link href="resources/css3/admin.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/dd62c289ec.js" crossorigin="anonymous"></script>

    <!-- 탑버튼 -->    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js" integrity="sha512-sW/w8s4RWTdFFSduOTGtk4isV1+190E/GghVffMA9XczdJ2MDzSzLEubKAs5h0wzgSJOQTRYyaz73L3d6RtJSg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
  </head>
  <style>
  body{
  	background: #fafafa !important;
  }
  
.pageRound{
	margin-bottom: 100px;
}
.prdload{
	margin-left: 20%;
	margin-top: 20px;
	margin-bottom: 20px;
	cursor: pointer;
	
}

.prdArea{
	margin-left: 20%;
	width: 700px;
   height: 400px;
	border: 1px solid #eee;
	background : #fff;
	border-radius: 7px;
}
* {
  margin: 0;
  padding: 0;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}


ul { list-style-type: none; }

a {
  color: #b63b4d;
  text-decoration: none;
}


.accordion {
    width: 100%;
    max-width: 384px;
    margin: 30px auto 20px;
    background: none;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 0px;
    margin-left: -16px;
    font-size: 20px;
}

.accordion .link {
  cursor: pointer;
  display: block;
  padding: 15px 15px 15px 42px;
  color: #4D4D4D;
  font-size: 16px;
  font-weight: 700;
  border-bottom: 1px solid #CCC;
  position: relative;
  -webkit-transition: all 0.4s ease;
  -o-transition: all 0.4s ease;
  transition: all 0.4s ease;
}

.accordion li:last-child .link { border-bottom: 0; }

.accordion li i {
  position: absolute;
  top: 16px;
  left: 12px;
  font-size: 18px;
  color: #595959;
  -webkit-transition: all 0.4s ease;
  -o-transition: all 0.4s ease;
  transition: all 0.4s ease;
}

.accordion li.link { color: #000; font-weight: bold; }


#prdnav{
 width: 20rem;
 background-image: linear-gradient(to right, #74ebd5 0%, #9face6 100%);
 border: 1px solid #ddd;
  position : fixed; 
 height : 100%;
 border-bottom-right-radius: 10px;
 color : #000;
}

#myChart{
	max-width : 400px;
	max-height: 300px;
}

.totalArea{
	width: 500px;
    height: 300px;
    border: 1px solid #eee;
    background: #fff;
    border-radius: 7px;
    display: inline-block;
	margin-left: 57.5%;
    margin-top: -26%;
    padding: 50px;
    padding-top: 72px;
    text-align: center;
    position: absolute;
}

#todayTotal{
	font-weight: 700;
	margin-bottom: 100px;
	font-size: 20px;
	color: #4f5d75;
}

#todayWon{
	font-size: 40px;
	font-weight: 900;
	color : #6495ED;
	margin-bottom: 10px;
	font-family: 'Comfortaa', cursive;
}

.cateGrahp{
	width: 700px;
    height: 420px;
    border: 1px solid #eee;
    background: #fff;
    border-radius: 7px;
    display: inline-block;
    margin-left: 20%;
    margin-top: -80px;
    padding: 35px 20px;
    text-align: center;
    position: absolute;
}
#pie-chart{
 max-width: 300px;
 max-height: 300px;
 margin: auto;
 margin-bottom: 20px;
}

#percent{
	background-image: radial-gradient(circle 248px at center, #16d9e3 0%, #30c7ec 47%, #46aef7 100%);
	border-radius: 30px;
	color : #fff;
	width: 160px;
    height: 40px;
    padding: 5px;
	margin: auto;
}

.topten{
	width: 500px;
    height: 530px;
	background-color: #fff;
	border-radius: 7px;
	border: 1px solid #eee;
    position: absolute;
 	margin-left: 57.5%;
    margin-top: -9.4%;
 	color : #000;
}

#firstCol{
	width: 50px;
}
#topten{
	height: 510px;
}

#topten th{
	font-family: 'Comfortaa', cursive;
	text-align: center;
}

#topTableTitle{

text-align: center; width: 500px; color: #4f5d75; font-weight: 900;
}
  </style>
  <body>
  
  <!-- navbar -->
   <c:import url="../common/navbar.jsp"/>
   
 
<!-- sideNav -->
			<nav  id="prdnav">
				<ul id="accordion" class="accordion">
					<li style="text-align: center; color:#000; font-weight: bold; margin-bottom: 30px;">관리자 대시보드</li>
				  <li>
				    <div class="link" onclick="location.href='prdManage.ad';"><i class="fa-solid fa-suitcase-rolling"></i>상품관리</div>
				  </li>
				  <li>
				    <div class="link" style="font-weight: 900; color: #000;" onclick="location.href='orderManage.ad';"  ><i class="fa-solid fa-receipt" ></i>주문관리</div>
				  </li>
				  <li>
				    <div class="link" onclick="location.href='totalManage.ad';" style="margin-bottom: 150px;"><i class="fa-solid fa-arrow-trend-up"></i>통계분석</div>
				  </li>
				</ul>
            </nav> 
        <!-- sideNav -->
        
	<div class="pageRound">
		<div class="prdload">
		        <a onclick="location.href='adminManage.ad';">관리자페이지</a> > <a style="font-weight: bold;" onclick="location.href='prd_manage.ad';">상품관리</a>
		</div>
		<div class="prdArea"> 
			<div>
  				<canvas id="line-chart" width="250" max-height="300" ></canvas>
			</div>
		</div>
	</div>
	<div class="totalArea">
		<a id="todayTotal">금일 매출 현황</a><br>
		<a id="todayWon">
		<c:if test="${totaltoday eq '0'}">
		0
		</c:if>
		<c:if test="${totaltoday ne '0'}">
		${ totaltoday }
		</c:if>
		</a><span style="font-weight: bold; font-size: 25px; color: #4f5d75;">원</span>
		<div id="percent">전일 대비 ${ variance }% 증가</div>
	</div>
	
	<div class="cateGrahp">
		<div>
  			<div class ="piechart"><canvas id="pie-chart" width="250" height="250"></canvas>
  			</div>
		</div>
  			 <a>가방 : ${cate1}, 안전용품  : ${ cate2 }, 악세사리 : ${cate3} </a>
	</div>
	
	<div class="topten" style="papping:">
		<table id="topten">
		<thead>
			<tr>
				<td colspan="2" id="topTableTitle">누적 주문 TOP10</td>
			</tr>
		</thead>
		<tbody>
<!-- 		<tr> -->
<!-- 			<th></th> -->
<!-- 			<td></td> -->
<!-- 		</tr> -->
		</tbody>
		</table>
	</div>
<script>
$(document).ready(function topList(){
		$.ajax({
			url: 'topList.ad',
			success : function(data){
				console.log(data);
				
				$tableBody = $('#topten tbody');
				$tableBody.html('');
				for(var i in data){
					var $tr = $('<tr>');
					var $no = $('<th>').text(1 + parseInt(i));
					var $goodsName = $('<td>').text(data[i].goodsName);
					
					$tr.append($no).append($goodsName);
					$tableBody.append($tr);
					
					console.log($tr);
				}
			},
			error: function(data){
				console.log(data);
			}
		});
	});
	
</script>
<!--  chart.js -->
<script>
new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
      labels: ["가방", "안전용품", "악세사리"],
      datasets: [{
        backgroundColor: ["#ff1b8d", "#ffd900","#1bb2ff"],
        data: ['${cate1}' , '${cate2}', '${cate3}']
      }]
    },
    options: {
      title: {
        display: true,
        text: '카테고리별 주문건수'
      }
    }
});
</script>
<script>

$(document).ready(function(){
	
	let amount = [];
	let month = [];
	
	$.ajax({
		url : "monthamount.ad",
		success : function(data){
			
			for(var i in data){
				amount.push(data[i].amount);
				month.push(data[i].month);
			}
			
			new Chart(document.getElementById("line-chart"), {
			    type: 'line',
			    data: {
			      labels: month,
			      datasets: [{
			   	  label : '매출액',
		    	  borderColor: "#ff4d6d",
		          backgroundColor: "#ffa7b7",
		          data: amount,
		      }]
		    },
		    options: {
		      title: {
		        display: true,
		        text: '월별 매출액'
		      }
		      }
		});
		},
		
		error : function(data) {
			
		}
	})
});
</script>
<script>
// 결제금액에 콤마 찍기
$(document).ready(function(){
//    console.log(typeof ${g.price});
   var totaltoday = ${ totaltoday};
   var totaltodayComma = totaltoday.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
$("#todayWon").text(totaltodayComma);
});
</script>
</body>
</html>