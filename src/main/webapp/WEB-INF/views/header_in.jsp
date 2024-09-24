<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="func" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath()%>/css/header.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="navbar">
		<img src="<%=request.getContextPath()%>/images/payment/logo_web.png" alt="logoimg">
		<nav>
			<ul class="menu">
				<li><a href="/order/pay/kCar">국내</a></li>
				<li><a href="/order/pay/abrod">해외</a></li>
				<li><a href="/view_sh/ecoCar">친환경</a></li>
				<li><a href="/view_sh/sellMyCar">내차팔기</a></li>
				<li><a href="/view_jw/cs">고객지원</a></li>
			</ul>
		</nav>
		<div class="user">
			<a class="menu_login" href="/view_jm/join">회원가입</a>
			<button class="but_login" onclick="location.href='/view_jm/login'">로그인</button>
		</div>
	</div>
</body>
</html>