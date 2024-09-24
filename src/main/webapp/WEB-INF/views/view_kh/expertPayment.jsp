<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
#btn-kakao {
	background-color: #FF4714;
	color: #FDFDFD;
	font-weight: 800;
	border: none;
	border-radius: 12px;
	padding: 10px 20px;
	cursor: pointer;
}
</style>

</head>
<body>
	<%@ include file="../header_white.jsp"%>
	<%
			String expert_review_num =  request.getParameter("expert_review_num");
	%>
	<h2>expert_review_num = <%=expert_review_num %></h2>

	<hr>
	<hr>
	<h1>구매자정보</h1>

	<h5>아이디 : ${buyer.user_id }</h5>
	<h5>비밀번호 : ${buyer.user_pw }</h5>
	<h5>이름 : ${buyer.user_name }</h5>
	<h5>전화번호 : ${buyer.user_tel }</h5>
	<h5>우편번호 : ${buyer.user_zipcode }</h5>
	<h5>주소1 : ${buyer.user_addr1}</h5>
	<h5>주소2 : ${buyer.user_addr2}</h5>
	<h5>이메일 : ${buyer.user_email}</h5>
	<h5>등록일 : ${buyer.user_regdate}</h5>
	<h5>사업자번호 : ${buyer.buz_num}</h5>
	<h5>자격증번호 : ${buyer.cert_num}</h5>
	<h5>등급 : ${buyer.user_level}</h5>
	<h5>유형 : ${buyer.user_type }</h5>
	<h5>삭제여부 : ${buyer.del_state }</h5>
	<h5>승인여부 : ${buyer.approval.total }</h5>


	<hr>
	<hr>
	<h1>제품정보</h1>

	<h5>리뷰번호 : ${expertReviewDetail.expert_review_num }</h5>
	<h5>매물번호 : ${expertReviewDetail.sell_num }</h5>	
	<h5>작성일 : ${expertReviewDetail.write_date }</h5>
	<h5>차량번호 : ${carDetail.car_num }</h5>
	<h5>차량모델 : ${carDetail.model }</h5>
	<h5>총점 : ${expertReviewDetail.score }</h5>	
	<h5>작성자 : ${seller.user_name } (${expertReviewDetail.user_id })</h5>
	
	<hr>
	<h3>기본사항</h3>
	<h5>성능/상태기록점검부 : ${expertReviewDetail.ess_state }</h5>
	<h5>주행거리 : ${expertReviewDetail.ess_mileage }</h5>
	<h5>자동차등록증 : ${expertReviewDetail.ess_regi }</h5>
	
	<hr>
	<h4>총평</h4>
	<h5>${expertReviewDetail.content }</h5>
	
	<hr>
	<h3>소모품</h3>
	<h5>엔진오일 : ${expertReviewDetail.egine_oil }</h5>
	<h5>엔진오일 : ${expertReviewDetail.brake_oil }</h5>
	<h5>냉각수 : ${expertReviewDetail.coolant }</h5>
	<h5>타이어 : ${expertReviewDetail.tire }</h5>
	<h5>브레이크패드 : ${expertReviewDetail.brake_pad}</h5>
	
	<h3>결제금액 : 5,500 원</h3>
	
	
	<hr>
	<hr>
	<h1>판매자정보</h1>
	<h5>아이디 : ${seller.user_id }</h5>
	<h5>비밀번호 : ${seller.user_pw }</h5>
	<h5>이름 : ${seller.user_name }</h5>
	<h5>전화번호 : ${seller.user_tel }</h5>
	<h5>우편번호 : ${seller.user_zipcode }</h5>
	<h5>주소1 : ${seller.user_addr1}</h5>
	<h5>주소2 : ${seller.user_addr2}</h5>
	<h5>이메일 : ${seller.user_email}</h5>
	<h5>등록일 : ${seller.user_regdate}</h5>
	<h5>사업자번호 : ${seller.buz_num}</h5>
	<h5>자격증번호 : ${seller.cert_num}</h5>
	<h5>등급 : ${seller.user_level}</h5>
	<h5>유형 : ${seller.user_type }</h5>
	<h5>삭제여부 : ${seller.del_state }</h5>
	<h5>승인여부 : ${seller.approval.total }</h5>
	

	<button id="btn-kakao">
		KakaoPay<br>결제요청 <i class="fa-solid fa-comment"></i>
	</button>
	<%@ include file="../footer.jsp"%>
</body>
</html>

