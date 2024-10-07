<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>전문가 마이페이지</title>
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
		//map 메서드를 사용해 checkbox.value를 호출해 체크박스 값을 수집				형변환도 해주어야함....
		
		if(selectedPosts.length===0){
			alert('삭제할 게시물을 선택해주세요');
			return;
		}
		
		//서버에 삭제요청을 보낸다.
		$.ajax({
			url: '/myQnaDelete_P',
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
.content {
	background-color: white;
	border-bottom: 10px;
	border-top: 10px;
	display: center;
}

.border {
	border-bottom: 10px;
	border-top: 10px;
	width: 1038px;
}
.container{
	display:center;
}

tbody tr {
	background-image: url('../images/note.png'); /* 노트 이미지 경로 */
	background-size: cover; /* 이미지 크기 조정 */
	background-repeat: no-repeat;
	background-position: center;
	height: 50px; /* 행 높이 조정 */
}

tbody tr:last-child {
	background-image: none; /* 마지막 행은 이미지 제거 */
}

tbody tr {
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15); /* 아래쪽으로 그림자 효과 */
	margin-bottom: 10px; /* 간격 조정 */
}

</style>

<body>
	<div class="container">
		<main class="content">
		<h1 class="text-center"><a href="#">나의 문의내역</a></h1><br><br>
		<div class="block">
				<table>
					<thead>
						<tr>
							<th>선택</th>
							<th>작성자</th>
							<th>작성일자</th>
							<th>작성제목</th>
							<th>작성내용</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="Qna" items="${Qna}">
							<tr>
								<td><input type="checkbox" name="post1" value="${Qna.qna_num}"></td>								
								<td>${Qna.user_id}</td>
								<td>${Qna.qna_date}</td>
								<td><a href="/view_ms/myQnaDetail_P?qna_num=${Qna.qna_num}">${Qna.qna_title}</a></td>
								<td>${Qna.qna_content}</td>
							</tr>					
						</c:forEach>
					</tbody>
				</table>
			</div>
			<button type="button" onclick="handleSubmit()">삭제</button>
			<button type="submit" class="submit" 
			onclick="window.open('/view_jw/csQna','_blank', 'width=600, height=800'); return false;">
				문의하기</button>
		</main>
</div>
	<!---------------------------------------------- 푸터 ------------------------------------>
	<%@ include file="../footer.jsp" %>
</body>
</html>