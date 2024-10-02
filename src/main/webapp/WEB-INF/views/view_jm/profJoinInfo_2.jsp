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
	padding-bottom: 600px;
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
	flex-wrap: wrap; /* 줄바꿈을 허용 */
}

.check_font{
	position: relative;
	left: 165px;
    flex-basis: 100%; /* 이 요소만 한 줄을 차지하게 함 */
	margin-top: 0px ;
	margin-bottom: 0px ;
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

.form-group input[type="text"]:focus, input[type="password"]:focus {
	border-color: #ff4714;
	outline: none;
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
	border: 1px solid #ccc; /* 입력 필드의 테두리 색을 연한 회색으로 설정합니다. */
	width: 25%;
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

#user_email3{
	width: 50px;
}

button:disabled {
	background-color: #d3d3d3;
	cursor: not-allowed;
}
</style>
<script type="text/javascript" src="/js/jquery.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
// 주소 찾기 다음 api
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
				// 상세 주소에 자동 포커스
				document.getElementById("user_addr2").focus();
            }
        }).open();
    }


	// 아이디 유효성 확인
function validateId() {
	// 아이디 정규 표현식
    const idRegex = /^[a-z][a-z0-9_]{3,11}$/; // 아이디: 소문자, _, 4~12글자
    var id = $("#user_id").val().trim();
    var idCheckMessage = $("#idCheckMessage");

    idCheckMessage.text(""); // 에러 메시지 초기화

    if (id === "") {
        showError("아이디를 입력해주세요.", "#idCheckMessage");
        return false;
    }

    if (id.length < 4 || id.length > 12) {
        showError("아이디는 4자 이상 12자 이하로 입력해주세요.", "#idCheckMessage");
        return false;
    }

    if (!idRegex.test(id)) {
        showError("아이디는 소문자로 시작하고, 소문자, 숫자, _ 만 허용됩니다.", "#idCheckMessage");
        return false;
    }

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
            var idCheckMessage = $("#idCheckMessage");
            if (data === 1) {
                showError("중복된 아이디 입니다", "#idCheckMessage");
				return false;
            } else {
                idCheckMessage.text("사용 가능한 아이디입니다.").css("color", "green");
                return true;
            }
        }
    });
}
// 비밀번호 유효성 확인
function validatePassword() {
    const pwRegex = /^[A-Za-z0-9_@!]{6,12}$/; // 비밀번호: 대소문자, 숫자, _, @, !, 6~12글자
    var password = $("#user_pw").val().trim();
    var pwCheckMessage = $("#pwCheckMessage"); // 비밀번호 입력 메시지
	
	// 에러 메시지 초기화
    pwCheckMessage.text(""); 

    if (password === "") {
		showError("비밀번호를 입력해주세요.", "#pwCheckMessage");
        $("#user_pw_confirm").attr("disabled", true); // 비밀번호 확인 비활성화
        return false;
    }
	
    if(password > 6 || password <12){
			showError("비밀번호는 6자 이상 12자 이하로 입력해주세요.", "#pwCheckMessage");
			// 비밀번호 확인 비활성화
			$("#user_pw_confirm").attr("disabled", true);
			return false;
		}

		// 입력 값이 정규 표현식에 맞지 않은 경우
		if (!pwRegex.test(password)){
			showError("비밀번호는 대소문자, 숫자, !, _, @ 만 입력해주세요.", "#pwCheckMessage");
			$("#user_pw_confirm").attr("disabled", true);
			return false;
		}

    // 비밀번호가 유효하면 비밀번호 확인 활성화 및 성공 메시지 표시
    $("#user_pw_confirm").attr("disabled", false);
    pwCheckMessage.text("사용 가능한 비밀번호입니다.").css("color", "green");
    return true;
}

// 비밀번호 확인 유효성 확인
function validatePasswordConfirm() {
    var password = $("#user_pw").val().trim();
    var passwordConfirm = $("#user_pw_confirm").val().trim();
    var pwConfirmMessage = $("#pwConfirmMessage"); // 비밀번호 확인 메시지
	
    pwConfirmMessage.text(""); // 에러 메시지 초기화

    if (password !== passwordConfirm) {
       showError("비밀번호가 일치하지 않습니다.", "#pwConfirmMessage");
	   $("#submit_btn").attr("disabled", true); // 비밀번호가 일치하지 않으면 버튼 비활성화
	   return false;
    } 
		pwConfirmMessage.text("비밀번호가 일치합니다.").css("color", "green");
   
    return true;
}



function validateName(){
	// 정규 표현식
	const nameRegex = /^[가-힣]+$/; // 이름: 한글만 허용
	
	var name = $("#user_name").val().trim();
	var nameCheckMessage = $("#nameCheckMessage");

	nameCheckMessage.text(""); // 에러 메시지 초기화

	if(!nameRegex.test(name)){
		showError("한글을 입력해주세요", "#nameCheckMessage");

		return false;
	}


	return true;
}
// 전화번호 유효성 확인
function validatePhone() {
	const phoneRegex = /^\d{2,3}-\d{3,4}-\d{4}$/; // 전화번호: XXX-XXXX-XXXX 형식
    var phone = $("#user_tel").val().trim();
    var phoneCheckMessage = $("#phoneCheckMessage");
	
    phoneCheckMessage.text(""); // 에러 메시지 초기화
	
    if (!phoneRegex.test(phone)) {
		showError("전화번호는 XXX-XXXX-XXXX 형식으로 입력해주세요.", "#phoneCheckMessage");
        return false;
    }
	
    return true;
}

