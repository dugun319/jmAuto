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
			$('#testDiv').hide();
			$('#goBeforeDiv').show();
		} /* else {
			$('#testDiv').show();
			$('#goBeforeDiv').hide();
		} */
		
		var score = 360 * $('#evaScore').val() / 100;
		var gaugeColor = "";
		var scoreDegree = Math.ceil(score) ;
		
		if(score < 80) {
			gaugeColor = "#skyblue";
		} else if(score < 60) {
			gaugeColor = "#yellowgreen";
		} else if(score < 40) {
			gaugeColor = "yellow";
		} else {
			gaugeColor = "orange";
		}
		
		var conicGradient 	= "conic-gradient(" +
							gaugeColor + " " + 
							scoreDegree + "deg, white 0deg)";
		
		var cssJson 		= {"background" : conicGradient};
		
		$('#scoreGuageOutCircle').css(cssJson);
		alert(cssJson);
		
		$('#scoreGuageInnerCircle').css("background-color", "red");
			
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

#scoreGuageOutCircle {
	font-size: 50px;
	font-weight: 900;
	width: 300px;
	height: 300px;
	display: flex;
	border-radius: 50%;
	border: 10px solid #353b48;
	position: relative;
	background: conic-gradient(yellowgreen 270deg, white 0deg);
}

#scoreGuageOutCircle2 {
	font-size: 50px;
	font-weight: 900;
	width: 300px;
	height: 300px;
	display: flex;
	border-radius: 50%;
	border: 10px solid #353b48;
	position: relative;
	background: conic-gradient(orange 220deg, white 0deg);
}

#scoreGuageInnerCircle {
	width: 80%;
	height: 80%;
	border-radius: inherit;
	background-color: #353b48;
	margin: auto;
	display: flex;
	color: white;
	justify-content: center;
}

#scoreNumber {

	display: flex;
	align-items: center;
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
		<div id="scoreGuageOutCircle">
			<div id="scoreGuageInnerCircle">
				<span id="scoreNumber">${experReviewDetail.score }</span>
			</div>
		</div>
		
		<div>
			<table>
				<tr>
					<td>
						<div id="scoreGuageOutCircle2">
							<div id="scoreGuageInnerCircle">
								<span id="scoreNumber">${experReviewDetail.score }</span>
							</div>
						</div>
					</td>
						
					<td>
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
		
								
	</body>
</html>