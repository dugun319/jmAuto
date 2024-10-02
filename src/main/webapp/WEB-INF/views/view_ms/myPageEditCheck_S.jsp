<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<title>판매자 마이페이지</title>
<link rel="stylesheet" href="styles.css">
</head>
<style>
* {
	margin: 0;
	white-space: nowrap;
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
	padding: 50px 50px;
	margin: 30px 30px;
	background-color: rgb(255, 255, 255);
	border-bottom: 1px solid #000000;
}
.block input {
	width: 500px;
	height: 30px;
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
#button1 {
	background-color: #e95a21;
	color: #fff;
}
</style>


<body>
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript">

		/* 비밀번호 체크로직 */
		function checkPwd() {
			alert('아작스까지 연결 되었음 좀만 기다리샘 비번 확인하겠음');
			var input_pw = $('#input_pw').val(); // 여기서 비밀번호 값을 가져옴

			// ajax--> 세미 컨트롤러 (근데 컨트롤러로 이동해서 값을 받아온 후,  그 값을 토대로 뷰에 우리가 원하는 값을 반환하는 용도)
			$.ajax({
				type : 'GET',
				url : '/view_ms/pwChk', //이 경로의 컨트롤러로 감
				data : {
					'input_pw' : input_pw
				},
				dataType : "json",
				success : function(result) {
					if (result === 1) {
						window.location.href = "/view_ms/myPageEdit_S";
					} else {
						alert("비밀번호가 일치하지 않습니다.");
						window.location.reload();
					}
				},
				fail : function(error) {
					alert(JSON.stringify(error));
				}
			});
		}
	</script>


<header>
		<%@ include file="../header_white.jsp"%>
	</header>
<!---------------------------------------------- 헤더 ------------------------------------------------->

	<div class="container">
		<nav class="sidebar left">
			<ul>
				<li><img src="../images/main/mypage.png" width="40px"> 
				<a href="/view_ms/myPage">마이페이지</a></li>
				<li><img src="../images/main/mypage_list.png" width="40px">
					<a href="/view_ms/sellList">판매 중인 차량</a></li>
				<li><img src="../images/main/mypage_list.png" width="40px">
					<a href="/view_ms/sellWan">판매 완료 차량</a></li>
				<li><img src="../images/main/mypage_list.png" width="40px">
					<a href="/view_ms/myQna_S">문의 내역</a></li>
				<li><img src="../images/main/mypage_list.png" width="40px">
					<a href="/view_ms/myPageEditCheck_S">회원정보수정</a></li>
			</ul>
		</nav>
<!------------------------------------------left.sidebar---------------------------------------------->
		<main class="content">
			<h1>회원정보 수정</h1>
			<img src="../images/main/미쑥쑥.png" width="100px">
			<p>
				<label for="input_pw">비밀번호 확인</label> 
				<input type="hidden" name="user_id" value="${user_table.user_id}"><!--PK는 hidden으로 잡아주어야 함. -->
				<input type="password" id="input_pw" name="user_pw" required="required">
				<!-- name은 딱히 로직에 상관이 없고, 그냥 뷰단을 위해 있는 것 같음 -->

				<button type="submit" id="checkPwd" onclick="checkPwd()">확인</button>

				<!-- 비밀번호 검증 결과 메세지 -->
				<c:if test="${not empty errorMessage }">
					<p style="color: red;">${errorMessage}</p>
				</c:if>
		</main>
<!------------------------------------------right.sidebar---------------------------------------------->
		<nav class="sidebar right">
			<h2>나의 프로필</h2>
			<ul>
				<li><a href="#info1"><img src="../images/main/미쑥쑥.png"
						width="100px">
						<p>프로필</a></li>
				<li><a href="#info2">미쑥쑥</a></li>
				<li><a href="#info3">Lv.1</a></li>
			</ul>
		</nav>

	</div>

	<!------------------------------------------------- 푸터 ------------------------------------------------->
	<%@ include file="../footer.jsp" %>
</body>
</html>