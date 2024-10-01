<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">


	$(function() {
		var result = ${result };
		if( result == 0){
			$('#expertReviewBody').hide();
			$('#goBeforeDiv').show();
		}  else {
			$('#"expertReviewBody"').show();
			$('#goBeforeDiv').hide();
		}
		
		var score 			= $('#evaScore').val();
		var rawScoreDegree 	= 360 * score / 100;
		var gaugeColor 		= "";
		var scoreDegree 	= Math.ceil(rawScoreDegree);
		
		if(score > 80) {
			gaugeColor = "skyblue";
		} else if(score > 60) {
			gaugeColor = "yellowgreen";
		} else if(score > 40) {
			gaugeColor = "yellow";
		} else {
			gaugeColor = "orange";
		}
		
		var conicGradient 	= "conic-gradient(" +
							gaugeColor + " " + 
							scoreDegree + "deg, white 0deg)";
		
		var cssJson 		= {"background" : conicGradient};
		
		$('#expertScoreGuageOutCircle').css(cssJson);
		
		// alert(conicGradient);
		
		$('#expertScoreGuageInnerCircle').css("background-color", "#353b48");
			
	});
 	
	function goPay() {
		
		document.payForm.target = goPay
		window.open('', payForm.target, 'width=550,height=900,location=no,status=no,scrollbars=no,top=100,left=300');
		document.payForm.action = "/KH/pay/goExpertPay";
		document.payForm.submit();
		window.close();
	}
 	
</script>


<style type="text/css">

table {
	width: 670px;
	padding: 20px;
	border: 3px solid #d3d3d3;
	margin-top: 30px;
}

.tableTitle{
	padding-left: 20px;
	font-size: 25px;
	font-weight: 500;
	color: #323232;
}

.innerLine {
	width: 50%;
	margin-left: -10px;
  	margin-top: 10px;
  	margin-bottom: 10px;
}

#expertCarModel{
	height: 100px;
}

#expertScoreGuage {
	width: 220px;
}

#expertScoreGuageOutCircle {
	font-size: 35px;
	font-weight: 900;
	width: 200px;
	height: 200px;
	display: flex;
	justify-content: center;
	border-radius: 50%;
	border: 10px solid #353b48;
	position: relative;
	background: conic-gradient(yellowgreen 270deg, white 0deg);
	
}

#expertScoreGuageInnerCircle {
	width: 80%;
	height: 80%;
	border-radius: inherit;
	background-color: #353b48;
	margin: auto;
	display: inline-flex;
	justify-content: center;
	flex-direction: column;
	color: white;
	
}

#expertScoreNumber {

	display: inline-flex;
	justify-content: center;
	align-items: center;
}


#expertScoreEva {
	display: inline-flex;
	justify-content: center;
	align-items: center;
}

#expertCarInfoTitle{
	font-size: 20px;
	font-weight: 900;
	width: 150px;
	padding: 20px;
	line-height: 300%;

}

#expertCarInfoContent{
	font-size: 20px;
	font-weight: 500;
	padding: 20px;
	line-height: 300%;
}

#expertCommentDetail1{
	font-size: 30px;
	font-weight: 900;
	color: skyblue;
}

#expertCommentDetail2{
	font-size: 30px;
	font-weight: 900;
	color: yellowgreen;
}

#expertCommentDetail3{
	font-size: 30px;
	font-weight: 900;
	color: yellow;
}

#expertCommentDetail4{
	font-size: 30px;
	font-weight: 900;
	color: orange;
	margin-bottom: 20px;
}

.expertCommentDetail{
	font-size: 18px;
	font-weight: 700;
	line-height: 300%;
}

.expertTitle{
	font-size: 20px;
	font-weight: 900;
	width: 300px;
	line-height: 300%;
}

.expertDetail1{
	font-size: 20px;
	color: skyblue;
	font-weight: 700;
	line-height: 300%;
	text-align: center;
	padding-left: 20px;
}

.expertDetail2{
	font-size: 20px;
	color: yellowgreen;
	font-weight: 700;
	line-height: 300%;
	text-align: center;
	padding-left: 20px;
}

.expertDetail3{
	font-size: 20px;
	color: orange;
	font-weight: 700;
	line-height: 300%;
	text-align: center;
	padding-left: 20px;
}

#expertReviewContent{
	font-size: 15px;
	font-weight: 700;
	line-height: 300%;
	padding-left: 20px;
}

#goBeforeDiv {
	text-align: center;
}

#goExpertPayButton {
	width: 400px;
	height: 80px;
	background-color: #FF4714;
	color: #FDFDFD;
	font-size: 25px;
	font-weight: 900;
	border: none;
	cursor: pointer;
	margin: 5px;
}


</style>

