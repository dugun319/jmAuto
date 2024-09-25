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
			<h1>나타나라</h1>

		</div>
		
								
	</body>
</html>