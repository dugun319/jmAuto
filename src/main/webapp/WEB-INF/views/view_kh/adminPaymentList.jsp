<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
/*
table, th, td, div {
	border: 1px solid black;
	border-collapse: collapse;
}
*/

body {
	text-align: center;
	align-items: center; 		/* 수평 중앙 정렬 */
	margin: 0;
	padding: 0;
	background-color: #fafafa;
	font-family: Pretendard;
}

#fullBody{
	width: 1320px;
	margin: 0px 300px;
	padding: 0;
}

#adminMenu{
	position: absolute;
	top: 235px;
	left: 370px;
}

.adminMenu{
	height: 40px;
	width: 200px;
	padding-right: 20px;
	font-size: 24px;
	font-weight: 950;
	color: #fafafa;
}

#searchDiv{
	position: absolute;
	top: 195px;
	left: 605px;
}

#searchDiv input {
	width: 200px;
	height: 45px;
	border-width: 0px;
	outline: none;
}

#searchButton{
	width: 100px;
	height: 45px;
	background-color: #FF4714;
	color: #FDFDFD;
	font-size: 16px;
	font-weight: 900;
	border: none;
	cursor: pointer;
}

#loginId{
	position: absolute;
	top: 130px;
	left: 1420px;
	font-size: 24px;
	font-weight: 900;
	color: #fafafa;
}

#buyerInfoTable{
	position: absolute;
	top: 255px;
	left: 620px;
	font-weight: 800;
}

.buyerInfoCell1{
	height: 35px;
	padding: 0px 6px;
	width: 160px;
}

.buyerInfoCell2{
	height: 35px;
	padding: 0px 6px;
	width: 260px;
}


#paymentListTable{
	position: absolute;
	top: 310px;
	left: 620px;
}

#paymentListTable{
	border: 2px solid black;
	border-collapse: collapse;
}

.paymentListCell{
	border: 2px solid black;
	border-collapse: collapse;
	height: 35px;
	padding: 0px 6px;
}

.paymentListCell button{
	height: 32px;
	background-color: #FF4714;
	color: #FDFDFD;
	font-weight: 900;
	border: none;
	cursor: pointer;
}


</style>

<script type="text/javascript">
	function sendRefundPassword(tid) {
		alert("환불비밀번호를 발송하였습니다!");
		var url = "/KH/pay/sendRefundPassword?tid=" + tid;		
		window.open(url, "_blank", 'width=410,height=410,location=no,status=no,scrollbars=no,top=100,left=300');
	}

</script>

</head>
<body>
	<div id="fullBody">
		<img	src="<%=request.getContextPath()%>/images/main/kh_adminBackground.png"
				width="1320px" 
				height="990px">
	</div>
	
	<div id="adminMenu">
		<table>
			<tr>
				<td class="adminMenu">
					환불승인
				</td>
			</tr>
			
			<tr>
				<td class="adminMenu">
					사용자관리
				</td>
			</tr>
				
			<tr>
				<td class="adminMenu">
					고객센터관리
				</td>
			</tr>
			
			<tr>
				<td class="adminMenu">
					매물관리
				</td>
			</tr>
		</table>
	</div>
	
	<div id="searchDiv">
		<form action="/KH/pay/paymentList">
			<input	type="text"		name="user_id"	placeholder="user_id"/>
			<input	type="hidden"	name="admin_id"	value="${admin_id }"/>
			<button type="submit"	id="searchButton">SEARCH</button>
		</form>
	</div>
	<div id="loginId">
		${admin_id }
	</div>
		
	<div id="buyerInfo">
		<table id="buyerInfoTable">
			<tr>
				<td class="buyerInfoCell1">
					고객ID: ${buyer.user_id }
				</td>
				
				<td class="buyerInfoCell1">
					고객이름: ${buyer.user_name }
				</td>
				
				<td class="buyerInfoCell2">
					전화번호: ${buyer.user_tel }
				</td>
				
				<td class="buyerInfoCell2">
					e-mail: ${buyer.user_email}
				</td>

			</tr>
		</table>
	</div>
	
	<div id="paymentListDiv">
		<table id="paymentListTable">
			<tr>
				<th class="paymentListCell">구분</th>
				<th class="paymentListCell">승인번호</th>
				<th class="paymentListCell">결제일시</th>
				<th class="paymentListCell">차량매물번호</th>
				<th class="paymentListCell">전문가리뷰번호</th>
				<th class="paymentListCell">결제금액</th>
				<th class="paymentListCell">취소승인번호발송</th>

			</tr>
			
		<c:forEach	var="paymentList"	items="${paymentList}"	varStatus="status" >
		<c:set		var="num"				value="${num+1 }" />
			<tr>
				<td class="paymentListCell">${num}</td>						
				<td class="paymentListCell">${paymentList.approval_num}</td>
				<td class="paymentListCell">${paymentList.approval_date}</td>
				<td class="paymentListCell">${paymentList.sell_num}</td>
				<td class="paymentListCell">${paymentList.expert_review_num}</td>
				<td class="paymentListCell">
					<fmt:formatNumber 	value="${paymentList.total_price}" 	pattern="#,###,###,###"/> 원
				</td>
				<td class="paymentListCell">
					<button onclick="sendRefundPassword('${paymentList.approval_num}')" >
						환불비밀번호발송
					</button>
				</td>				
			</tr>
		</c:forEach>
		</table>
	</div>
		<%-- 
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
		<h5>승인여부 : ${buyer.approval }</h5>
		 --%>
</body>
</html>