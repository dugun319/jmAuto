<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="../css/myPage.css">
<div class="header_continer"><%@ include file="../header_white.jsp"%></div>
<div class="menu_continer"><%@ include file="../menu_P.jsp" %></div>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript"><%@ include file="../kakao.jsp" %></script>
<script type="text/javascript">
	/* 체크박스 함수 */
	function handleSubmit(){
		const checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
		//querySelectorAll이라는 메서드를 사용해 현재 문서에 체크된 :checked요소를 모두 선택해 결과를 nodeList로 반환
		const selectedPosts = Array.from(checkboxes).map(checkbox => parseInt(checkbox.value));
		//map 메서드를 사용해 checkbox.value를 호출해 체크박스 값을 수집

		if(selectedPosts.length===0){
			alert('삭제할 게시물을 선택해주세요');
			return;
		}
		//서버에 삭제요청을 보낸다.
		$.ajax({
			url: '/myZzimDelete',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(selectedPosts),
			success: function(response){
				alert('선택한 게시물이 삭제되었습니다.');
				location.reload();
			},
			error: function(xhr, status, error){
				alert('삭제실패:' + xhr.statusText);
			}
		});
	}
</script>
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
			<h1 class="text-center"><a href="#">나의 관심목록</a></h1><br><br>
			<div class="block">		
				<table class="List">		
					<thead>
						<tr>
							<th>선택</th>
							<th>매물번호</th>
							<th>찜번호</th>
							<th>찜한차량</th>
						</tr>
					</thead>
					<tbody>	
						<c:forEach var="Zzim" items="${Zzim}">	
							<tr>
								<td><input type="checkbox" name="post1" value="${Zzim.sell_num}"></td>
								<td><a href="view_ms/myZzimReview?sell_num=${Zzim.sell_num}">${Zzim.sell_num }</a></td>
								<!-- 관심목록에서 해당 매물번호를 클릭하면 매물 판매 페이지로 이동하는 로직 넣어야 함. -->
								<td>${Zzim.zzim_num}</td>
								
								<!-- 차량 정보 출력 -->
								<td>
            						<div class="chu_carList">
                						<a href="/carInfo?sellNum=${Zzim.sell_num}&id=${Zzim.user_id}">
                    					<img alt="chuCarimg" src="../images/main/377조7542_1.png" class="chu-img">
                    						<div class="chu_body_all">
                        						<div class="chu-body">
						                            <img alt="구매대기중" src="../images/main/Waitingforpurchase.png">
						                            <p class="chu-title">${Zzim.model}</p> <!-- Zzim에 모델이 포함된 경우 -->
                        						</div>
                        						<p class="chu-text"><b>${Zzim.price}</b> 만원</p> <!-- Zzim에 가격이 포함된 경우 -->
                   							 </div>
                						</a>
            						</div>
        						</td>								
							</tr>
						</c:forEach>
					</tbody>
				</table>		
			</div>
			<button type="button" onclick="handleSubmit()">삭제</button>
		</main>
</div>
<!--------------------------------------- 푸터 ---------------------------------------->
	<%@ include file="../footer.jsp" %>
</body>
</html>