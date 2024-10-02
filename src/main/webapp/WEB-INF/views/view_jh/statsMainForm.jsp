<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<link href="/css/jh.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> 

	<!-- 분기별 실적 -->
	<script type="text/javascript">
		var year = ${year};
		//분기별 실적 데이터 
	    var quarterlyResults = {
	        <c:forEach var="entry" items="${quarterly_results}" varStatus="status">
	            "${entry.key}": {
	                QUARTER: ${entry.value.QUARTER},
	                TOTAL_PRICE: ${entry.value.TOTAL_PRICE},
	                TOTAL_SALES: ${entry.value.TOTAL_SALES}
	            } <c:if test="${!status.last}">,</c:if>
	        </c:forEach>
	    };
	</script>
		
	<!-- 연도별 실적 -->
	<script type="text/javascript">
		//연도별 실적 데이터
    	var annualPerformance = {};
    	<c:forEach var="entry" items="${annual_performance}">
        	annualPerformance["${entry.key}"] = {
	            YEAR: ${entry.value.YEAR},
	            TOTAL_PRICE: ${entry.value.TOTAL_PRICE},
	            TOTAL_SALES: ${entry.value.TOTAL_SALES}
        	};
		</c:forEach>
	</script>

	<!-- 차량/브랜드별 판매실적 -->
	<script type="text/javascript">
		var year = ${year};
		//차량별 실적 데이터
	    var carTypeResults = {};
	    <c:forEach var="entry" items="${car_type_results}">
	        var carType = "${entry.key}";
	        var sales = ${entry.value.SALES}; 
	        carTypeResults[carType] = sales; 
	    </c:forEach>
	    console.log("Car Type Results:", carTypeResults); // 디버깅 위해 출력

    	// 브랜드별 실적 데이터
	    var brandTypeResults = {};
	    <c:forEach var="entry" items="${brand_type_results}">
	        var brand = "${entry.key}";
	        var sales = ${entry.value.SALES}; 
	        brandTypeResults[brand] = sales; 
	    </c:forEach>
	    console.log("Brand Type Results:", brandTypeResults); // 디버깅 위해 출력
	</script>
	
	<!-- 재고목록 조회 -->
	<script type="text/javascript">
		//재고목록 데이터
		 var vehicleDataList = [
            <c:forEach var="entry" items="${jago_list}" varStatus="status"> {
                vehicleNumber: '${entry.value.get("매물번호")}',
                date: '${entry.value.get("날짜")}',  // 날짜를 올바르게 설정
                carNumber: '${entry.value.get("차량번호")}',
                model: '${entry.value.get("모델")}',
                carType: '${entry.value.get("차종")}',
                price: ${entry.value.get("차량가격")},
                status: '${entry.value.get("현재상태")}'
            } <c:if test="${!status.last}">,</c:if>
            </c:forEach>
        ];
	</script>


	<script type="text/javascript">
    // JSP에서 받은 리스트 데이터를 JSON 형태로 변환하여 자바스크립트에 전달
    var carData = [
        <c:forEach var="car" items="${receiving_list}">
            {
                sellNum: "${car.SELL_NUM}",             // 매물번호
                approvalDate: "${car.REG_DATE}",       // 등록일자
                carNum: "${car.CAR_NUM}",               // 차량번호
                model: "${car.MODEL}",                   // 모델
                carType: "${car.CAR_TYPE}",             // 차종
                price: ${car.PRICE},                     // 차량가격
                sale: "${car.SALE}"                      // 현재상태
            }<c:if test="${!carStatus.last}">,</c:if>
        </c:forEach>
    ];
</script>












	<!-- 분기별 실적차트(막대차트) -->
	<c:if test="${quarterlyDataFetched}">
		<script type="text/javascript" src="../javaScript/quarterly_chart.js"></script> 
	</c:if> 
	
	<!-- 연도별 실적차트(막대차트) -->
	<c:if test="${annualDataFetched}"> 
		<script type="text/javascript" src="../javaScript/annual_chart.js"></script> 
	</c:if>   
    
    <!-- 차량/브랜드별 실적차트(원형차트)-->
	<c:if test="${brand_typeDataFetched}"> 
		<script type="text/javascript" src="../javaScript/car_type_chart.js"></script> 
	</c:if>
	
	<!-- 재고내역 -->
	<c:if test="${jagoListDataFetched}"> 
		<script type="text/javascript" src="../javaScript/jago_List.js"></script> 
	</c:if>
	  
	<!-- 입고내역 -->
	<c:if test="${receivingListDataFetched}">  
		<script type="text/javascript" src="../javaScript/receiving_List.js"></script> 
	 </c:if> 
	  
	  
	  
