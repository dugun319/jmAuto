<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../kakao.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css" >
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap-theme.css">
<link href="/css/csReview.css" rel="stylesheet" type="text/css"/>
<meta charset="UTF-8">
<title>고객후기</title>
<script type="text/javascript">
	function reviewDetail() {
		var approval_num 	= $("input[name=approval_num]").val();
		var user_id 		= $("input[name=user_id]").val();
		var sell_num 		= $("input[name=sell_num]").val();
		
		alert("상세보기");
		alert(approval_num);
		alert(user_id);
		alert(sell_num);
		var url = "view_jw/csReviewDetail?approval_num=" + approval_num
					+ "&user_id=" + user_id
					+ "&sell_num=" + sell_num;		
		window.open(url, "_blank", 'width=650,height=800,location=no,status=no,scrollbars=no,top=100,left=300');
	}
</script>

</head>
<body>
	<!-- 사이드바 -->
	<div class="header_continer"><%@ include file="../header_white.jsp"%></div>
	<div class="menu_continer"><%@ include file="../view_mh/menu_CS.jsp" %></div>
	
	<!-- 후기 메인 내용 -->
	<div class="review">
		<div class="reviewContainer">
			<h1>고객후기</h1>
			<span class="reviewMent">이용자들의 생생한 후기를 체험하세요</span>

			<form action="view_jw/csReviewDetail" method="get">
			    
			    
				<div class="reviewContent">
					<c:forEach var="review" items="${ carInfo }">
					<input type="hidden" name="approval_num" value="${review.approval_num}">
			    	<input type="hidden" name="user_id" value="${review.user_id}">
			    	<input type="hidden" name="sell_num" value="${review.sell_num}">
							
							
							<div class="reviewList">
								<a  class="reviewPop"></a>
									<img onclick="reviewDetail()" src="${ review.img_url }" class="rev_img">
								
								<div class="reviewdetail">
									
									<div class="rev_evaluetion">
										<c:choose>
											<c:when test="${review.evaluation == 5}">
												<img alt="별5점" src="../images/main/star_5.png" class="star_img">
											</c:when>
											<c:when test="${review.evaluation == 4}">
												<img alt="별4점" src="../images/main/star_4.png" class="star_img">
											</c:when>
											<c:when test="${review.evaluation == 3}">
												<img alt="별3점" src="../images/main/star_3.png" class="star_img">
											</c:when>
											<c:when test="${review.evaluation == 2}">
												<img alt="별2점" src="../images/main/star_2.png" class="star_img">
											</c:when>
											<c:otherwise>
												<img alt="별1점" src="../images/main/star_1.png" class="star_img">
											</c:otherwise>
										</c:choose>
									</div>
									
									<div class="title">${review.review_title}</div>
									<div class="info">
										${review.manu_date_char }&emsp;&emsp;
										${review.mileage }km&emsp;&emsp;
										${review.fuel}
									</div>
									<div class="content">${review.review_content}</div>
									<div class="date">${review.review_date}</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</div>
			
				<!-- 페이지작업 -->
				<div class="reviewPage">
					<c:set var="num" value="${page.total-page.start+1 }"></c:set>
					<c:if test="${page.startPage > page.pageBlock }">
						<a href="csReview?currentPage=${page.startPage-page.pageBlock }">[이전]</a>	
					</c:if>
					<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
						<a href="csReview?currentPage=${i}">[${i}]</a>
					</c:forEach>
					
					<c:if test="${page.endPage < page.totalPage }">
						<a href="csReview?currentPage=${page.startPage+page.pageBlock }">[다음]</a>
					</c:if>
				</div>
				
			</form>
		</div>
	
	</div>
	
	<%@ include file="../footer.jsp" %>  

</body>
</html>