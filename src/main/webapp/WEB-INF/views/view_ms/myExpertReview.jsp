<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>전문가 - 내가 쓴 전문가 리뷰</title>
<link rel="stylesheet" href="../css/myPage.css">
<div class="header_continer"><%@ include file="../header_white.jsp"%></div>
<div class="menu_continer"><%@ include file="../menu_P.jsp" %></div>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript"><%@ include file="../kakao.jsp" %></script>
</head>
<style>
table.List {
    width: 100%;                /* 테이블 폭을 100%로 설정 */
    border-collapse: collapse;  /* 경계선 겹치기 제거 */
    margin-top: 80px;
}

.List thead {
    display: none;              /* 헤더 숨기기 (필요에 따라) */
}

.List tbody {
    display: flex;              /* 테이블 몸체를 Flexbox로 설정 */
    flex-wrap: wrap;           /* 줄 바꿈 허용 */
}

.List tr {
    display: flex;              /* 각 행을 Flexbox로 설정 */
    align-items: center;        /* 수직 정렬 */
    margin-bottom: 20px;       /* 각 행 간의 여백 */
    flex: 1 0 calc(33.333% - 20px); /* 3개씩 나열되도록 설정 */
}

.chu_carList {
    display: flex;              /* 차량 리스트를 Flexbox로 설정 */
    align-items: center;        /* 수직 정렬 */
}

.chu-img {
    width: 200px;               /* 이미지 크기 조정 */
    height: auto;
    margin-right: 10px;        /* 이미지와 텍스트 간격 */
}

.chu_body_all {
    display: flex;              /* 텍스트 부분도 Flexbox로 설정 */
    flex-direction: column;     /* 세로로 배치 */
}
</style>
<body>
	<div class="container">
		<main class="content">
			<h1 class="text-center">
				<a href="#">내가 작성한 전문가리뷰</a>
			</h1>
			<br>
			<br>
			<div class="block">		
				<table class="List">
					<thead>
						<tr>
							<th>리뷰번호</th>
							<th>매물번호</th>
							<th>리뷰사진</th>
							<th>리뷰내용</th>
							<th>작성자</th>
							<th>리뷰작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="Expert_Review" items="${Expert_Review}">
							<tr>
								<td>
									<button onclick="location.href='/KH/pay/modifyExpertReview?expert_review_num=${Expert_Review.expert_review_num}&user_id=${Expert_Review.user_id}&sell_num=${Expert_Review.sell_num }'">수정하기</button>
								</td>
								<td>${Expert_Review.expert_review_num }</td>
								<td>${Expert_Review.sell_num }</td>
								<!-- 차량 정보 출력 -->
								<td>
            						<div class="chu_carList">
                						<a href="/view_ms/myExpertReviewDetail?expert_review_num=${Expert_Review.expert_review_num}&user_id=${Expert_Review.user_id}">
                    					<img alt="chuCarimg" src="../images/main/377조7542_1.png" class="chu-img">
                    						<div class="chu_body_all">
                        						<div class="chu-body">
						                            <img alt="구매대기중" src="../images/main/Waitingforpurchase.png">
						                            <p class="chu-title">${Expert_Review.model}</p> 
                        						</div>
                        						<p class="chu-text"><b>${Expert_Review.price}</b> 만원</p> 
                   							 </div>
                						</a>
            						</div>
        						</td>				
								<td>${Expert_Review.content}</td>
								<td>${Expert_Review.user_id}</td>
								<td>${Expert_Review.write_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<button type="submit" class="submit" onclick="window.open('/view_jw/csQna','_blank', 'width=600, height=800'); return false;">
				문의하기</button>
		</main>
		</div>


	
	<!------------------------------------- 푸터 ----------------------------------------->
<footer><%@ include file="../footer.jsp" %></footer>
</body>

</html>