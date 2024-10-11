<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath()%>/css/manager_gogi_corr.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<div class="header_continer"><%@ include file="../header.jsp" %></div>
<div class="menu_continer"><%@ include file="../manager_menu.jsp" %></div>
</head>
<body>
	<div class="manager_gogi_sel_continer">
		<c:forEach var="Gogi" items="${notice }">
			<div class="gogi_sel_form">
				<div class="gogi_sel_hed">게시물관리</div>
				<form action="/mh/gogiupdatesel" method="post">
				<table>
					<tr>
						<td>제목</td>
						<td><input type="text" value="${Gogi.notice_title }" name="notice_title"></td>
					</tr>
					<tr>
						<td>분류</td>
						<td><select name="notice_cls" id="gogi_notice_cls">
								<option value="6100" ${Gogi.notice_cls == 6100 ? 'selected' : '' }>공지사항</option>
								<option value="6200" ${Gogi.notice_cls == 6200 ? 'selected' : '' }>이용약관</option>
								<option value="6300" ${Gogi.notice_cls == 6300 ? 'selected' : '' }>이벤트</option>
							</select></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="notice_content" rows="10" cols="100">${Gogi.notice_content }</textarea></td>
					</tr>
					<tr>
						<td><input type="hidden" value="${Gogi.notice_num }" name="notice_num">
							<input type="submit" value="확인">
							<input type="button" value="취소" onclick="location.href='/manager/CS/gogi'">
							<input type="reset" value="리셋"></td>
					</tr>
				</table>
				</form>
			</div>
		</c:forEach>
	</div>
</body>
</html>