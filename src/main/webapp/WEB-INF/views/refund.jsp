<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WITHTRIP :: 함께라서 좋은 여행</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<style>
	.head{ font-weight: bold; color: black; font-size: 20px; }
</style>
</head>
<body style="font-family: 'Noto Sans KR', sans-serif;">
<c:import url="common/navbar.jsp"/>

<div class="col-lg-8 mx-auto p-3 py-md-5">
	<header class="d-flex align-items-center pb-3 mb-5 border-bottom">
	  <a class="d-flex align-items-center text-dark text-decoration-none">
	    <span class="fs-4" style="font-size: 27px; font-weight: bold">취소 및 환불 정책</span>
	  </a>
	</header>
	<div>
		<div class="head">주문 취소 및 반품</div>
		<br>
		<ul>
			<li>일반적으로 소비자는 자신이 체결한 전자상거래 계약에 대해 그 계약의 내용을 불문하고 그 청약철회 및 계약해제의 기간(통상 7일) 내에는 청약철회 등을 자유롭게 할 수 있습니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제1항).</li>
			<li>하지만, 다음 어느 하나에 해당하는 경우에는 인터넷쇼핑몰 사업자의 의사에 반(反)해서 주문 취소 및 반품을 할 수 없습니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제2항 본문 및 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제21조).</li>
				<ol>
					<li>소비자의 잘못으로 물건이 멸실(물건의 기능을 할 수 없을 정도로 전부 파괴된 상태)되거나 훼손된 경우(다만, 내용물을 확인하기 위해 포장을 훼손한 경우에는 취소나 반품이 가능)</li>
					<li>소비자가 사용해서 물건의 가치가 뚜렷하게 떨어진 경우</li>
					<li>시간이 지나 다시 판매하기 곤란할 정도로 물건의 가치가 뚜렷하게 떨어진 경우</li>
					<li>복제가 가능한 물건의 포장을 훼손한 경우</li>
				</ol>
			<li>인터넷쇼핑몰 사업자는 위 2.부터 5.까지의 사유에 해당하여 청약철회 등이 불가능한 상품에 대해 그 사실을 상품의 포장이나 그 밖에 소비자가 쉽게 알 수 있는 곳에 명확하게 적거나 시험 사용 상품을 제공하는 등의 방법으로 청약철회 등의 권리 행사가 방해받지 않도록 조치해야 합니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제6항 본문). 만약 사업자가 이와 같은 조치를 안했다면, 소비자는 청약철회 등의 제한사유에도 불구하고 청약철회 등을 할 수 있습니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제2항 단서).</li>
		</ul>
		<br><hr><br><br>
		
		<div class="head">주문 취소 및 반품 가능 기간</div>
		<br>
		<ul>
			<li>인터넷에서 물품을 주문한 후 7일 이내에는 주문을 취소하거나 반품을 할 수 있습니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제1항).</li>
			<li>재화 등의 내용이 표시·광고의 내용과 다르거나 계약내용과 다르게 이행된 경우에는 그 재화 등을 공급받은 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 주문 취소 및 반품을 할 수 있습니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제3항).</li>
		</ul>
		
		<br><hr><br><br>
		
		<div class="head">물품반환 비용 부담</div>
		<br>
		<ul>
			<li>소비자가 물품 등을 반환하는 데 필요한 비용은 자신이 부담해야 합니다(규제「전자상거래 등에서의 소비자보호에 관한 법률」제18조제9항).</li>
			<li>다만, 물품 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 경우의 반환비용은 사업자가 부담합니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제3항 및 제18조제10항).</li>
		</ul>
		
		<br><hr><br><br>
		
	 	<div class="head">사업자의 상품대금 환급 의무</div>
		<br>
		인터넷쇼핑몰 사업자는 다음의 어느 하나에 해당하는 날부터 3영업일 이내에 이미 지급 받은 물품 등의 대금을 환급해야 합니다. 만약 물건의 대금 환급을 지연하면 그 지연기간에 대해 연 15％의 지연이자를 별도로 지급해야 합니다(규제「전자상거래 등에서의 소비자보호에 관한 법률」 제18조제2항 및 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제21조의3).
		<ul>
			<li>통신판매업자가 재화를 공급한 경우에는 재화를 반환받은 날</li>
			<li>통신판매업자가 용역 또는 디지털콘텐츠를 공급한 경우에는 청약철회 등을 한 날</li>
			<li>통신판매업자가 재화 등을 공급하지 않은 경우에는 청약철회 등을 한 날</li>
		</ul>
		
		<br><br><hr><br>
	</div>
</div>

<c:import url="common/footer.jsp"/>
</body>
</html>