<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	margin: 0;
	padding: 0;
	background-color: #fafafa;
	min-height: 100vh; /* 화면 높이에 맞추어 최소 높이 설정 */
	font-family: Pretendard;
}

.contents {
	align-items: center;/* 수직 중앙 정렬 */
	height: 100vh; /* 뷰포트 높이 100%로 설정 */
	padding-bottom: 100px;
}

.content {
	display: flex;
	flex-direction: column; /* 세로 방향으로 배치 */
	align-items: center; /* 수평 중앙 정렬 */
	justify-content: center; /* 수직 중앙 정렬 */
}

/* 제목 스타일 */
h1 {
	position: absolute;
	top: 150px;
	text-align: center;
	color: #313131;
}

.join_step {
	display: flex;
	position: absolute;
	/* 플렉스 박스 레이아웃 사용 */
	top: 200px;
	justify-content: center;
	/* 가로 가운데 정렬 */
	list-style: none;
	/* 리스트 스타일 제거 */
	padding: 0;
	/* 기본 패딩 제거 */
	margin-bottom: 30px;
}

.join_step li {
	margin: 0 10px;
	/* 항목 간의 간격 설정 */
	position: relative;
	/* 텍스트 위치를 조정하기 위해 relative 유지 */
}

.join_step li img {
	width: 150px;
	/* 리스트 항목 내 이미지의 크기를 설정 */
}

.join_step li span {
	position: absolute;
	/* 텍스트를 절대 위치로 설정 */
	bottom: 0;
	left: 50%;
	/* 텍스트를 중앙 하단에 위치 */
	color: #666;
	/* 텍스트 색상 설정 */
	line-height: 1.462em;
	/* 텍스트 줄 간격 설정 */
	white-space: nowrap;
	/* 텍스트가 줄바꿈되지 않도록 설정 */
	transform: translate(-50%, 0);
	/* 텍스트를 중앙 정렬 */
}

/* 회원가입 폼을 감싸는 컨테이너 스타일 */
.container {
	display: flex;
	flex-direction: column;
	position: absolute;
	gap: 40px; /* 박스들 사이의 간격 */
	padding: 100px; /* 컨테이너 내부 여백 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 박스 그림자 설정 */
	background-color: #fdfdfd; /* 박스 배경색 */
	top: 300px;
	width: 600px;
	height: auto;
}
.form-group {
	margin-bottom: 30px; /* 각 폼 그룹의 하단 마진을 설정합니다. */
	display: flex; /* 폼 그룹 내의 항목들을 플렉스 박스로 배치합니다. */
	align-items: center; /* 폼 그룹 내 항목들을 수직 중앙에 정렬합니다. */
}

.check_font {
	font-size: 12px; /* 메시지 크기 조정 */
	color: red; /* 기본 메시지 색상 설정 */
	margin-top: 5px; /* 메시지와 입력 필드 사이의 여백 */
}

.form-group label {
	width: 150px; /* 라벨의 너비를 150px로 설정합니다. */
	margin-right: 10px; /* 라벨과 입력 필드 사이의 여백을 설정합니다. */
	font-weight: bold; /* 라벨의 글씨를 두껍게 설정합니다. */
}

.form-group input {
	flex: 1; /* 입력 필드가 남은 공간을 모두 차지하도록 설정합니다. */
	padding: 8px; /* 입력 필드의 내부 여백을 설정합니다. */
	border: 1px solid #ccc; /* 입력 필드의 테두리 색을 연한 회색으로 설정합니다. */
}

.file-upload label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.file-upload input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.file-upload input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.file-upload label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.form-group button {
	background-color: #ff4714; /* 버튼의 배경색을 주황색으로 설정합니다. */
	color: #fff; /* 버튼의 글씨 색을 흰색으로 설정합니다. */
	border: none; /* 버튼의 기본 테두리를 제거합니다. */
	padding: 8px; /* 입력 필드의 내부 여백을 설정합니다. */
	margin-left: 20px;
}

.form-group input{
	width: 200px;


}


.submit_btn button {
	background-color: #ff4714; /* 버튼의 배경색을 주황색으로 설정합니다. */
	color: #fff; /* 버튼의 글씨 색을 흰색으로 설정합니다. */
	border: none; /* 버튼의 기본 테두리를 제거합니다. */
	padding: 8px; /* 입력 필드의 내부 여백을 설정합니다. */
	margin-left: 20px;
}

select {
	padding: 8px; /* 입력 필드의 내부 여백을 설정합니다. */
	border: 1px solid #ccc;
	/* 입력 필드의 테두리 색을 연한 회색으로 설정합니다. */
}

button:hover {
	color: #ffffffcc;
}

.submit_btn button{
	position:relative;
	left: 30%;
	width: calc(100% - 70%);
	text-align: center;
	height: 40px;
}
</style>
<script type="text/javascript" src="/js/jquery.js"></script>

<body>
	<header>
		<%@ include file="../header_white.jsp"%>
	</header>
	<div class="contents">
		<div class="content">
			<h1>아이디 찾기</h1>
		</div>
		<div class="content">
			<div class="container">
					<div class="form-group">
						<label for="user_id">아이디</label> 
						<span name="userid" id="user_id">${user_id}</span>
					</div>
					<div class="submit_btn">
					<a href="/view_jm/findPw">					
						<button id="findPw">비밀번호 찾기</button>
					</a>
					</div>
					<div class="submit_btn">
					<a href="/view_jm/login">					
						<button id="login">로그인</button>
					</a>
					</div>
			</div>
		</div>
	</div>
	<footer>
	<%@ include file="../footer.jsp" %>
	</footer>
</body>
</html>