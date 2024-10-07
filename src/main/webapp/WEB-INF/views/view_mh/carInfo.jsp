<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../kakao.jsp" %>
<link href="/css/carInfo.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../header_white.jsp" %>
<title>Insert title here</title>
<script type="text/javascript">
	window.addEventListener('scroll', function() {
		console.log("스크롤 중....");
		const purchaseDiv = document.querySelector('.Info_purchase');
		const footer = document.querySelector('footer');
		const footerTop = footer.offsetTop;
		const scrollY = window.scrollY;
		const stopPosition = 225;
		const divHeight = purchaseDiv.offsetHeight;
		
		if (scrollY > stopPosition && (scrollY + divHeight) < footerTop){
			purchaseDiv.style.position = 'fixed';
			purchaseDiv.style.top = '80px';
		} else if ((scrollY + divHeight) >= footerTop) {
			purchaseDiv.style.position = 'absolute';
			purchaseDiv.style.top = (footerTop - divHeight) + 'px';
		} else {
			purchaseDiv.style.position = 'absolute';
			purchaseDiv.style.top = '305px';
		}
	});
	
	function swapImage(clickedThumbnail){
		console.log("체크실행중");
		const mainImage = document.getElementById('mainImage');
		const mainImageSrc = mainImage.src;
		
		mainImage.src = clickedThumbnail.src;
		
		clickedThumbnail.src = mainImageSrc;
	}
</script>
</head>
<body>

