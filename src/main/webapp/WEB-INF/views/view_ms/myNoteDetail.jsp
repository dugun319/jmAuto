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
<script type="text/javascript" src="../js/jquery.js">

</script>
<script type="text/javascript">

	function deleteZzokzi(note_num){
		if(confirm('정말로 이 쪽지를 삭제하시겠습니까?')){
			$.ajax({
				url: '/myNoteDelete',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify([note_num]),
				success: function(response){
					alert(response);
					alert('쪽지가 삭제되었습니다.');
					location.reload();
				},
				error: function(xhr, status, error){
					alert('쪽지의 삭제여부가 변경되었습니다.:'+xhr.statusText);
				}
			});
		}
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
							<th>삭제여부</th>					
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
								<td>${Note.del_state}</td>						
							</tr>	
					</tbody>
				</table>
			</div>
			<p>user_id: ${user_id}</p>
			<p>보낸이: ${Note.note_sd}</p>
			<button type="button" onclick="deleteZzokzi(${Note.note_num})">삭제</button>
			
			<c:if test="${user_id.equals(Note.note_rd) && !user_id.equals(Note.note_sd)}">
			<a href ="/view_ms/myNoteDabjangWrite?note_num=${Note.note_num}&note_rd=${Note.note_rd}">
			<button type="button">답장하기</button></a>
			</c:if>
		</main>
	</div>
	<!---------------------------------------------- 푸터 ------------------------------------>
	<%@ include file="../footer.jsp" %>
</body>
</html>