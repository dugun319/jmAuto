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
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
body{
	margin: 0px;
	padding: 30px;
}

table, th, td{
	margin: 0px;
	padding: 0px;
	border-collapse: collapse;
}

#sellNum {
	position: absolute;
	top: 170px;
	left: 500px;
	font-size: 24px;
	font-weight: 700;
}

#buyerDiv{
	position: absolute;
	top: 223px;
	left: 950px;
	width: 320px;
	height: 170px;
}

.buyerDivLeftCell{
	width: 160px;
	height: 56px;
	text-align: left;
	font-size: 18px;
	font-weight: 700;	
}

.buyerDivRighrCell{
	width: 160px;
	height: 56px;
	text-align: right;
	font-family: '궁서체';
	font-size: 28px;
	font-weight: 900;	
}

#contractDate1{
	position: absolute;
	top: 600px;
	left: 300px;
	font-size: 24px;
	font-weight: 700;
}

#carDetailDiv{
	position: absolute;
	top: 701px;
	left: 300px;
	width: 895px;
	height: 245px;
	text-align: right;
	font-size: 18px;
	font-weight: 700;
	border: 1px solid black;

}

.carDetailLeftCell{
	border: 1px solid black;
	width: 260px;
	height: 48px;
}

.carDetailRightCell{
	border: 1px solid black;
	width: 375px;
	height: 48px;
}

</style>
</head>
<body>
	<div id="screenShot">
		<img	src="<%=request.getContextPath()%>${sellerInfo.buz_contract_url }"
				width="1250px" 
				height="1890px">
				
		<div id="sellNum">
			${carDetail.sell_num }
		</div>
		
		<div id="buyerDiv">
			<table>
				<tr>
					<td class="buyerDivLeftCell">
						${buyer.user_name }
					</td>
					<td class="buyerDivRighrCell">
						${buyer.user_name }
					</td>
				</tr>
				
				<tr>
					<td class="buyerDivLeftCell" colspan="2">
						${buyer.user_tel }
					</td>
				</tr>
				
				<tr>
					<td class="buyerDivLeftCell" colspan="2">
						${buyer.user_addr1 }&nbsp;${buyer.user_addr2 }
					</td>
				</tr>
			</table>
		</div>
		
		<div id="contractDate1">
			${sellerInfo.contract_date }
		</div>
		
		<div id="carDetailDiv">
			<table>
				<tr>
					<td class="carDetailLeftCell">
						${carDetail.car_num }
					</td>
					<td class="carDetailLeftCell">
					</td>
					<td class="carDetailRightCell">
						<fmt:formatNumber 	value="${carDetail.mileage }" 	pattern="#,###,###"/>
					</td>
				</tr>
				
				<tr>
					<td class="carDetailLeftCell">
						${carType }
					</td>
					<td class="carDetailLeftCell">
					</td>
					<td class="carDetailRightCell">
						${carDetail.brand } ${carDetail.model }
					</td>
				</tr>
				
				<tr>
					<td class="carDetailLeftCell">
					</td>
					<td class="carDetailLeftCell">
					</td>
					<td class="carDetailRightCell">
						<fmt:formatNumber 	value="${carDetail.price * 1700 + 50000}" 	pattern="#,###,###,###"/>
					</td>
				</tr>
				
				<tr>
					<td class="carDetailLeftCell">
						<fmt:formatNumber 	value="${carDetail.price * 11700 + 50000}" 	pattern="#,###,###,###"/>
					</td>
					<td class="carDetailLeftCell">
					</td>
					<td class="carDetailRightCell">
					</td>
				</tr>
				
				<tr>
					<td class="carDetailLeftCell">
						계약일로부터 14일 이내
					</td>
					<td class="carDetailLeftCell">
					</td>
					<td class="carDetailRightCell">
						<c:set var="repossession" value="${carDetail.repossession }" />
						<c:choose>
							<c:when test="${repossession eq 1}">없음</c:when>
							<c:otherwise>있음</c:otherwise>
						</c:choose>
						
					</td>
				</tr>
			</table>		
		</div>
			
	</div>
</body>
</html>