<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath()%>/css/manager_insert.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<div class="header_continer"><%@ include file="../header.jsp" %></div>
<div class="menu_continer"><%@ include file="../manager_menu.jsp" %></div>
</head>
<body>
	<div class="faq_insert_container">
		<div class="faq_input_hed">
			<div class="faq_input_hed_text">새로작성하기</div>
		</div>
		<div class="faq_input_body">
			<form action="/mh/faqinsertFrom" method="post">
				<table class="faq_input_table">
					<tr>
						<td>분류</td>
						<td><select name="faq_cls" id="faq_cls_num">
								<option value="5200">구매가이드</option>
								<option value="5300">회원정보관리</option>
								<option value="5400">전문가</option>
								<option value="5500">구매가이드</option>
								<option value="5600">내차팔기</option>
								<option value="5700">기타</option>
							</select></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="faq_title" class="faq_input_table_title"></td>
					</tr>	
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="150" name="faq_content"></textarea></td>
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