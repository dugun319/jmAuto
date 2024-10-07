<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="../css/myPage.css">
<div class="header_continer"><%@ include file="../header_white.jsp"%></div>
<div class="menu_continer"><%@ include file="../menu_P.jsp" %></div>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript"><%@ include file="../kakao.jsp" %></script>

</head>
<body>
<!---------------------------------------- 헤더 ----------------------------------------->
	<div class="container">
		<main class="content">
			<h1>마이페이지</h1>
			<div class="block">회원 정보가 수정되었습니다.</div>
		</main>
</div>
<!------------------------------------------- 푸터 -------------------------------------------->
	<%@ include file="../footer.jsp" %>
</body>
</html>