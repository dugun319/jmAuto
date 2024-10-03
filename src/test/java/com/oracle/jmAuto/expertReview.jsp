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
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
*/

#fullBody {
	width:700px;
	height: 2250px;
	margin: 0px;
	padding: 0px;
}

#carBasicInfo {
	position: absolute;
	top: 125px;
	left: 57px;
	width: 600px;

}

#carBasicInfoModel {
	font-size: 20px;
	font-weight: 900;
	text-align: center;
	height: 55px;
}

.carBasicInfocol1 {
	width: 150px;
	height: 64px;
}

.carBasicInfocol3 {
	width: 120px;
}

.carBasicInforow1col24 {
	font-size: 18px;
	font-weight: 900;
	width: 150px;
	padding-top: 15px;
}

.carBasicInforow2col24 {
	font-size: 18px;
	font-weight: 900;
	width: 175px;
	padding-top: -2px;
}



</style>

</head>
	<body>
		<div id="fullBody">
			
			<img	src="<%=request.getContextPath()%>/images/main/kh_expertReviewBackground.png"
									width="700px" 
									height="2250px">
		</div>
		
		<div id="table">
			<table id="carBasicInfo">
				<tr>
					<td id="carBasicInfoModel" colspan="4">
						${carDetail.brand } &nbsp; 
						${carDetail.model } &nbsp;
						${carDetail.fuel }
					</td>
				</tr>
				
				<tr>
					<td class="carBasicInfocol1">
					</td>
					<td class="carBasicInforow1col24">
						${carDetail.car_num }
					</td>
					<td class="carBasicInfocol3">
					</td>
					<td class="carBasicInforow1col24">
						<c:set var="manu_date" value="${carDetail.manu_date }"/>
						${fn:substring(manu_date,0,2) } 년 / ${fn:substring(manu_date,2,4) } 월
					</td>
				</tr>
				
				<tr>
					<td class="carBasicInfocol1">
					</td>
					<td class="carBasicInforow2col24">
						<fmt:formatNumber 	value="${carDetail.mileage }" 	pattern="#,###,###"/> km
					</td>
					<td class="carBasicInfocol3">
					</td>
					<td class="carBasicInforow2col24">
						${carDetail.accident }
					</td>
				</tr>
				
			</table>
			
			<div id="mechanicName">
				
			</div>
		</div>		 			
	</body>
</html>