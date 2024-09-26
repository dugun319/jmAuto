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
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>	
	$(function() {
		$("#inputRefundPassword").change(function() {
			var originValue	= $("#sendRefundPassword").val();
			var inputValue	= $("#inputRefundPassword").val();
			alert("change!");
						
			if(inputValue == originValue){
				$("#caption").css({"color" : "blue"});
				$("#caption").val("입력값이 일치합니다");
				$("#requestButton").prop("disabled", false);
			} else{
				$("#caption").val("입력값이 일치하지 않습니다");
				$("#caption").css({"color" : "red"});
			}
		});
	});
	
	function requestButton() {
		location.href="/KH/pay/requestRefundPayment?tid="+$("#tid").val();
		window.opener.location.reload();
		window.close();		
	}

</script>
<style type="text/css">
input #caption {
	font-size: 12px;
	border: none;	
}
</style>

</head>
	<body>
	<h1>${tid }</h1>
	<h1>${sendRefundPassword }</h1>
		<input 	type="hidden"		
				id="sendRefundPassword"
				value="${sendRefundPassword }" />
		<input 	type="hidden"		
				id="tid"
				value="${tid }" />
						
		<input 	type="text"		
				id="inputRefundPassword"/>
				
		<input 	type="text" 
				id="caption" />
				
		<button id="requestButton"
				onclick="requestButton()" 
				disabled="disabled">
			환불승인
		</button>
	</body>
</html>