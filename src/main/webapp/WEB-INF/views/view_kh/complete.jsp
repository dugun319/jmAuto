<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<body>
		<%@ include file="../header_white.jsp" %>
		
		<h1>차량을 구매해 주셔서 감사합니다</h1>
	
		<hr>
	
		<h5>결제승인번호 : ${approveResponse.aid }</h5>
		<h5>결제고유번호 : ${approveResponse.tid }</h5>
		<h5>매장고유번호 : ${approveResponse.cid }</h5>
		<h5>정기결제번호 : ${approveResponse.sid }</h5>
		<h5>매물번호 : ${approveResponse.partner_order_id }</h5>
		<h5>판매자ID : ${approveResponse.partner_user_id}</h5>
		<h5>결제수단 : ${approveResponse.payment_method_type}</h5>
		<h5>상품이름 : ${approveResponse.item_name} </h5>
		<h5>상품코드 : ${approveResponse.item_code} </h5>
		<h5>상품수량 : ${approveResponse.quantity} </h5>
		<h5>결제요청시간 : ${approveResponse.created_at}</h5>
		<h5>결제승인시간 : ${approveResponse.approved_at }</h5>
		<h5>결제금액정보 : ${approveResponse.amount }</h5>
		<h5>총결재금액 : ${approveResponse.amount.total }</h5>
		<h5>비과제 : ${approveResponse.amount.tax_free }</h5>
		<h5>부가가치세 : ${approveResponse.amount.vat }</h5>
		<h5>포인트 : ${approveResponse.amount.point }</h5>
		<h5>할인금액 : ${approveResponse.amount.discount }</h5>
	
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
		<h1>판매정보</h1>
		
		<h5>구매자 : ${payment.user_id }</h5>
		<h5>승인번호 : ${payment.approval_num }</h5>
		<h5>승인일자 : ${payment.approval_date }</h5>
		<h5>매물번호 : ${payment.sell_num }</h5>
		<h5>전문가평가번호 : ${payment.expert_review_num }</h5>
		<h5>가격 : ${payment.price} 원</h5>
		<h5>세금 : ${payment.tax} 원</h5>
		<h5>대행수수료 : ${payment.fee} 원</h5>
		<h5>결제금액 : ${payment.total_price} 원</h5>
		<h5>판매수수료 : ${payment.buz_fee} 원</h5>
		<h5>판매자입금금액 : ${payment.buz_money} 원</h5>
		<h5>구매자이름 : ${payment.receiver_name }</h5>
		<h5>구매자전화번호 : ${payment.receiver_tel }</h5>
		<h5>구매자우편번호 : ${payment.receiver_zipcode }</h5>
		<h5>구매자주소1 : ${payment.receiver_addr1 }</h5>
		<h5>구매자주소2 : ${payment.receiver_addr2 }</h5>
		<h5>보험증명파일이름 : ${payment.insure_img_name }</h5>
		<h5>보험증명파일경로 : ${payment.insure_img_url }</h5>
		<h5>배송일자 : ${payment.delivery_date }</h5>
		<h5>결제구분 : ${payment.buy_type }</h5>
		
	</body>
</html>