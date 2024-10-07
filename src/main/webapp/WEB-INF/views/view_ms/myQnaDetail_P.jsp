<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<title>전문가 마이페이지</title>
<link rel="stylesheet" href="../css/myPage.css">
<div class="header_continer"><%@ include file="../header_white.jsp"%></div>
<div class="menu_continer"><%@ include file="../menu_P.jsp" %></div>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript"><%@ include file="../kakao.jsp" %></script>
</head>

<body>
	<header>
			<%@ include file="../header_white.jsp"%>
	</header>
	<!-------------------------------------------- 헤더 --------------------------------------->
	<div class="container">
				<nav class="sidebar left">
			<ul>
				<li><img src="../images/main/mypage.png" width="40px"> 
				<a href="/view_ms/myPage">마이페이지</a></li>
				
				<li><img src="../images/main/mypage_list.png" width="40px">
				<a href="/view_ms/myExpertReview">나의 전문가리뷰</a></li>
				
				<li><img src="../images/main/mypage_list.png" width="40px">
					<a href="/view_ms/myZzim_P">관심목록</a></li>
				
				<li><img src="../images/main/mypage_list.png" width="40px">
				<a href="/view_ms/myQna_P">문의 내역</a></li>
				
				<li><img src="../images/main/mypage_list.png" width="40px">
				<a href="/view_ms/myPageEditCheck_P">회원정보수정</a></li>
			</ul>
		</nav>
<!--------------------------------------leftsidebar------------------------------------->
		<main class="content">
		<h1 class="text-center"><a href="#">나의 문의내역</a></h1><br><br>
		<div class="block">
				<table>
					<thead>
						<tr>	
							<th>작성자</th>
							<th>작성일자</th>
							<th>작성제목</th>
							<th>작성내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>								
							<td>${Qna.user_id}</td>
							<td>${Qna.qna_date}</td>
							<td>${Qna.qna_title}</td>
							<td>${Qna.qna_content}</td>
						</tr>	
					</tbody>
				</table>
			</div>
			<button type="button" onclick="handleSubmit()">삭제</button>
		</main>
</div>
	<!---------------------------------------------- 푸터 ------------------------------------>
	<%@ include file="../footer.jsp" %>
</body>
</html>