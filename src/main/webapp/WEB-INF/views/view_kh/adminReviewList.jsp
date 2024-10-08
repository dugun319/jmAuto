<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath()%>/css/adminPayment.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<nav class="nav__cont">
		<img alt="logo" src="<%=request.getContextPath()%>/images/main/로고_icon_2.png" class="nav__cont_logo">
	  <ul class="nav">
	    <li class="nav__items3">
		  <img alt="icon" src="<%=request.getContextPath()%>/images/main/회원관리_icon.png" class="nav_items_img3">
	      <a href="/view_ms/buyList" class="nav_items_text3">회원</a>
	      <div class="mon_nav_items">
	      	<a>회원관리</a>
	      	<a>가입요청관리</a>
	      </div>
	    </li>
	      
	    <li class="nav__items3">
	      <img alt="icon" src="<%=request.getContextPath()%>/images/main/차량관리_icon.png" class="nav_items_img3">
	     <a href="" class="nav_items_text3">차량</a>
	     <div class="mon_nav_items">
	      	<a>차량관리</a>
	      	<a>전문가 리뷰 관리</a>
	      	<a>환불</a>
	      </div>
	    </li>
	      
	    <li class="nav__items3">
	      <img alt="icon" src="<%=request.getContextPath()%>/images/main/CS관리_icon.png" class="nav_items_img3">
	      <a href="/manager/CS/faq" class="nav_items_text3">CS</a>
	      <div class="mon_nav_items">
	      	<a href="/manager/CS/faq">자주 묻는 질문(FAQ)</a>
	      	<a href="/manager/CS/gogi">공지사항 및 약관</a>
	      	<a>문의내역</a>
	      </div>
	    </li>
	  </ul>
	</nav>
	
	<div id="fullbody">
	
		<div id="searchDiv">
			<form action="/KH/pay/expertReviewListCon">
				<select name="search">
					<option value="user_id">회원아이디</option>
					<option value="approval_num">승인번호</option>
					<option value="sell_num">매물번호</option>
					<option value="expert_review_num">전문가리뷰번호</option>
					<option value="buy_type">결제구분(1:차량/2:리뷰)</option>
				</select>
				<input	type="text"			name="keyword"	placeholder="keyword" />
				<input	type="hidden"		name="admin_id"	value="${admin_id }" />
				<button type="submit"		id="searchButton">SEARCH</button>
				
				<span id="loginId">LoginID: ${admin_id }</span>
			</form>
		</div>
		
		<div id="tableTitle">전문가리뷰 관리</div>
		
		<div id="paymentListDiv">
	
			<c:set var="num" value="${page.total - page.start + 1 }"></c:set>
			
			<table id="paymentListTable">
				<tr>
					<th class="paymentListCell" style="width: 50px;">구분</th>
					<th class="paymentListCell" style="width: 200px;">승인번호</th>
					<th class="paymentListCell" style="width: 100px;">결제일시</th>
					<th class="paymentListCell" style="width: 150px;">차량매물번호</th>
					<th class="paymentListCell" style="width: 150px;">전문가리뷰번호</th>
					<th class="paymentListCell" style="width: 120px;">구매자ID</th>
					<th class="paymentListCell" style="width: 150px;">결제금액</th>
					<th class="paymentListCell" style="width: 200px;">취소승인번호발송</th>
	
				</tr>
				
			<c:forEach	var="paymentList"	items="${paymentList}"	varStatus="status" >
				<tr>
					<td class="paymentListCell">${num}</td>						
					<td class="paymentListCell">${paymentList.approval_num}</td>
					<td class="paymentListCell">${paymentList.approval_date}</td>
					<td class="paymentListCell">${paymentList.sell_num}</td>
					<td class="paymentListCell">${paymentList.expert_review_num}</td>
					<td class="paymentListCell">${paymentList.user_id}</td>
					<td class="paymentListCell">
						<fmt:formatNumber 	value="${paymentList.total_price}" 	pattern="#,###,###,###"/> 원
					</td>
					<td class="paymentListCell">
						<button onclick="sendRefundPassword('${paymentList.approval_num}')" >
							환불비밀번호발송
						</button>
					</td>				
				</tr>
			<c:set		var="num"				value="${num - 1 }" />
			</c:forEach>
			</table>
		
		</div>
		
		<div id="pagingDiv">
			<div id="paging">
				<c:if test="${page.startPage > page.pageBlock }">
					<a href="/KH/pay/expertReviewListCon?currentPage=${page.startPage - page.pageBlock }&admin_id=${admin_id}&search=${originalPaymentList.search}&keyword=${originalPaymentList.keyword}">[Previous]</a>
				</c:if>
				
				<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">
					<a href="/KH/pay/expertReviewListCon?currentPage=${i }&admin_id=${admin_id}&search=${originalPaymentList.search}&keyword=${originalPaymentList.keyword}">[${i }]</a>
				</c:forEach>
				
				<c:if test="${page.startPage < page.pageBlock }">
					<a href="/KH/pay/expertReviewListCon?currentPage=${page.startPage + page.pageBlock }&admin_id=${admin_id}&search=${originalPaymentList.search}&keyword=${originalPaymentList.keyword}">[Next]</a>
				</c:if>
			</div>
		</div>
	
	</div>
	
</body>
</html>