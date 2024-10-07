<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>구매자 마이페이지</title>
<link rel="stylesheet" href="../css/myPage.css">
<div class="header_continer"><%@ include file="../header_white.jsp"%></div>
<div class="menu_continer"><%@ include file="../menu_B.jsp" %></div>
<%@ include file="../kakao.jsp" %>
<script type="text/javascript" src="../js/jquery.js"></script>

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
			url: '/myNoteDelete',
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


<body>
	<div class="container">
		<main class="content">
		<h1 class="text-center"><a href="#">나의 쪽지함</a></h1><br><br>
		<div class="block">
				<table>
					<thead>
						<tr>
							<th>쪽지번호</th>
							<th>보낸이</th>
							<th>작성날짜</th>
							<th>매물번호</th>
							<th>제목</th>
							<th>받는이</th>										
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
							<tr>
								<td>${Note.note_num}</td>
								<td>${Note.note_sd}</td>
								<td>${Note.note_date}</td>
								<td>${Note.sell_num}</td>
								<td>${Note.note_title}</td>
								<td>${Note.note_rd}</td>					
								<td>${Note.note_content}</td>
							</tr>	
					</tbody>
				</table>
			</div>
			<form action="/view_ms/myNoteDabjangWrite" method="POST">
			<input type="hidden" name="sell_num" value="${Note.sell_num}">
			<input type ="hidden" name="note_num" value="${Note.note_num}">
			<input type="hidden" name="note_rd" value="${Note.note_sd}"> <!-- 보낸이 id를 받는이로 추가시키기. -->
			<input type="text" name="note_title" value="${Note.note_title}:Re">
			<textarea name="note_content" placeholder="답장 내용을 입력하세요"></textarea>
			<button type="submit">답장하기</button>
			</form>
		</main>
	</div>
	<!---------------------------------------------- 푸터 ------------------------------------>
	<%@ include file="../footer.jsp" %>
</body>
</html>