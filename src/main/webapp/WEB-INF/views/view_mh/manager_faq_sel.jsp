<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath()%>/css/manager_faq_sel.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<div class="header_continer"><%@ include file="../header.jsp" %></div>
<div class="menu_continer"><%@ include file="../manager_menu.jsp" %></div>
</head>
<body>
	<div class="faq_sel_container">
		<c:forEach var="faq" items="${faq }">
		<div class="faq_sel_table">
			<form action="/mh/faqupdate" method="post">
			<table>
				<tr class="cal-1">
					<th>게시물 관리</th>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" value="${faq.faq_title }" name="faq_title"></td>
				</tr>
				<tr>
					<td>분류</td>
					<td><select name="faq_cls" id="faq_sel_cls">
							<option value="5200" ${faq.faq_cls == 5200 ? 'selected' : ''}>구매가이드</option>
							<option value="5300" ${faq.faq_cls == 5300 ? 'selected' : ''}>회원정보관리</option>
							<option value="5400" ${faq.faq_cls == 5400 ? 'selected' : ''}>전문가</option>
							<option value="5500" ${faq.faq_cls == 5500 ? 'selected' : ''}>구매가이드</option>
							<option value="5600" ${faq.faq_cls == 5600 ? 'selected' : ''}>내차팔기</option>
							<option value="5700" ${faq.faq_cls == 5700 ? 'selected' : ''}>기타</option>
						</select></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="faq_content" rows="10" cols="100">${faq.faq_content }</textarea></td>
				</tr>
				<tr>
					<td><input type="hidden" value="${faq.faq_num}" name="faq_num">
						<input type="submit" value="확인">
						<input type="button" value="취소" onclick="location.href='/manager/CS/faq'">
						<input type="reset" value="리셋"></td>
				</tr>
			</table>
			</form>
		</div>
		</c:forEach>
	</div>
</body>
</html>