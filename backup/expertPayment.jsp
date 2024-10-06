<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<%-- <link href="<%=request.getContextPath()%>/css/expertPayment.css" rel="stylesheet"> --%>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">
/*
table, th, td, div {
	border: 1px solid black;
	border-collapse: collapse;
}
*/

body {
	text-align: center;
	align-items: center; 		/* 수평 중앙 정렬 */
	margin: 0;
	padding: 0;
	background-color: #fafafa;
	font-family: Pretendard;
}

#fullBody {
	width: 700px;
	height: 1083px;
	margin: 0px;
	padding: 0px;
	border: 1px solid #dcdcdc;
}

#carBasiclInfo {
	width: 600px;
	position: absolute;
	top: 255px;
	left: 50px;
}

#carInfoTitle {
	text-align : center;
	height: 65px;
	color: #323232;
	font-size: 28px;
	font-weight: 950;
}

.carInfoDetail {
	width: 300px;
	height: 40px;
	font-size: 20px;
	font-weight: bold;
	text-align: right;
	padding-right: 15px;	
}

#btnDiv{
	position: absolute;
	top: 810px;
	width: 700px;
	margin: 0px;
	align-items: center;
}

#btn-kakao {
	width: 320px;
	height: 50px;
	background-color: #FF4714;
	color: #FDFDFD;
	font-size: 16px;
	font-weight: 900;
	border: none;
	cursor: pointer;
	margin: 5px 20px;
}

#btn-cancel {
	width: 320px;
	height: 50px;
	background-color: #FDFDFD;
	color: #FF4714;
	font-size: 16px;
	font-weight: 900;
	border: 2px solid #FF4714;
	cursor: pointer;
	margin: 5px 20px;
}
</style>

<script type="text/javascript">
	function payCancel() {
		alert("결제를 취소합니다");
		//window.opener.location.reload();    //부모창 reload
		window.close();
	}
	
</script>
</head>
<body>
	<div id="fullBody">
			<img	src="<%=request.getContextPath()%>/images/main/kh_expertPaymentBackground.png"
									width="700px" 
									height="1083px">
	</div>
	
	<div id="paymentForm">
			
		<form 	name="payForm"  action="/KH/pay/readyExpertPay"	method="post" >
		<input	type="hidden"	name="user_id"	value="${buyer.user_id }" />
		<input	type="hidden"	name="expert_review_num"	value="${expertReviewDetail.expert_review_num }" />
		<input	type="hidden"	name="buy_type"	value="2" /> 

		<div id="carBasiclInfo">
			<table id="carBasiclInfoTable">
				<tr>
					<td id="carInfoTitle" colspan="2">${carDetail.brand } ${carDetail.model }</td>
				</tr>
					
				<tr>
					<td class="carInfoDetail">${seller.user_name }</td>
					<td class="carInfoDetail">${carDetail.car_num }</td>
				</tr>
				
				<tr>
					<td class="carInfoDetail">
						<fmt:formatNumber value="${carDetail.mileage }"	pattern="#,###,###" /> km
					</td>
					<td class="carInfoDetail">${carDetail.accident }</td>
				</tr>
				
				
				
				<tr>
					<td class="carInfoDetail">
						<c:set var="manu_date"	value="${carDetail.manu_date }" />
						${fn:substring(manu_date,0,2) } 년 / ${fn:substring(manu_date,2,4) }	월
					</td>
					<td class="carInfoDetail">${carDetail.fuel }</td>
				</tr>				
			</table>
		</div>
	
		<div id="btnDiv">
			<button	id="btn-kakao"	type="submit">
				결제요청
			</button>
			<button	id="btn-cancel"	onclick="payCancel()">
				결제취소
			</button>													
		</div>
	
	</form>
	
</div>	
	

	

</body>

</html>

