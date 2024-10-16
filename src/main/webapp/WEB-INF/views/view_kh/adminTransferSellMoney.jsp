<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath()%>/css/adminList.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
.listCell{
	text-align: center;
	height: 90px;
	font-size: 12px;
}
</style>
</head>
<body>

	<header>
		<div class="header_continer"><%@ include file="../header.jsp" %></div>
	   	<div class="menu_continer"><%@ include file="../manager_menu.jsp" %></div>
	</header>
	
	<div id="tableTitle"><h1>판매대금 입금</h1></div>
	<div id="fullbody">
	
		<div id="searchDiv">
			<form action="/KH/pay/transferSellMoney">
				<select name="search">
					<option value="user_id">판매자아이디</option>
					<option value="approval_num">승인번호</option>
					<option value="sell_num">매물번호</option>
					<option value="expert_review_num">전문가리뷰번호</option>
					<option value="">전체검색</option>
				</select>
				<input	type="text"			name="keyword"	id="autoComplete" 	placeholder="keyword" />
				<input	type="hidden"		name="admin_id"	value="${admin_id }" />
				<button type="submit"		id="searchButton">SEARCH</button>
				
			</form>
		</div>
		
		<div id="listDiv">
	
			<c:set var="num" value="${page.total - page.start + 1 }"></c:set>
			
			<table id=listTable">
				<tr>
					<th class="listCell" style="width: 40px;">구분</th>
					<th class="listCell" style="width: 150px;">승인번호</th>
					<th class="listCell" style="width: 60px;">결제일시</th>
					<th class="listCell" style="width: 60px;">차량매물번호</th>
					<th class="listCell" style="width: 60px;">전문가리뷰번호</th>
					<th class="listCell" style="width: 60px;">판매자아이디</th>
					<th class="listCell" style="width: 90px;">판매가격</th>
					<th class="listCell" style="width: 90px;">판매수수료</th>
					<th class="listCell" style="width: 90px;">입금예정금액</th>
					<th class="listCell" style="width: 120px;">계좌번호</th>
					<th class="listCell" style="width: 60px;">받는사람</th>
					<th class="listCell" style="width: 60px;">은행명</th>
					<th class="listCell" style="width: 90px;">입금실행</th>
	
				</tr>
				
			<c:forEach	var="transferList"	items="${transferList}"	varStatus="status" >
				<tr>
					<td class="listCell">${num}</td>						
					<td class="listCell">${transferList.approval_num}</td>
					<td class="listCell">${transferList.approval_date}</td>
					<td class="listCell">${transferList.sell_num}</td>
					<td class="listCell">${transferList.expert_review_num}</td>
					<td class="listCell">${transferList.user_id}</td>
					<td class="listCell">
						<fmt:formatNumber 	value="${transferList.price}" 	pattern="#,###,###,###"/> 원
					</td>
					<td class="listCell">
						<fmt:formatNumber 	value="${transferList.buz_fee}" 	pattern="#,###,###,###"/> 원
					</td>
					<td class="listCell">
						<fmt:formatNumber 	value="${transferList.buz_money}" 	pattern="#,###,###,###"/> 원
					</td>
					<td class="listCell">${transferList.account_num}</td>
					<td class="listCell">${transferList.account_name}</td>
					<td class="listCell">${transferList.account_bank}</td>
					
					<td class="listCell">
						<button type="button" id="transferButton"	onclick="location.href='https://link.kakaopay.com/_/8E09WVx'">송금</button>
					</td>				
				</tr>
			<c:set		var="num"				value="${num - 1 }" />
			</c:forEach>
			</table>
		
		</div>
		
		<div id="pagingDiv">
			<div id="paging">
				<c:if test="${page.startPage > page.pageBlock }">
					<a href="/KH/pay/paymentListCon?currentPage=${page.startPage - page.pageBlock }&admin_id=${admin_id}&search=${originalTransferList.search}&keyword=${originalTransferList.keyword}">[Previous]</a>
				</c:if>
				
				<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">
					<a href="/KH/pay/paymentListCon?currentPage=${i }&admin_id=${admin_id}&search=${originalTransferList.search}&keyword=${originalTransferList.keyword}">[${i }]</a>
				</c:forEach>
				
				<c:if test="${page.startPage < page.pageBlock }">
					<a href="/KH/pay/paymentListCon?currentPage=${page.startPage + page.pageBlock }&admin_id=${admin_id}&search=${originalTransferList.search}&keyword=${originalTransferList.keyword}">[Next]</a>
				</c:if>
			</div>
		</div>
	
	</div>
	
</body>
</html>