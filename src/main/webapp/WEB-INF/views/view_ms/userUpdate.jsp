<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="styles.css">
</head>

<style>
* {
	margin: 0;
	white-space: nowrap;
}

.mp {
	display: grid;
	grid-template-areas: "nav" "header" "main" "footer";
	/* grid-template-rows: 100px 200px 500px 200px; */
	/* grid-template-columns: 100px 1120px 100px; */
}
/* 네비게이션 바 스타일 */
.navbar {
	display: flex;
	justify-content: space-between;
	/* justify-content: center; */
	align-items: center;
	background-color: #ffffff;
	height: 150px;
	width: 100%;
	padding: 0;
}
/* 로고 이미지 스타일 */
.navbar img {
	height: 75px;
	width: auto; /* 비율 유지*/
	margin: 0 50px;
}
/* 메뉴바 스타일 */
.menu {
	display: flex;
	list-style: none;
	padding: 0;
	margin: 0;
}
/* 메뉴 항목 스타일 */
.menu li {
	float: left;
	margin: 15px 75px;
}
/* 메뉴 링크 스타일 */
.menu a {
	text-align: center;
	color: rgb(0, 0, 0);
	font-size: 20px;
	font-weight: bold;
	text-decoration: none;
	transition: color 0.3s;
}
/* 메뉴 항목에 마우스를 올렸을 때 */
.menu a:hover {
	color: #000000cc;
}

.but_logout:hover {
	border-style: none;
	background-color: #000000;
	width: 100px;
	height: 35px;
	color: #fdfdfd;
	margin: 0px 50px;
	font-size: 15px;
	font-weight: bold;
}

.but_logout {
	border-style: none;
	background-color: #ffffff;
	width: 100px;
	height: 35px;
	color: #323232;
	margin: 0px 50px;
	font-size: 15px;
	font-weight: bold;
}

a {
	text-decoration: none;
	color: inherit;
}

.user {
	font-size: 15px;
	font-weight: bold;
}

.menu_mypage {
	color: #000000;
	text-decoration-line: none;
}

.header {
	height: 738px;
	width: 100%;
	/* border: 1px solid black; */
	align-items: center;
	margin: auto;
	text-align: center;
}

.main {
	width: 100%;
	max-width: 75%; /* 화면 너비를 넘지 않도록 설정 */
	overflow: hidden; /* 요소가 넘칠 경우 숨김 */
	margin: 0 auto; /* 가운데 정렬 */
	text-align: center; /* 내부 콘텐츠 가운데 정렬 */
}

.main img {
	width: 100%;
	height: auto; /* 비율을 유지하면서 높이 조정 */
	max-width: 100%; /* 부모 요소의 크기를 넘지 않도록 제한 */
	display: block; /* 이미지 하단에 여백 제거 */
	margin: 0 auto; /* 이미지 가운데 정렬 */
}

#rrr {
	margin-top: 100px;
	height: 200px;
	width: 20%;
}

#rcc {
	margin-top: 100px;
	height: 150px;
	width: 150px;
}

#mainImage {
	margin-top: 50px;
	height: 500px;
	width: 100%;
	margin-bottom: 100px;
}

.footer {
	height: 100px;
	width: 100%;
}

#floatMenu {
	position: absolute;
	display: flex;
	justify-content: space-between;
	right: 50px;
	bottom: 50px;
	color: #fff;
}

.block {
	padding: 150px 50px;
	margin: 60px 30px;
	background-color: rgb(255, 255, 255);
	border-bottom: 1px solid #000000;
}
/* 기본 스타일 초기화 */
body, h1, h2, p {
	margin: 0;
	padding: 0;
}

body {
	font-family: Arial, sans-serif;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
	margin: 0;
}

.container {
	display: flex;
	flex: 1;
}

.sidebar {
	width: 200px;
	background-color: #ffffff;
	border-right: 1px solid #ddd;
	padding: 20px;
	box-sizing: border-box;
}

.sidebar.left {
	border-right: 1px solid #ffffff;
}

.sidebar.right {
	border-left: 1px solid #ffffff;
}

.content {
	flex: 1;
	padding: 20px;
	background-color: #f3efef;
	box-sizing: border-box;
	align-items: center;
	text-align: center;
}

h2 {
	font-size: 16px;
	margin-bottom: 20px;
}

ul {
	list-style-type: none;
	padding: 0;
}

ul li {
	margin: 10px 0;
}

ul li a {
	text-decoration: none;
	color: #333;
	font-size: 14px;
}

ul li a:hover {
	color: #e95a21;
}
</style>

<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">

</script>

<body>
	<header>
		<%@ include file="../header_white.jsp"%>
	</header>
<!---------------------------------------- 헤더 ----------------------------------------->

	<div class="container">
		<nav class="sidebar left">
			<ul>
				<li><img src="../images/main/mypage.png" width="40px"> 
				<a href="/view_ms/myPage">마이페이지</a></li>
				<li><img src="../images/main/mypage_list.png" width="40px">
					<a href="/view_ms/buyList">구매 내역</a></li>
				<li><img src="../images/main/mypage_list.png" width="40px">
					<a href="/view_ms/myZzim">관심목록</a></li>
				<li><img src="../images/main/mypage_list.png" width="40px">
					<a href="/view_ms/reviewList">구매한 리뷰</a></li>
				<li><img src="../images/main/mypage_list.png" width="40px">
					<a href="/view_ms/myQna">문의 내역</a></li>
				<li><img src="../images/main/mypage_list.png" width="40px">
					<a href="/view_ms/myPageEditCheck">회원정보수정</a></li>
			</ul>
		</nav>
<!-------------------------------------- left.sidebar ------------------------------------>
		<main class="content">
			<h1>마이페이지</h1>
			<div class="block">회원 정보가 수정되었습니다.</div>
		</main>
<!-------------------------------------- rigth.sidebar ------------------------------------>
		<nav class="sidebar right">
			<h2>나의 프로필</h2>
			<ul>
				<li><a href="#info1"><img src="../images/main/미쑥쑥.png"
						width="100px">
						<p>프로필</a></li>
				<li><a href="#info2">${User_Table.user_id}</a></li>
				<li><a href="#info3">Lv.1</a></li>
			</ul>
		</nav>
	</div>

<!------------------------------------------- 푸터 -------------------------------------------->
	<%@ include file="../footer.jsp" %>
</body>
</html>