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
<style>
.block{
	display:flex;
	align-items: flex-start;
	padding:100px;
}

th, td{
	background-color: white;
	border: none;
}
.chu-img {
	padding-left:100px;
	width:600px;
	height: auto;
	margin: 0;
}
.gumaeCar td{
	margin-right: 0;
	text-align: right;
	color: #e95a21;
}
.right-block{
	margin-right: 0;
	text-align: right;
	color: #e95a21;
}


</style>
<body>
	<div class="container">
		<main class="content">
			<h1 class="text-center"><a href="#">차량판매 상세내역</a></h1><br><br>
			<div class="block">
				<div class ="left-block">
					<table class="gumae">
						<tr><th>계약번호 : <td>${Payment.approval_num}</td></th></tr>
						<tr><th>계약완료일 : <td>${Payment.approval_date}</td></th>						
						<tr><th>모델명 : <td>${Payment.model}</td></th></tr>
						<tr><th>외장색상 : <td>${Payment.color}</td></th></tr>			
						<tr><th>결제금액 : <td>${Payment.price}</td></th></tr>
						<tr><th>판매자 : <td>${Payment.receiver_name}</td></th></tr>
						<tr><th>진행상황 : <td style="color: red">판매 완료</td></th></tr>	
					</table>
				</div>
		
				<div class="right-block">
					<table class="gumaeCar">									
						<tr><td>${Payment.approval_date} 차량판매 완료</td></tr>					
						<tr>
                    		<td><img alt="chuCarimg" src="../images/main/377조7542_1.png" class="chu-img"></td>
            			</tr>
        				
        				<tr><td><a href="" onclick="window.open('/view_jw/csQna','_blank', 'width=600, height=800'); return false;">
							문의하기 ></a></td></tr>	
					</table>
				</div>
			</div>				
</main>
</div>
	<!--------------------------------------- 푸터 --------------------------------------->
	<%@ include file="../footer.jsp" %>
</body>
</html>