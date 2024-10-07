<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>판매자 마이페이지</title>
<link rel="stylesheet" href="../css/myPage.css">
<div class="header_continer"><%@ include file="../header_white.jsp"%></div>
<div class="menu_continer"><%@ include file="../menu_S.jsp" %></div>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript"><%@ include file="../kakao.jsp" %></script>
</head>



<script type="text/javascript">
</script>
<style>
.chu_carList {
	width : 100%;
	display:flex;
	flex-direction: column;
	align-items: flex-start;
	justify-content:flex-start;
	margin: 0 auto;
}

.chu-img {
	width: 253.333px;
	height: auto;
	margin: 0;
}
.chu-body {
	align-items: center;
	margin: 0px;
}

.chu-body img {
	margin-right: 10px;
}

.chu-title {
	font-size: 18px;
	max-width: 200px;
	word-wrap: break-word;
}

.chu-title, .chu-text {
	margin: 10px 0px;
}

.chu-text {
	font-size: 21px;
}

.chu_img_banner {
	margin: 0px;
	width: 400px;
	height: auto;
}

.chu_body_all {
	margin: 10px 0px;
	word-wrap: break-word;
}
table.panmae-jung th,
table.panmae-jung td {
	border-left: none;
	border-right: none;
	padding :10px;
}
</style>

<body>
	<div class="container">
		<main class="content">
			<h1>마이페이지</h1>
			<h5>판매자의 마이페이지</h5>
			<div class="block">
				[판매중인 차량]
				<br>
				<br>
				<table class="panmae-jung">
					<thead>
						<tr>
							<th>매물번호</th>
							<th>판매차량</th>
							<th>차종</th>
							<th>모델</th>
							<th>차량번호</th>
							<th>주행거리</th>
							<th>색상</th>
						</tr>
					</thead>
					<tbody>	
						<c:forEach var="Car_General_Info" items="${Car_General_Info}">							
							<tr>
								<td>${Car_General_Info.sell_num}</td>
								<!-- 차량 정보 출력 -->
								<td>
            						<div class="chu_carList">
                						<a href="/carInfo?sellNum=${Car_General_Info.sell_num}&id=${Car_General_Info.user_id}">
                    					<img alt="chuCarimg" src="../images/main/377조7542_1.png" class="chu-img">
                    						<div class="chu_body_all">
                        						<div class="chu-body">
						                            <img alt="구매대기중" src="../images/main/Waitingforpurchase.png">
						                            <p class="chu-title">${Car_General_Info.model}</p> <!-- Zzim에 모델이 포함된 경우 -->
                        						</div>
                        						<p class="chu-text"><b>${Car_General_Info.price}</b> 만원</p> <!-- Zzim에 가격이 포함된 경우 -->
                   							 </div>
                						</a>
            						</div>
        						</td>
								<td>${Car_General_Info.car_type}</td>	
								<td>${Car_General_Info.model}</td>
								<td>${Car_General_Info.car_num}</td>
								<td>${Car_General_Info.mileage}</td>
								<td>${Car_General_Info.color}</td>
							</tr>		
						</c:forEach>
					 </tbody>
				</table>
			</div>
		</main>
</div>
	<!------------------------------------------ 푸터 -------------------------------------------->
	<%@ include file="../footer.jsp" %>
</body>
</html>