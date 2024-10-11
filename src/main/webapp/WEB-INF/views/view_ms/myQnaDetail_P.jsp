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
<div class="menu_continer"><%@ include file="../menu_P.jsp" %></div>
<%@ include file="../kakao.jsp" %>
<script type="text/javascript" src="../js/jquery.js"></script>
<style type="text/css">
.content {
	background-color: white;
	border-bottom: 10px;
	border-top: 10px;
	display: center;
	margin-top: 50px;
	padding-top: 50px;
	
}

.border {
	border-bottom: 10px;
	border-top: 10px;
	width: 1280px;
	padding-left: 50px;
	display: center;
	padding-top: 40px;
	padding-bottom: 40px;
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
tbody td,
thead td{
	padding: 10px;
}

tbody tr {
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.10); /* 아래쪽으로 그림자 효과 */
	margin-bottom: 10px; /* 간격 조정 */
}
.block{
	display: center;
}
.button{
	display: flex; /* Flexbox 사용 */
	justify-content: center; /* 수평 중앙 정렬 */
	align-items: center; /* 수직 중앙 정렬 */
	margin-top: 20px; /* 위쪽 여백 */
	width: 100%; /* 전체 너비 사용 */
}
</style>
</head>

<script type="text/javascript">


	function myQnaDetailDelete_P(qna_num){
		alert('qna_num->'+qna_num);
		if(confirm('삭제하시겠습니까?')){
			$.ajax({
				url: '/myQnaDetailDelete_P',
				type: 'POST',
				data: {qna_num : qna_num}, 
				success: function(response){
					alert('삭제되었습니다.');
					window.location.href='/view_ms/myQna_P';
				},
				error: function(xhr, status, error){
					alert('삭제여부가 변경되었습니다.');
				}
			});
		}
	}
	
	

</script>
<body>
	<div class="container">
		<div class="content_container">
			<div class="content_hed">
				<h1>고객센터 문의내역</h1>
			</div>
			
			<div class="block_1">	
				<hr />
				
				<table class="border">
					<thead>
						<tr>
							<td>작성일자</td>
							<td>작성제목</td>
							<td>작성내용</td>
						</tr>
					</thead>
					<tbody>
							<tr>						
								<td>${Qna.qna_date}</td>
								<td>${Qna.qna_title }</td>
								<td>${Qna.qna_content}</td>
							</tr>	
					</tbody>
				</table>
			</div>
			
			</div>
			<!-- 버튼 컨테이너 -->
			<div class="button">
			<button type="button"  style= "background:none; border: none;">
				<img alt="" src="../images/main/삭제_but.png" onclick="myQnaDetailDelete_P('${Qna.qna_num}')"
					style="cursor: pointer; margin-right: 20px;"></button>
				
				
				<button type="submit" class="submit"
					style="background: none; border: none; cursor: pointer;"
					onclick="window.open('/view_jw/csQna','_blank', 'width=600, height=800'); return false;">
					<img alt="" src="../images/main/문의하기.png"
						style="width: 150px; height: auto;">
				</button>
			</div>
	</div>
	<!---------------------------------------------- 푸터 ------------------------------------>
	<%@ include file="../footer.jsp" %>
</body>
</html>