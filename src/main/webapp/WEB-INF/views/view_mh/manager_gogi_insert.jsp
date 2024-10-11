<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<div class="header_continer"><%@ include file="../header.jsp" %></div>
<div class="menu_continer"><%@ include file="../manager_menu.jsp" %></div>
</head>
<body>
	
	<div class="gogi_insert_container">
		<div class="gogi_input_hed">
			<div class="gogi_input_hed_text">새로작성하기</div>
		</div>
		<div class="gogi_input_body">
			<form action="/mh/gogiinsertFrom" method="post">
				<table class="gogi_input_table">
					<tr>
						<td>분류</td>
						<td><select name="notice_cls" id="gogi_notice_cls">
								<option value="6100">공지사항</option>
								<option value="6200">이용약관</option>
								<option value="6300">이벤트</option>
							</select></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="notice_title" class="gogi_input_table_title"></td>
					</tr>	
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="150" name="notice_content"></textarea></td>
					</tr>
					<tr>
						<td><input type="hidden" value="${sessionScope.user.user_id }" name="user_id">
							<input type="submit" value="확인">
							<input type="button" value="취소" onclick="location.href='/manager/CS/faq'">
							<input type="reset" value="리셋"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>