</head>
<body>
  	
	<div class="attentionBox">
    	<img alt="경고아이콘" src="../images/attention_Icon.png" width="50" height="50">최근 5년 조회가능
    </div> 
    
    <!-- 분기별 실적 연도조회버튼 -->
   	<div class="inquiry">
	 	<form action="/view_jh/quarterly_results" method="post">
	 		<div class="inquiry_gigan">
	 			<h5 id="inquiry_gigan">분기별 실적</h5>
	 		</div>
	 		<div class="inquiry_year_btn">
				<select name="year" class="inquiry_year">
				<option value="2024" <c:if test="${year == 2024}">selected</c:if>>2024</option>
                <option value="2023" <c:if test="${year == 2023}">selected</c:if>>2023</option>
                <option value="2022" <c:if test="${year == 2022}">selected</c:if>>2022</option>
                <option value="2021" <c:if test="${year == 2021}">selected</c:if>>2021</option>
                <option value="2020" <c:if test="${year == 2020}">selected</c:if>>2020</option>
				</select>
				<input type="submit" value="✔조회" class="inquiry_btn">
			</div>
		</form>
   </div>
  
   <!-- 차량/브랜드별 판매실적 연도조회버튼-->
   	<div class="inquiry2">
	 	<form action="/view_jh/brand_type_results" method="post">
	 		<div class="inquiry_gigan2">
	 			<h5 id="inquiry_gigan2">차량/브랜드별 실적</h5>
	 		</div>
	 		<div class="inquiry_year_btn2">
				<select name="year" class="inquiry_year2">
				<option value="2024" <c:if test="${year == 2024}">selected</c:if>>2024</option>
                <option value="2023" <c:if test="${year == 2023}">selected</c:if>>2023</option>
                <option value="2022" <c:if test="${year == 2022}">selected</c:if>>2022</option>
                <option value="2021" <c:if test="${year == 2021}">selected</c:if>>2021</option>
                <option value="2020" <c:if test="${year == 2020}">selected</c:if>>2020</option>
				</select>
				<input type="submit" value="✔조회" class="inquiry_btn2">
			</div>
		</form>
   </div>   
        		      
	<div class="btn_container">
		<div class="performance_container">
    		<button id="performance_btn">실적</button>
    			<div class="performance_hidden_btn"> 
	  					<button id="quarterly_performance">분기별 실적</button> 
	  				<a href="/view_jh/annual_performance">
	  					<button id="annual_performance">연도별 실적</button></a>
	  					<button id="car_type_sales_performance">차량/브랜드별 판매실적</button>
  				</div>   
		</div>
	         
 		 <div class="stock_list_container">
   			<button id="stock_list">재고목록</button>
   				<div class="stock_list_hidden_btn"> 
	  				<a href="/view_jh/jago_list">
	  					<button id="inventory_details">재고내역</button></a>
	 			 	<a href="/view_jh/receiving_list">
	  					<button id="receiving_details">입고내역</button></a> 
	  				<a href="/">
	  					<button id="delivery_details">출고내역</button></a>
  				</div> 					               	
   		</div>
   		
   		<a href="/">    
			<button id="cost">비용</button></a>      
   	</div>  
	
	
	<!-- 분기별 실적 차트 -->
	<c:if test="${quarterlyDataFetched}">
		<div class="quarterly_chart_container">
			<div id="quarterly_table_div"></div>
			<div id="quarterly_chart_div"></div>
		</div>     
	</c:if> 
	 
	 <!-- 연도별 실적 차트 -->
	<c:if test="${annualDataFetched}"> 
		<div class="annual_chart_container">
			<div id="annual_table_div"></div>
			<div id="annual_chart_div"></div>
		</div>   
	</c:if>
  
	 <!-- 차량/브랜드별 판매차트 -->
	<c:if test="${brand_typeDataFetched}"> 
    	<div class="car_type_chart_container">
			<div id="brand_chart_div"></div>
			<div id="type_chart_div"></div>
		</div>  
	</c:if>  
        
  
    <!-- 재고내역 데이터테이블 -->
    <c:if test="${jagoListDataFetched}"> 
		<div class="jago_chart_chart_container">
			<input type="text" id="searchInput" onkeyup="searchTable()" placeholder="검색어를 입력하세요">
			시작 날짜: <input type="date" id="startDateInput" placeholder="YYYY-MM-DD">
    		종료 날짜: <input type="date" id="endDateInput" placeholder="YYYY-MM-DD">
			<button onclick="searchByDateRange()">날짜 검색</button>
			<button onclick="resetFilters()">입력 초기화</button>
			<div id="jago_chart_div"></div>
		</div>    
	</c:if>  
        
    
    
    <c:if test="${receivingListDataFetched}">  
   <div>
    <input type="text" id="searchInput" placeholder="키워드 검색" onkeyup="searchTable()">
    <input type="date" id="startDateInput">
    <input type="date" id="endDateInput">
    <button onclick="searchByDateRange()">날짜 범위 검색</button>
    <button onclick="resetFilters()">입력 초기화</button>
</div>
<div id="receiving_chart_div"></div>
   </c:if> 
    
    
    
    
    
        
	<!-- 입고내역 -->
<%-- 	<c:if test="${receivingListDataFetched}">  
 		<div class="receiving_chart_container">
  			<div id="receiving_chart_div"></div>
  		</div>
	</c:if>
   --%>
  
  
  
  
        
  <!-- 조회기간 활성화 버튼 -->
  <script type="text/javascript" src="../javaScript/inquiry_btn.js"></script> 
  
</body>
</html>