</head>
	<body>
		<input type="hidden" 	id=evaScore 	value="${experReviewDetail.score }">

		<div id="expertReviewBody">
			<table id="expertScore">
				<tr>
					<td id="expertCarModel" colspan="3">
						<h1>
						${carDetail.brand }&nbsp;
						${carDetail.model }&nbsp;
						${carDetail.fuel }	
						</h1>					
					</td>
				</tr>
				<tr>
					<td id="expertScoreGuage">
						<div id="expertScoreGuageOutCircle">
							<div id="expertScoreGuageInnerCircle">
								<span id="expertScoreNumber">${experReviewDetail.score }</span>
								
								<c:set var="inputScore" value="${experReviewDetail.score }"/>
								<c:choose>
									<c:when test="${inputScore gt 80}">
										<span style="font-size:15px;" id="expertScoreEva">Good</span>
									</c:when>
									<c:when test="${inputScore gt 60}">
										<span style="font-size:15px;" id="expertScoreEva">Average</span>
									</c:when>
									<c:when test="${inputScore gt 40}">
										<span style="font-size:15px;" id="expertScoreEva">Caution</span>
									</c:when>
									<c:otherwise>
										<span style="font-size:20px;" id="expertScoreEva">Warning</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</td>
					<th id="expertCarInfoTitle">
						차량번호
						<br>
						제조일
						<br>
						주행거리
						<br>
						사고유무					
					</th>
					<td id="expertCarInfoContent">
						${carDetail.car_num }
						<br>
						<c:set var="manu_date" value="${carDetail.manu_date }"/>
						${fn:substring(manu_date,0,2) } 년 / ${fn:substring(manu_date,2,4) } 월
						<br>
						<fmt:formatNumber 	value="${carDetail.mileage }" 	pattern="#,###,###"/> km
						<br>
						${carDetail.accident }
					</td>
				</tr>			
			</table>
			
			<table id="expertComment">
				<tr>
					<td>
						<c:set var="inputScore" value="${experReviewDetail.score }"/>
						<c:choose>
							<c:when test="${inputScore gt 80}">
								<span id="expertCommentDetail1">
									★ 구매를 추천드립니다.<br>
								</span>
								<span class="expertCommentDetail">
									★ 상태가 좋은 차량입니다.<br>
									★ 수리와 교환이 필요한 부품이 많지 않습니다.
								</span>
							</c:when>
							<c:when test="${inputScore gt 60}">
								<span id="expertCommentDetail2">
									구매에 신중하세요.<br>
								</span>
								<span class="expertCommentDetail">
									★ 상태가 양호한 차량입니다.<br>
									★ 수리와 교환이 필요한 부품이 있으니 판매가를 생각해서 구매하세요.<br>
								</span>
							</c:when>
							<c:when test="${inputScore gt 40}">
								<span id="expertCommentDetail3">
									구매에 주의하세요.<br>
								</span>
								<span class="expertCommentDetail">
									★ 상태가 좋지 않은 차량입니다.<br>
									★ 수리와 교환이 필요한 부품이 많으니 판매가를 생각해서 구매하세요.<br>
								</span>
							</c:when>
							<c:otherwise>
								<span id="expertCommentDetail4">
									구매를 추천드리지 않습니다.<br>
								</span>
								<span class="expertCommentDetail">
									★ 상태가 불량한 차량입니다.<br>
									★ 전반적인 수리와 교환이 필요하니 판매가를 생각해서 구매하세요.<br>
								</span>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
			
			<table id="expertBasic">
				<tr>
					<td class="tableTitle" 	colspan="2">
						기본사항
						<hr class="innerLine"/>
					</td>
				</tr>
				<tr>
					<th class="expertTitle">
						성능/상태점검기록부<br>
						주행거리<br>
						자동차 등록증
					</th>
					<td id="expertBasicDetail">
						<c:set var="state" value="${experReviewDetail.ess_state }"/>
						<c:set var="mileage" value="${experReviewDetail.ess_mileage }"/>
						<c:set var="regi" value="${experReviewDetail.ess_regi }"/>
						<c:choose>
							<c:when test="${state eq 1}">
								<span class="expertDetail1">
									이상없음
								</span>
							</c:when>
							<c:otherwise>
								<span class="expertDetail3">
									확인필요
								</span>
							</c:otherwise>
						</c:choose>
						<br>
						
						<c:choose>
							<c:when test="${mileage eq 1}">
								<span class="expertDetail1">
									평균이하
								</span>
							</c:when>
							<c:when test="${mileage eq 2}">
								<span class="expertDetail2">
									평균
								</span>
							</c:when>
							<c:otherwise>
								<span class="expertDetail3">
									평균초과
								</span>
							</c:otherwise>
						</c:choose>
						<br>
						
						<c:choose>
							<c:when test="${regi eq 1}">
								<span class="expertDetail1">
									이상없음
								</span>
							</c:when>
							<c:otherwise>
								<span class="expertDetail3">
									확인필요
								</span>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
			
			<table id="expertEvaluation">
				<tr>
					<td class="tableTitle" 	colspan="2">
						총평
						<hr class="innerLine"/>
					</td>
				</tr>
				<tr>
					<td id="expertReviewContent">
						${experReviewDetail.content }
					</td>
				</tr>
			</table>
			
			<table>
				<tr>
					<td class="tableTitle" 	colspan="2">
						소모품
						<hr class="innerLine"/>
					</td>
				</tr>
				
				<tr>
					<th class="expertTitle">
						엔진오일<br>
						브레이크오일<br>
						냉각수<br>
						타이어<br>
						브레이크패드
					</th>
					<td id="expertExpendablesDetail">
						<c:set var="egine_oil" value="${experReviewDetail.egine_oil }"/>
						<c:set var="brake_oil" value="${experReviewDetail.brake_oil }"/>
						<c:set var="coolant" value="${experReviewDetail.coolant }"/>
						<c:set var="tire" value="${experReviewDetail.tire }"/>
						<c:set var="brake_pad" value="${experReviewDetail.brake_pad }"/>
						<c:choose>
							<c:when test="${egine_oil eq 1}">
								<span class="expertDetail1">
									상태양호
								</span>
							</c:when>
							<c:otherwise>
								<span class="expertDetail3">
									점검필요
								</span>
							</c:otherwise>
						</c:choose>
						<br>
						
						<c:choose>
							<c:when test="${brake_oil eq 1}">
								<span class="expertDetail1">
									상태양호
								</span>
							</c:when>
							<c:otherwise>
								<span class="expertDetail3">
									점검필요
								</span>
							</c:otherwise>
						</c:choose>
						<br>
						
						<c:choose>
							<c:when test="${coolant eq 1}">
								<span class="expertDetail1">
									상태양호
								</span>
							</c:when>
							<c:otherwise>
								<span class="expertDetail3">
									점검필요
								</span>
							</c:otherwise>
						</c:choose>
						<br>
						
						<c:choose>
							<c:when test="${tire eq 1}">
								<span class="expertDetail1">
									상태양호
								</span>
							</c:when>
							<c:otherwise>
								<span class="expertDetail3">
									점검필요
								</span>
							</c:otherwise>
						</c:choose>
						<br>
						
						<c:choose>
							<c:when test="${brake_pad eq 1}">
								<span class="expertDetail1">
									상태양호
								</span>
							</c:when>
							<c:otherwise>
								<span class="expertDetail3">
									점검필요
								</span>
							</c:otherwise>
						</c:choose>

					</td>
				</tr>
			</table>
					
		</div>
		
		
		<h1>result = ${result }</h1>
		<h1>expert_review_num = ${param.expert_review_num}</h1>
		
		<div id="goBeforeDiv">
			<img	src="<%=request.getContextPath()%>/images/main/beforePurchaseExpertPure.png"
					width="100%">
			<form name="payForm" method="get">
			<input type="hidden" name="expert_review_num" value="${param.expert_review_num}">	
			<button	id="goExpertPayButton"
					onclick="goPay()" >
					<i class="fa-solid fa-comment">
						결제하고 보기
					</i>
			</button>
			</form>			
		</div>
		
		<%-- 		
		<div id="testDiv">
			<h5>나타나라</h5>
			<h5>${experReviewDetail.expert_review_num }</h5>
			<h5>${experReviewDetail.sell_num }</h5>
			<h5>${experReviewDetail.write_date }</h5>
			<h5>${experReviewDetail.score }</h5>
			<h5>${experReviewDetail.content }</h5>
			<h5>${experReviewDetail.user_id }</h5>
			<h5>${experReviewDetail.ess_state }</h5>
			<h5>${experReviewDetail.ess_mileage }</h5>
			<h5>${experReviewDetail.ess_regi }</h5>
			<h5>${experReviewDetail.egine_oil }</h5>
			<h5>${experReviewDetail.brake_oil }</h5>
			<h5>${experReviewDetail.coolant }</h5>
			<h5>${experReviewDetail.tire }</h5>
			<h5>${experReviewDetail.brake_pad }</h5>
			
			<h5>매물번호 : ${carDetail.sell_num }</h5>
			<h5>차종 : ${carDetail.car_type }</h5>
			<h5>제조사 : ${carDetail.brand }</h5>
			<h5>모델 : ${carDetail.model }</h5>
			<h5>차량번호 : ${carDetail.car_num }</h5>
			<h5>제조일 : ${carDetail.manu_date }</h5>
			<h5>주행거리 : ${carDetail.mileage }</h5>
			<h5>색상 : ${carDetail.color }</h5>
			<h5>연료 : ${carDetail.fuel }</h5>
			<h5>변속기 : ${carDetail.transmission }</h5>
			<h5>사고유무 : ${carDetail.accident }</h5>
			<h5>압류유무 : ${carDetail.repossession }</h5>
			<h5>차량가격 : ${carDetail.price * 11700} 원</h5>
			<h5>자동차등록증경로 : ${carDetail.sell_regi }</h5>
			<h5>자동차세완납증명서경로 : ${carDetail.sell_certi_tax }</h5>
			<h5>신분증사본 경로 : ${carDetail.sell_shinbun }</h5>
			<h5>판매자 아이디 : ${carDetail.user_id }</h5>
			<h5>판매여부 : ${carDetail.sale }</h5>
			<h5>등록일자 : ${carDetail.reg_date }</h5>
			<h5>삭제여부 : ${carDetail.del_state }</h5>

		</div>
		 --%>				
	</body>
</html>