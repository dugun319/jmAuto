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

#fullBody{
	width: 1320px;
	margin: 0px 300px;
	padding: 0;
}

#adminMenu{
	position: absolute;
	top: 235px;
	left: 370px;
}

.adminMenu{
	height: 40px;
	width: 200px;
	padding-right: 20px;
	font-size: 24px;
	font-weight: 950;
	color: #fafafa;
}

#searchDiv{
	position: absolute;
	top: 195px;
	left: 605px;
}

#searchDiv input {
	width: 200px;
	height: 45px;
	border-width: 0px;
	outline: none;
}

#searchButton{
	width: 100px;
	height: 45px;
	background-color: #FF4714;
	color: #FDFDFD;
	font-size: 16px;
	font-weight: 900;
	border: none;
	cursor: pointer;
}

#loginId{
	position: absolute;
	top: 130px;
	left: 1420px;
	font-size: 24px;
	font-weight: 900;
	color: #fafafa;
}
</style>

</head>
<body>
	<div id="fullBody">
		<img	src="<%=request.getContextPath()%>/images/main/kh_adminBackground.png"
				width="1320px" 
				height="990px">
	</div>
	
	<div id="adminMenu">
		<table>
			<tr>
				<td class="adminMenu">
					환불승인
				</td>
			</tr>
			
			<tr>
				<td class="adminMenu">
					사용자관리
				</td>
			</tr>
				
			<tr>
				<td class="adminMenu">
					고객센터관리
				</td>
			</tr>
			
			<tr>
				<td class="adminMenu">
					매물관리
				</td>
			</tr>
		</table>
	</div>
	
	<div id="searchDiv">
		<form action="/KH/pay/paymentList">
			<input	type="text"		name="user_id"	placeholder="user_id" />
			<input	type="hidden"	name="admin_id"	value="${admin_id }" />
			<button type="submit"	id="searchButton">SEARCH</button>
		</form>
	</div>
	<div id="loginId">
		${admin_id }
	</div>
	
</body>
</html>