<main class="main_container">
	<div class="container1">
		<!-- 차량기본정보 및 주행거리 평균 -->
		<div class="Car_Info">
			<c:forEach var="list" items="${carInfoList}">
				<div class="Info_car_list">
					<div class="Info_car_hear">
						<h1 class="Info_car_h1">${list.model}</h1>
						<button type="submit" onclick="location.href='/KH/pay/createExpertReview?sell_num=${list.sell_num}'" class="Info_car_hear_but">리뷰작성</button>
						<c:if test="${sessionScope.user.user_type == 'P' || sessionScope.user.user_type == 'A' }">
							<button type="submit" onclick="location.href='/KH/pay/createExpertReview?sell_num=${list.sell_num}'" class="Info_car_hear_but">리뷰작성</button>
						</c:if>
					</div>
					<div class="Info_body">
						<div class="Info_body_text">
							<div class="Info_car_text_1">${list.car_num }</div>
							<div class="Info_car_text_2">${list.accident }</div>
							<div class="Info_car_text_3">${list.munu_date_cos }</div>
							<div class="Info_car_text_4">${list.mileage }km</div>
							<div class="Info_car_text_5">${list.fuel }</div>
							<div class="Info_car_text_6">${list.color }</div>
							<div class="Info_car_text_7">${list.transmission }</div>
							<div class="Info_car_text_8">${list.price }만원</div>
						</div>
						<div class="Info_body_a">
							<a href="" class="Info_zzom">찜하기</a>
							<a href="" class="Info_goue">공유하기</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<div class="Info_img_container">
			<div class="Info_main_img">
				<img id="mainImage" alt="main_img" src="../images/main/377조7542_1.png" class="main_image" style="margin: 0 0 20px;">
			</div>
			
			<div class="thumbnail_container">
				<img alt="thumbnail1" src="../images/main/377조7542_2.png" class="thumbnail" onclick="swapImage(this)">
				<img alt="thumbnail2" src="../images/main/377조7542_3.png" class="thumbnail" onclick="swapImage(this)">
				<img alt="thumbnail3" src="../images/main/377조7542_4.png" class="thumbnail" onclick="swapImage(this)">
				<img alt="thumbnail4" src="../images/main/377조7542_5.png" class="thumbnail" onclick="swapImage(this)">
			</div>
		</div>
		
		
		<div class="car_particular_main">
			<div class="car_particular_hd">
				<h3>차량정보</h3>
			</div>
			<div class="car_particular">
				<c:forEach var="list" items="${carInfoList}">
				<div class="Info_carInfo_particular">
					<h4>기본정보</h4>
					<table class="particular_text_pu">
						<tr>
							<td class="particular_text_pu_td_1">차량번호</td>
							<td class="particular_text_pu_td_2">${list.car_num }</td>
							<td class="particular_text_pu_td_1">연식</td>
							<td class="particular_text_pu_td_2">${list.munu_date_cos }</td>
						</tr>
						<tr>
							<td class="particular_text_pu_td_1">주행거리</td>
							<td class="particular_text_pu_td_2">${list.mileage }km</td>
							<td class="particular_text_pu_td_1">연료</td>
							<td class="particular_text_pu_td_2">${list.fuel }</td>
						</tr>
						<tr>
							<td class="particular_text_pu_td_1">변속기</td>
							<td class="particular_text_pu_td_2">${list.transmission }</td>
							<td class="particular_text_pu_td_1">제조사</td>
							<td class="particular_text_pu_td_2">${list.brand }</td>
						</tr>
						<tr>
							<td class="particular_text_pu_td_1">차종</td>
							<td class="particular_text_pu_td_2">${list.car_type }</td>
							<td class="particular_text_pu_td_1">사고유무</td>
							<td class="particular_text_pu_td_3">${list.accident }</td>
						</tr>
						<tr>
							<td class="particular_text_pu_td_1">색상</td>
							<td class="particular_text_pu_td_2">${list.color }</td>
							<td class="particular_text_pu_td_1">압류유무</td>
							<td class="particular_text_pu_td_3">
								<c:choose>
									<c:when test="${list.repossession == '0' }">
										무압류
									</c:when>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td class="particular_text_pu_td_1">입고날짜</td>
							<td class="particular_text_pu_td_2"><fmt:formatDate value="${list.reg_date }" pattern="yyyy/MM/dd"/></td>
							<td ></td>
							<td ></td>
						</tr>
					</table>
				</div>
						
				<div class="Info_mileage">
					<h4>주행거리 분석</h4>
					<div class="Info_mileage_body">
						<c:choose>
							<c:when test="${list.mileage < 25000 }">
								<img alt="매우짧음_그래프" src="../images/main/Veryshort_graph.png" class="mileage_grp_img">
							</c:when>
							<c:when test="${list.mileage < 50000 }">
								<img alt="짧음_그래프" src="../images/main/short_graph.png" class="mileage_grp_img">
							</c:when>
							<c:when test="${list.mileage < 75000 }">
								<img alt="보통_그래프" src="../images/main/Normal_graph.png" class="mileage_grp_img">
							</c:when>
							<c:when test="${list.mileage < 100000 }">
								<img alt="다소많음_그래프" src="../images/main/Somewhatmuch_Graph.png" class="mileage_grp_img">
							</c:when>
							<c:otherwise>
								<img alt="매우많음_그래프" src="../images/main/Verymany_graph.png" class="mileage_grp_img">
							</c:otherwise>
						</c:choose>
						<div class="Info_mileage_text">
							<div class="Info_mileage_text_ju1">${list.years_passed }년 ${list.mon_passed }개월 동안 <div class="Info_mileage_text_km">${list.mileage }km</div>운행</div>
							<div class="Info_mileage_text_ju2">[<div class="Info_mileage_text1">${list.car_num }</div>] 차량은</div>
							<div class="Info_mileage_text_ju3"> 주행거리는 일반적으로 [
							<div class="Info_mileage_text2">
								<c:choose>
									<c:when test="${list.mileage < 25000 }">
										매우짧음
									</c:when>
									<c:when test="${list.mileage < 50000 }">
										짧음
									</c:when>
									<c:when test="${list.mileage < 75000 }">
										보통
									</c:when>
									<c:when test="${list.mileage < 100000 }">
										다소많음
									</c:when>
									<c:otherwise>
										매우많음
									</c:otherwise>
								</c:choose>
							</div>
							] 입니다.</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
				
		<!-- 판매자 정보 -->
		<div class="Info_user_main">
			<hr/>
			<div class="Info_user_id_hd">
				<h3>판매자 정보</h3>
			</div>
			<div class="Info_user_id_allbody">
				<div class="Info_user_id">
					<c:forEach var="user" items="${userInfo }">
						<h4>판매자</h4>
						<div class="Info_user_id_body">
							<div class="Info_user_id_text1">${user.user_name }&emsp;<div class="Info_user_id_text1_1">┃</div>&emsp;${user.region }</div>
							<div class="Info_user_id_text2">${user.buz_name }</div>
							<div class="Info_user_id_text3">${user.user_tel }</div>
							<div class="Info_user_id_but1">
								<button type="button" value="/" class="Info_user_id_but1_but">쪽지하기</button>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="Info_map_footer">
					<h4>판매자 소개</h4>
					<c:forEach var="user" items="${userInfo }">
						<c:if test="${user.introduction == null or user.introduction == ''}">
							<div class="Info_map_text_all">
								<div class="Info_map_text2">판매자가 설명을 등록하지 않았습니다.</div>
								<div class="Info_map_text2">판매자에게 직접 연락을 하시면</div>
								<div class="Info_map_text2">좀 더 자세한 사항을 안내 받을 수 있습니다.</div>
							</div>
						</c:if>
						<div class="Info_map_text3">${user.introduction }</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<!-- 판매자 소개(지도) -->
		<div class="Info_map_all">
			<div class="Info_map_content">
				<h4>차량을 직접 보시고 싶다면, 직영점 당일 방문 예약을 이용해 주세요.</h4>
				<ul class="Info_map_hed_ul">
					<li>토요일은 전화를 통한 예약만 가능합니다.</li>
					<li>예약 차량은 다른 고객에게 판매하지 않습니다.</li>
				</ul>
				<button type="submit" value="note" class="Info_map_content_but_1">쪽지남기기</button>
			</div>
			<div class="Info_map_content2">
			<div id="kakao_map" class="Info_user_map" style="width: 440px; height: 250px;">
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b1aec89436ffdda282e6948304fd91a1"></script>
				<script type="text/javascript">
					var container = document.getElementById('kakao_map');
					var options = {
						center: new kakao.maps.LatLng(33.450701, 126.570667),
						level: 3
					};
		
					var map = new kakao.maps.Map(container, options);
				</script>
			</div>
			<div>
				<h2>ExperReviewList</h2>
				<c:forEach var="expertReviewList" items="${expertReviewList }">
		 			<a onclick="window.open('/KH/pay/expertReviewPage?expert_review_num=${expertReviewList.expert_review_num }', '전문가리뷰보기', 'width=700,height=1000,location=no,status=no,scrollbars=yes,top=300,left=300')">
					${expertReviewList.expert_review_num }
					</a>
					<br>
				</c:forEach>
			</div>
			
			<c:forEach var="user" items="${userInfo }">
					<div class="Info_map_text_all">
						<ul>
							<li><div class="Info_map_text1">주소 : </div>
								<div class="Info_map_text2">${user.buz_addr }</div></li>
							<li><div class="Info_map_text1">대표번호 : </div>
								<div class="Info_map_text2">${user.user_tel }</div></li>
							<li><div class="Info_map_text1">영업시간 : </div>
								<div class="Info_map_text2">월~토요일 09:00~18:00 공휴일/일요일 휴정</div></li>
							<li><div class="Info_map_text1">점심시간 : </div>
								<div class="Info_map_text2">12:00~13:00</div></li>
						</ul>
					</div>
					
			</c:forEach>
			</div> 
		</div>

		<!-- 구매버튼 및 구매정보 -->
		<div class="Info_purchase">
			<c:forEach var="user" items="${userInfo }">
				<div class="Info_purchase_text1">
					<img alt="전화_icon" src="../images/main/call_icon_.png" class="Info_purchase_icon">&nbsp;${user.user_tel }
				</div>
			</c:forEach>
			<hr/>
			<c:forEach var="list" items="${carInfoList}">
				<div class="Info_purchase_body">
					<div class="Info_purchase_h4">${list.model }</div>
					<div class="Info_purchase_text2">${list.car_num }&emsp;${list.accident }&emsp;${list.munu_date_cos }&emsp;${list.mileage }km&emsp;${list.fuel }&emsp;${list.transmission }</div>
					<table class="Info_purchase_table">
						<tr>
							<td><div class="Info_purchase_text3">차량가</div></td>
							<td><div class="Info_purchase_text4">${list.price_fre } 원</div></td>
						</tr>
						<tr>
							<td><div class="Info_purchase_text3">세금</div></td>
							<td><div class="Info_purchase_text4">${list.tax } 원</div></td>
						</tr>
						<tr>
							<td><div class="Info_purchase_text3">대행 수수료</div></td>
							<td><div class="Info_purchase_text4">${list.agency_fee } 원</div></td>
						</tr>
						<tr>
							<td><div class="Info_purchase_text6">출고 비용</div></td>
							<td><div class="Info_purchase_text5">0 원</div></td>
						</tr>
					</table>
				</div>
				<table class="Info_purchase_footer">
					<tr>
						<td><div class="Info_purchase_text7">합계</div></td>
						<td><div class="Info_purchase_text8">${list.sum_price } 원</div></td>
					</tr>
				</table>
				<div class="Info_purchase_but">
					<button onclick="location.href='/KH/pay/goPay?sell_num=${list.sell_num }'" value="pay" class="Info_purchase_but_1">결제하기</button>
					<button type="submit" value="note" class="Info_purchase_but_2">쪽지남기기</button>
				</div>
			</c:forEach>
		</div>
		
	</div>
</main>
</body>
<footer>
	<%@ include file="../footer.jsp" %>
</footer>
</html>