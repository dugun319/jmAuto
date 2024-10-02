<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body,html {
    margin: 0; /* 브라우저 기본 여백을 제거 */
    padding: 0; /* 브라우저 기본 패딩을 제거 */
    height: 100%; /* 화면 높이를 100%로 설정 */
    background-color: #fafafa; /* 페이지의 배경색을 연한 회색으로 설정합니다. */
    font-family: Pretendard;
}

h2 {
    text-align: center; /* 제목을 수평 중앙에 정렬합니다. */
    margin: 20px 0; /* 제목의 상하 마진을 설정합니다. */
}

/* 로그인 폼을 감싸는 컨테이너 */
.container {
    background-color: #fdfdfd; /* 컨테이너의 배경색을 흰색에 가까운 연한 회색으로 설정합니다. */
    width: 600px; /* 컨테이너의 최대 너비를 600px로 설정합니다. */
    margin: 0 auto; /* 컨테이너를 수평 중앙에 배치합니다. */
    padding: 100px; /* 컨테이너의 내부 여백을 설정합니다. */
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* 컨테이너에 미세한 그림자를 추가하여 입체감을 줍니다. */
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
.file-upload input[type="file"] {  /* 파일 필드 숨기기 */
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

.file-upload input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
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

/* named upload */
.file-upload .upload-name {
    display: inline-block;
    padding: .5em .75em;  /* label의 패딩값과 일치 */
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
}
/* imaged preview */
.file-upload .upload-display {  /* 이미지가 표시될 지역 */
    margin-bottom: 5px;
}

@media(min-width: 768px) { 
    .file-upload .upload-display {
        display: inline-block;
        margin-right: 5px;
        margin-bottom: 0;
    }
}

.file-upload .upload-thumb-wrap {  /* 추가될 이미지를 감싸는 요소 */
    display: inline-block;
    width: 54px;
    padding: 2px;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #fff;
}

.file-upload .upload-display img {  /* 추가될 이미지 */
    display: block;
    max-width: 100%;
    width: 100% \9;
    height: auto;
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

select{
    padding: 8px;/* 입력 필드의 내부 여백을 설정합니다. */
    border: 1px solid #ccc;
        /* 입력 필드의 테두리 색을 연한 회색으로 설정합니다. */
}

button:hover{
    color: #ffffffcc;
}


</style>
<script>
<script
src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

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

    function validateId() {
        var id = $("#user_id").val();
        var idCheckMessage = $("#id_check");

        if (id.trim() === "") {
            idCheckMessage.text("아이디를 입력해주세요.");
            idCheckMessage.css("color", "red");
            $("#reg_submit").attr("disabled", true);
            return false;
        }

        if (id.length < 4 || id.length > 12) {
            idCheckMessage.text("아이디는 4자 이상 12자 이하로 입력해주세요.");
            idCheckMessage.css("color", "red");
            $("#reg_submit").attr("disabled", true);
            return false;
        }

        idCheckMessage.text("");
        return true;
    }

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
                    $("#reg_submit").attr("disabled", true);
                } else {
                    idCheckMessage.text("사용 가능한 아이디입니다.");
                    idCheckMessage.css("color", "green");
                    $("#reg_submit").attr("disabled", false);
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
            $("#reg_submit").attr("disabled", true);
        } else {
            $("#pw_check").text("");
            $("#reg_submit").attr("disabled", false);
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

	<h2>회원가입</h2>
	<div class="container">
		<form method="post" name="frm" action="join">
			<div class="form-group">
				<label for="user_id">아이디</label> <input type="text" id="user_id"
					name="user_id" required>
				<button type="button" id="id_check_btn" onclick="confirmId()">중복확인</button>
			</div>
			<div class="check_font" id="id_check"></div>
			<div class="form-group">
				<label for="user_pw">비밀번호</label> <input type="password"
					id="user_pw" name="user_pw" required>
			</div>
			<div class="form-group">
				<label for="user_pw_confirm">비밀번호 확인</label> <input type="password"
					id="user_pw_confirm" name="user_pw_confirm" required>
				<div class="check_font" id="pw_check"></div>
			</div>

			<div class="form-group">
				<label for="user_name">이름</label> <input type="text" id="user_name"
					name="user_name" required>
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
				<form id="authCodeForm">
					<label for="user_email">이메일</label> <input type="email"
						id="user_email" name="user_email" required="required">
					<button type="button" onclick="emailCheck()">인증번호 전송</button>
				</form>
			</div>
			<div class="form-group">
				<label for="auth_code">인증번호</label> <input type="text"
					id="auth_code" name="auth_code" required="required">
				<button type="button" id="verifyAuthCodeBtn">인증번호 확인</button>
				<p id="verifyAuthCodeMessage"></p>
			</div>
			<div class="form-group">
				<label for="auth_code">예금주</label> <input type="text" id="account_name"
					name="account_name" required="required">
			</div>
			<div class="form-group">
				<label for="account_bank">은행명</label> 
				<select name="account_bank" id="account_bank">
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
			<div class="form-group">
				<label for="auth_code">계좌번호</label> 
				<input type="text" id="account_num" name="account_num" required="required">
			</div>
			<div class="submit_btn">
				<button type="submit" id="submit" onclick="location.href='/view_jm/sellerJoinInfo_2'">다음</button>
			</div>
		</form>
	</div>	
</body>

</html>