$(function(){
	//직접입력 인풋박스 기존에는 숨어있다가
    $("#user_email3").hide();
    $("#user_email2").change(function() {
		//직접입력을 누를 때 나타남
        if($("#user_email2").val() == "direct") {
			$("#user_email3").show();
			$("#user_email2").css("width","25px")
        }  else {
			$("#user_email3").hide();
			$("#user_email2").css("width", ""); // 기본 크기로 되돌림
        }
    }) 
});


// 이메일 유효성 확인 및 전체 이메일을 user_email로 설정
function validateEmail() {
	// const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; // 이메일: 기본적인 이메일 형식
	var email = $("#user_email1").val().trim();
	var emailDomain = $("#user_email2").val(); // 지정된 도메인 값
	var emailDirect = $("#user_email3").val().trim(); // 직접 입력한 도메인 값

	if (emailDomain  == "direct"){
		// 직접 입력된 도메인 사용 
		emailDomain = emailDirect; 
	}
	// 이메일 전체 합치기
	var fullEmail = email + "@" + emailDomain;
	var emailCheckMessage = $("#email_check");

	// 에러 메시지 초기화
    emailCheckMessage.text(""); 

	// 이메일 유효성 검사 정규식
	const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; 

	if (!emailRegex.test(fullEmail)) {
		showError("유효한 이메일 주소를 입력해주세요.", "#email_check");
		return false;
	}

	 // 이메일이 유효하면 hidden input에 값을 설정
	 $("#hidden_user_email").val(fullEmail);
    
    return true;
}

	// 에러 메시지 출력 및 submit 버튼 비활성화
	function showError(message, elementId) {
    $(elementId).text(message).css("color", "red");
    $("#submit_btn").attr("disabled", true);
}

