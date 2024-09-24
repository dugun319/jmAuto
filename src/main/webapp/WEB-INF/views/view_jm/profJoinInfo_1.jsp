<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="../css/join.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.join_step li {
        		display: inline-block;
				position: relative;
        		top: 10px;
				left: 175px;
        		
      		}
      		.join_step li img {
        		width:150px; 
      		}
      		.join_step li span {
        		position:absolute; 
				bottom:0; left:50%; 
				color:#666; 
				line-height:1.462em; 
				white-space:nowrap; 
				transform:translate(-50%, 0);
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
	<%@ include file="../header2.jsp" %>
</header>
	<h2>회원가입</h2>
	<ul class="join_step">
				<li><img src="../images/join/joinAgree_before.png"><span>약관동의</span></li>
				<li><img src="../images/join/joinInfo_before.png"><span>회원 정보 입력</span></li>
				<li><img src="../images/join/joinOk_before.png"><span>가입완료</span></li>
			</ul>
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
				<label for="auth_code">예금주</label> <input type="text" id="auth_code"
					name="auth_code" required="required">
			</div>
			<div class="form-group">
				<label for="auth_code">은행명</label> <select name="">
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
				<label for="auth_code">계좌번호</label> <input type="text"
					id="auth_code" name="auth_code" required="required">
			</div>
			<div class="submit_btn">
				<button type="submit" id="submit">다음</button>
			</div>
			<footer>
				<%@ include file="../footer.jsp" %>
			</footer>
		</form>
	</div>
</body>

</html>