<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header_white.jsp" %>
<%@ include file="../kakao.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>공지사항 상세 페이지</h1>
		<table class="noticeDetail">
			
				<tr><td>
					${ notice_table.notice_title }
				</td></tr>

				<tr><td>
					${ notice_table.notice_content }
				</td></tr>
		
		</table>
</body>
</html>