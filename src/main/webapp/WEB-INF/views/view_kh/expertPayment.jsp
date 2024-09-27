<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath()%>/css/expertPayment.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	function payCancel() {
		alert("결제를 취소합니다");
		//window.opener.location.reload();    //부모창 reload
		window.close();
	}
	
</script>
</head>
<body>
	<div id="pageTitle">전문가 리뷰 구매</div>

	<div id="full">
		<form 	name="payForm"  action="/KH/pay/readyExpertPay"	method="post" >
		<input	type="hidden"	name="user_id"	value="${buyer.user_id }" />
		<input	type="hidden"	name="expert_review_num"	value="${expertReviewDetail.expert_review_num }" />
		<input	type="hidden"	name="buy_type"	value="2" /> 

		<div id="intro">
			<h3>안녕하세요, ${buyer.user_name } 고객님.</h3>
			<h3>전문가리뷰 구매를 시작하겠습니다.</h3>
			<h3>대상정보와 예상 결제 금액을 확인해 주세요.</h3>
		</div>

		<div id="carBasiclInfo">
			<table id="carInfo">
				<tr>
					<th class="carInfoTitle" colspan="2">리뷰 대상차량 기본정보</th>
				</tr>
				<tr>
					<th class="carInfoTitle">구분</th>
					<th class="carInfoTitle">내용</th>
				</tr>
				<tr>
					<td class="carInfoLeft">리뷰어</td>
					<td class="carInfoRight">${seller.user_name }</td>
				</tr>
				<tr>
					<td class="carInfoLeft">차량번호</td>
					<td class="carInfoRight">${carDetail.car_num }</td>
				</tr>
				<tr>
					<td class="carInfoLeft">차량모델</td>
					<td class="carInfoRight">${carDetail.brand } ${carDetail.model }</td>
				</tr>
				<tr>
					<td class="carInfoLeft">제작년도</td>
					<td class="carInfoRight">
						<c:set var="manu_date"	value="${carDetail.manu_date }" />
						${fn:substring(manu_date,0,2) } 년 / ${fn:substring(manu_date,2,4) }	월
					</td>
				</tr>
				<tr>
					<td class="carInfoLeft">주행거리</td>
					<td class="carInfoRight">
						<fmt:formatNumber value="${carDetail.mileage }"	pattern="#,###,###" /> km
					</td>
				</tr>
				<tr>
					<td class="carInfoLeft">차량연료</td>
					<td class="carInfoRight">${carDetail.fuel }</td>
				</tr>				
			</table>
		</div>

		<div id="paymentInfo">
			<table id="paymentInfoTable">

				<tr>
					<th id="paymentSumTitle">합계</th>
					<td id="paymentSumAmount">5,500 원</td>					
				</tr>
				<tr>
					<th class="paymentSumLeft">리뷰가격</th>
					<td class="paymentSumRight">5,000 원</td>					
				</tr>
				<tr>
					<th class="paymentSumLeft">세 금</th>
					<td class="paymentSumRight">500 원</td>					
				</tr>

				<tr>
					<td id="payButton" colspan="2">
						<button	id="btn-kakao"
								type="submit">
							<i class="fa-solid fa-comment">결제요청</i>
						</button>
						<br>
						<button	id="btn-cancel"	
								onclick="payCancel()">
							<i class="fa-solid fa-comment">결제취소</i>
						</button>													
					</td>
				</tr>				
			</table>
		</div>
		
	</form>

</div>

</body>

</html>

