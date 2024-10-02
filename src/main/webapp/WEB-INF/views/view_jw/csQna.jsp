<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/csQna.css" rel="stylesheet" type="text/css"/>
<meta charset="UTF-8">
<title>QnA</title>
</head>
<body>
	<h3>01. 고객문의</h3>
	<hr>
		<c:if test="${msg!=null}">${msg}</c:if>
				<!-- target="newWindow": 폼이 제출될 때 새 창에서 결과를 보여줌 -->
			<form action="/writeQna" method="post" name="frm"  enctype="multipart/form-data"
			onsubmit="return handleSubmit();">
				<span class="notice">
				- 보내주신 문의를 확인 후 최대한 빠르게 답변해 드리겠습니다.<br>
				- 문의 [제목]과 [내용]란에는 절대 개인정보를 입력하지 마십시오.<br>
				</span>			
				<input type="checkbox" name="agree" required="required" value="개인정보 수집 및 이용동의">
				개인정보 수집 및 이용 동의<br>
				<span class="deny">
				 * 위 항목에 거부할 권리가 있습니다. 
				 단, 동의를 거부할 경우 문의 이용이 제한됩니다.</span>
			
				<h3>02. 문의입력</h3>
				<hr>
				
				<%-- <input type="hidden" name="qna_num" value="${qna.qna_num }">	 --%>
				<table>
					<tr><th>문의유형</th><td>
						<select name="qna_cls">
							<%-- <option value="${qna.qna_num }">${qna.qna_cls }</option> --%>
							<option value="배송">배송</option>
							<option value="보안">보안</option>
							<option value="이용안내">이용안내</option>
							<option value="전문가">전문가</option>
							<option value="차량정보">차량정보</option>
							<option value="페이지오류">페이지오류</option>
							<option value="회원관리">회원관리</option>
						</select></td></tr>
							
					<tr><th>제목</th><td>
					<input class="title" type="text" name="qna_title" required="required"></td>
					</tr>	
									
					<tr><th>내용</th><td>
						<input class="content" type="text" name="qna_content" required="required" ></td>
					</tr>				
			
					<tr><th>첨부파일</th><td>
						<a href="#" class="file">
							<input type="file" name="file01">
						
						</a></td></tr>	
				</table>
				
				<span class="button">
					<!-- 데이터 전송 후 새로운 창 열기 -->	
					<button type="submit" class="submit">
						<img class="img-submit" src="../images/cs/문의하기.png">	
					</button>
					
					 <!-- 취소버튼 눌러서 창 닫기 -->
					 <button type="button" class="cancel" onclick="window.close()">
			            <img class="img-cancel" src="../images/cs/취소하기.png">
			        </button>
				</span>
			</form>
			
			<script type="text/javascript" >
		        function handleSubmit() {
		            // 부모창이 새로운 페이지로 이동
		            window.opener.location.href = '/view_jw/csQnaSuccess';
		            
		            // 팝업창을 닫음
		            window.close();
		            
		            // 폼 제출을 진행
		            return true;
		        }
		    </script>
</body>
</html>