// submit 버튼 활성화
function enableSubmit() {
    if (validateId() && validatePassword() && validatePasswordConfirm() && validatePhone() && validateEmail()) {
        $("#submit_btn").attr("disabled", false);
    } else {
        $("#submit_btn").attr("disabled", true);
    }
}
// 이벤트 핸들러
$(document).ready(function () {
    $("#user_id").on("input", function() {
        validateId();
        enableSubmit();
    });

    $("#user_pw").on("input", function() {
        validatePassword();
        enableSubmit();
    });
   
    $("#user_pw_confirm").on("input", function() {
        validatePasswordConfirm();
        enableSubmit();
    });

    $("#user_name").on("input", function() {
        validateName();
        enableSubmit();
    });

    $("#user_tel").on("input", function() {
        validatePhone();
        enableSubmit();
    });

    $("#user_email1, #user_email2, #user_email3").on("input", function() {
        validateEmail();
        enableSubmit();
    });
});


    // 이메일 인증 
    function emailCheck() {

		var emailCheckMessage = $("#email_check");

        $.ajax({
            url: '/view_jm/sendAuthCode',
            type: 'POST',
            data: { 'user_email': $("#hidden_user_email").val() },
            success: function (response) {
				emailCheckMessage.text("인증번호가 전송 되었습니다").css("color", "green");
            },
            error: function () {
                emailCheckMessage.text("인증번호가  전송 실패하였습니다.").css("color", "red");
            }
        });
    }


    function verifyAuthCode() {
        var authCode = $("#auth_code").val().trim();
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



	const hypenTel = (target) => {
 	target.value = target.value
   .replace(/[^0-9]/g, '')
   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}
</script>
</head>
<body>
	<header>
		<%@ include file="../header_white.jsp"%>
	</header>
	<div class="contents">
		<div class="content">
			<h1>회원가입</h1>
		</div>
		<div class="content">
			<ul class="join_step">
				<li><img src="../images/join/joinAgree_after.png"><span>약관동의</span></li>
				<li><img src="../images/join/certInfo_after.png"><span>자격 인증</span></li>
				<li><img src="../images/join/joinInfo.png"><span>회원
						정보 입력</span></li>
				<li><img src="../images/join/joinOk_before.png"><span>가입신청</span></li>
			</ul>
		</div>
		<div class="content">
			<div class="container">
				<form method="post" name="frm" action="/view_jm/profJoinRequest">

					<!-- 아이디 입력 -->
					<div class="form-group">
						<label for="user_id">아이디</label> 
						<input type="text" id="user_id"	name="user_id">
							<button type="button" id="id_check_btn" onclick="confirmId()">중복확인</button>
							<p class="check_font" id="idCheckMessage"></p>
						</div>
					
					<!-- 비밀번호 입력 -->
					<div class="form-group">
						<label for="user_pw">비밀번호</label>
						<input type="password" id="user_pw" name="user_pw">
						<p class="check_font" id="pwCheckMessage"></p>
					</div>

					<!-- 비밀번호 확인 입력 -->
					<div class="form-group">
						<label for="user_pw_confirm">비밀번호 확인</label>
						<input type="password" id="user_pw_confirm" name="user_pw_confirm"> 
						<p class="check_font" id="pwConfirmMessage"></p>
					</div>

					<!-- 이름 입력 -->
					<div class="form-group">
						<label for="user_name">이름</label> 
						<input type="text" 	id="user_name" name="user_name">
							<p class="check_font" id="nameCheckMessage"></p>
					</div>

					<!-- 휴대폰 번호 입력 -->
					<div class="form-group">
						<label for="user_tel">휴대폰 번호</label> 
						<input type="text"	id="user_tel" name="user_tel" placeholder="-를 제외하고 입력해주세요" oninput="hypenTel(this)">
							<p class="check_font" id="phoneCheckMessage"></p>
					</div>

					<!-- 우편번호 입력 -->
					<div class="form-group">
						<label for="user_zipcode">우편번호</label> <input type="text"
							id="user_zipcode" name="user_zipcode" required>
						<button type="button" onclick="findAddr()">주소 검색</button>
					</div>
					
					<!-- 주소 입력 -->
					<div class="form-group">
						<label for="user_addr1">주소</label> <input type="text"
							id="user_addr1" name="user_addr1" required>
					</div>

					<!-- 상세주소 입력 -->
					<div class="form-group">
						<label for="user_addr2">상세주소</label> <input type="text"
							id="user_addr2" name="user_addr2" required>
					</div>

					<!-- 이메일 입력 -->
					<div class="form-group">
						<label for="user_email">이메일</label> 
						<input type="text" id="user_email1" name="user_email1" required="required" style="width: 30px;">
							&nbsp;@&nbsp;
							<input type="text" id="user_email3" name="selboxDirect"/>
							<select id="user_email2" name="email_domain">
								<option value="naver.com">naver.com</option>
								<option value="naver.com">daum.net</option>
								<option value="naver.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="direct">직접입력</option>
							</select>
						<button type="button" onclick="emailCheck()">인증번호 전송</button>
						<p class="check_font" id="email_check"></p>
						<!-- hidden input to hold the full email value -->
    					<input type="hidden" id="hidden_user_email" name="user_email" />
					</div>

					<!-- 인증번호 입력 -->
					<div class="form-group">
						<label for="auth_code">인증번호</label> 
						<input type="text" id="auth_code" name="auth_code">
						<button type="button" id="verifyAuthCodeBtn">인증번호 확인</button>
						<p class="check_font" id="verifyAuthCodeMessage"></p>
					</div>

					<!-- 예금주 입력 -->
					<div class="form-group">
						<label for="account_name">예금주</label> <input type="text"
							id="account_name" name="account_name" required="required">
					</div>

					<!-- 은행명 입력 -->
					<div class="form-group">
						<label for="account_bank">은행명</label> <select name="account_bank"
							id="account_bank">
							<option value="기업은행">기업은행</option>
							<option value="국민은행">국민은행</option>
							<option value="카카오뱅크">카카오뱅크</option>
							<option value="농협은행">농협은행</option>
							<option value="신한은행">신한은행</option>
							<option value="산업은행">산업은행</option>
							<option value="우리은행">우리은행</option>
							<option value="한국씨티은행">한국씨티은행</option>
							<option value="하나은행">하나은행</option>
							<option value="SC제일은행">SC제일은행</option>
							<option value="경남은행">경남은행</option>
							<option value="광주은행">광주은행</option>
							<option value="iM뱅크">iM뱅크</option>
							<option value="도이치은행">도이치은행</option>
							<option value="뱅크오브아메리카">뱅크오브아메리카</option>
							<option value="부산은행">부산은행</option>
							<option value="산림조합중앙회">산림조합중앙회</option>
							<option value="저축은행">저축은행</option>
							<option value="새마을금고">새마을금고</option>
							<option value="수협은행">수협은행</option>
							<option value="신협중앙회">신협중앙회</option>
							<option value="우체국">우체국</option>
							<option value="전북은행">전북은행</option>
							<option value="제주은행">제주은행</option>
							<option value="중국건설은행">중국건설은행</option>
							<option value="중국공상은행">중국공상은행</option>
							<option value="중국은행">중국은행</option>
							<option value="BNP파리바은행">BNP파리바은행</option>
							<option value="HSBC은행">HSBC은행</option>
							<option value="JP모간체이스은행">JP모간체이스은행</option>
							<option value="케이뱅크">케이뱅크</option>
							<option value="토스뱅크">토스뱅크</option>
						</select>
					</div>

					<!-- 계좌번호 입력-->
					<div class="form-group">
						<label for="account_num">계좌번호</label> <input type="text"
							id="account_num" name="account_num" required="required" placeholder="-를 제외하고 입력해주세요">
					</div>

					<!-- 회원가입 버튼 -->
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