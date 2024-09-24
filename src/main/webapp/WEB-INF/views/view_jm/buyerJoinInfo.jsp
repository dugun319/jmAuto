<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body, html {
	margin: 0; /* 브라우저 기본 여백을 제거 */
	padding: 0; /* 브라우저 기본 패딩을 제거 */
	height: 100%; /* 화면 높이를 100%로 설정 */
	background-color: #fafafa; /* 페이지의 배경색을 연한 회색으로 설정합니다. */
	font-family: Pretendard;
}

.contents {
	align-items: center;/* 수직 중앙 정렬 */
	height: 1000px; /* 뷰포트 높이 100%로 설정 */
	padding-bottom: 300px;
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
/* 로그인 폼을 감싸는 컨테이너 */
.container {
	display: flex;
	flex-direction: column;
	position: absolute;
	top: 400px;
	gap: 40px; /* 박스들 사이의 간격 */
	background-color: #fdfdfd; /* 컨테이너의 배경색을 흰색에 가까운 연한 회색으로 설정합니다. */
	width: 600px; /* 컨테이너의 최대 너비를 600px로 설정합니다. */
	padding: 100px; /* 컨테이너의 내부 여백을 설정합니다. */
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	/* 컨테이너에 미세한 그림자를 추가하여 입체감을 줍니다. */
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

.form-group button {
	background-color: #ff4714; /* 버튼의 배경색을 주황색으로 설정합니다. */
	color: #fff; /* 버튼의 글씨 색을 흰색으로 설정합니다. */
	border: none; /* 버튼의 기본 테두리를 제거합니다. */
	padding: 8px; /* 입력 필드의 내부 여백을 설정합니다. */
	margin-left: 20px;
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

    // 주소찾기 다음 api
    function findAddr() {
        new daum.Postcode({
            oncomplete: function (data) {
                var roadAddr = data.roadAddress;
                var jibunAddr = data.jibunAddress;
                document.getElementById('user_zipcode').value = data.zonecode;
                if (roadAddr !== '') {
                    document.getElementById("user_addr1").value = roadAddr;
                } else if (jibunAddr !== '') {
                    document.getElementById("user_addr2").value = jibunAddr;
                }
            }
        }).open();
    }

    // 아이디 유효성 확인 함수
    function validateId() {
        // id value 저장
        var id = $("#user_id").val();
        // 확인 메세지 저장
        var idCheckMessage = $("#id_check");

        // 아이디에 공백이 있거나 아무것도 입력하지 않은 경우 
        if (id.trim() === "") {
            idCheckMessage.text("아이디를 입력해주세요.");
            idCheckMessage.css("color", "red");
            $("#submit_btn").attr("disabled", true);
            return false;
        }

        if (id.length < 4 || id.length > 12) {
            idCheckMessage.text("아이디는 4자 이상 12자 이하로 입력해주세요.");
            idCheckMessage.css("color", "red");
            $("#submit_btn").attr("disabled", true);
            return false;
        }

        idCheckMessage.text("");
        return true;
    }

    
    // 아이디 중복 확인
    function confirmId() {
        if (!validateId()) return;

        $.ajax({
            url: '/view_jm/confirmId',
            type: 'GET',
            dataType: 'json',
            data: { 'user_id': $("#user_id").val() },
            success: function (data) {
                var idCheckMessage = $("#id_check");
                if (data === 1) {
                    idCheckMessage.text("중복된 아이디입니다.");
                    idCheckMessage.css("color", "red");
                    $("#submit_btn").attr("disabled", true);
                } else {
                    idCheckMessage.text("사용 가능한 아이디입니다.");
                    idCheckMessage.css("color", "green");
                    $("#submit_btn").attr("disabled", false);
                }
            }
        });
    }

    function validatePassword() {
        var password = $("#user_pw").val();
        var passwordConfirm = $("#user_pw_confirm").val();

        if (password !== passwordConfirm) {
            $("#pw_check").text("비밀번호가 일치하지 않습니다.");
            $("#pw_check").css("color", "red");
            $("#submit_btn").attr("disabled", true);
        } else {
            $("#pw_check").text("");
            $("#submit_btn").attr("disabled", false);
        }
    }

    $(document).ready(function () {
        $("#user_pw_confirm").on("keyup", validatePassword);
    });



    // 이메일 인증 
    function emailCheck() {
        $.ajax({
            url: '/view_jm/sendAuthCode',
            type: 'POST',
            data: { 'user_email': $("#user_email").val() },
            success: function (response) {
                alert(response.message);
            },
            error: function () {
                alert("인증번호 전송 중 오류가 발생했습니다.");
            }
        });
    }


    function verifyAuthCode() {
        var authCode = $("#auth_code").val();
        $.ajax({
            url: '/view_jm/verifyAuthCode',
            type: 'POST',
            data: { 'auth_code': authCode },
            success: function (response) {
                if (response.valid) {
                    $("#verifyAuthCodeMessage").text("인증번호가 확인되었습니다.");
                    $("#verifyAuthCodeMessage").css("color", "green");
                } else {
                    $("#verifyAuthCodeMessage").text("인증번호가 틀렸습니다.");
                    $("#verifyAuthCodeMessage").css("color", "red");
                }
            },
            error: function () {
                alert("인증번호 확인 중 오류가 발생했습니다.");
            }
        });
    }

    $(document).ready(function () {
        $("#verifyAuthCodeBtn").on("click", verifyAuthCode);
    });
</script>
</head>
<body>
	<header>
		<%@ include file="../header2.jsp"%>
	</header>
	<div class="contents">
		<div class="content">
			<h1>회원가입</h1>
		</div>
		<div class="content">
			<ul class="join_step">
				<li><img src="../images/join/joinAgree_after.png"><span>약관동의</span></li>
				<li><img src="../images/join/joinInfo.png"><span>회원
						정보 입력</span></li>
				<li><img src="../images/join/joinOk_before.png"><span>가입신청</span></li>
			</ul>
		</div>
		<div class="content">
			<div class="container">
				<form method="post" name="frm" action="/view_jm/sellerJoinInfo_2">
					<div class="form-group">
						<label for="user_id">아이디</label> <input type="text" id="user_id"
							name="user_id" required>
							<P><div class="check_font" id="id_check"></div>
						<button type="button" id="id_check_btn" onclick="confirmId()">중복확인</button>
					</div>
					
					<div class="form-group">
						<label for="user_pw">비밀번호</label> <input type="password"
							id="user_pw" name="user_pw" required>
					</div>
					<div class="form-group">
						<label for="user_pw_confirm">비밀번호 확인</label> <input
							type="password" id="user_pw_confirm" name="user_pw_confirm"
							required>
						<div class="check_font" id="pw_check"></div>
					</div>

					<div class="form-group">
						<label for="user_name">이름</label> <input type="text"
							id="user_name" name="user_name" required>
					</div>

					<div class="form-group">
						<label for="user_tel">휴대폰 번호</label> <input type="text"
							id="user_tel" name="user_tel" required>
					</div>

					<div class="form-group">
						<label for="user_zipcode">우편번호</label> <input type="text"
							id="user_zipcode" name="user_zipcode" required>
						<button type="button" onclick="findAddr()">주소 검색</button>
					</div>

					<div class="form-group">
						<label for="user_addr1">주소</label> <input type="text"
							id="user_addr1" name="user_addr1" required>
					</div>

					<div class="form-group">
						<label for="user_addr2">상세주소</label> <input type="text"
							id="user_addr2" name="user_addr2" required>
					</div>
					<div class="form-group">
						<label for="user_email">이메일</label> <input type="email"
							id="user_email" name="user_email" required="required">
						<button type="button" onclick="emailCheck()">인증번호 전송</button>
					</div>
					<div class="form-group">
						<label for="auth_code">인증번호</label> <input type="text"
							id="auth_code" name="auth_code" required="required">
						<button type="button" id="verifyAuthCodeBtn">인증번호 확인</button>
						<p id="verifyAuthCodeMessage"></p>
					</div>
					<div class="submit_btn">
						<button type="submit" id="submit_btn">회원가입</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<footer>
	<%@ include file="../footer.jsp" %>
	</footer>
</body>

</html>