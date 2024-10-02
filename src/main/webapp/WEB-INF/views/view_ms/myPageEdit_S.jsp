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

ul li a:hover {
	color: #e95a21;
}

#button1 {
	background-color: #e95a21;
	color: #fff;
}

#button2 {
	background-color: #fff;
	color: #e95a21;
}
</style>

<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">


	function chk(){
	const user_pw1 = document.getElementById('user_pw1').value;
    const user_pw2 = document.getElementById('user_pw2').value;
		
    if(user_pw1 == user_pw2){		
			return true;	
		}else(user_pw1 != user_pw2){
			alert('두 비밀번호가 일치하지 않습니다.');
			return false;
		}
	}
</script>

<body>
	<header>
		<%@ include file="../header_white.jsp"%>
	</header>
<!------------------------------------------ 헤더 ------------------------------------------------>

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
<!------------------------------------------- left.sidebar --------------------------------------------->
		<main class="content">
			<h1>회원정보 수정</h1>
			<form action="/myPageEdit" class="block" method="POST" onsubmit = "return chk()" >
				<img src="../images/main/미쑥쑥.png" width="100px">
				<br>
				<table>
					<tr>
						<th>이름</th>
						<td><input type="text" id="user_id" name="user_id" 
						value="${user.user_id }" required="required" /></td>
					</tr>
					<tr>
						<th>비밀번호 변경</th>
						<td><input type="password" id="user_pw1" name="user_pw1"
						placeholder="변경할 비밀번호" required="required" /></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" id="user_pw2" name="user_pw2"
						 placeholder="비밀번호 확인" required="required" /></td>
					</tr>
					<tr>
						<th>연락처</th>
						<!-- 아하 text박스 안에 기본정보들을 뿌려주려면 user_table을 뭐라고 저장해놨는지 저장한 이름에 .user_id를 붙어야 하는구나! -->
						<td><input type="text" id="user_tel" name="user_tel" 
						value="${user.user_tel}" required="required"></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td><input type="text" id="user_zipcode" name="user_zipcode"
							value="${user.user_zipcode}" required="required"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" id="user_addr1" name="user_addr1"
							value="${user.user_addr1}" required="required"></td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td><input type="text" id="user_addr2" name="user_addr2"
							value="${user.user_addr2}" required="required"></td>
					</tr>
				</table>
				
				<tr>
					<td><button type="submit" id="userUpdate">수정완료</button>
						<button type="reset" id="">취소</button></td>
				</tr>
			</form>
		</main>
<!------------------------------------------- rigtt.sidebar --------------------------------------------->
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

	<!-- 푸터 -->
	<%@ include file="../footer.jsp" %>
</body>

</html>