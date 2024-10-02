<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header_white.jsp" %>
<%@ include file="../kakao.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="/css/csNotLogin.css" rel="stylesheet" type="text/css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="csNotLogin">
	
		<!-- 사이드바 -->
		<div class="notLoginSidebar">
			<nav class="sidebar">
			    <ul>
			        <li class="mainHover">
			        	<a href="../view_jw/csMain"  >
				        	<img src="../images/cs/고객센터_icon_before.png" width="40px">
				       		고객지원
				       	</a>
			      	</li>
			
			        <li class="commonHover">
			        	<a href="../view_jw/csFaq">
				        	<img src="../images/cs/cs상세카테고리_icon_before.png" width="40px">
				            자주 묻는 질문
			            </a>
			        </li>
			
			        <li class="commonHover">
			        	<c:choose>
			    			<c:when test="${not empty sessionScope.user}">
			    				<a href="#" onclick="window.open('/view_jw/csQna', '_blank', 'width=600, height=800')" 
								class="qnaButton">
									<img src="../images/cs/cs상세카테고리_icon_before.png" width="40px">
				           			신고·문의·민원
								</a>
			    			</c:when>
			    			
			    			<c:otherwise>
			    				<a href="../view_jw/csNotLogin" class="qnaButton">
				    				<img src="../images/cs/cs상세카테고리_icon_before.png" width="40px">
					            	신고·문의·민원
			    				</a>
			    			</c:otherwise>	
			    		</c:choose>
			        </li>
			        
			        <li class="commonHover"> 
			        	<a href="../view_jw/csNotice">
				        	<img src="../images/cs/cs상세카테고리_icon_before.png" width="40px">
				           	공지사항 및 약관
			           </a>
			        </li>
			
			        <li class="commonHover">
			        	<a href="../view_jw/csReview">
				        	<img src="../images/cs/cs상세카테고리_icon_before.png" width="40px">
				       		고객후기
			            </a>
			        </li>
			    </ul>
			</nav>
		</div>
		
		<!-- 로그인 안내 내용 -->
		<div class="pleaseLogin">
			<h1>신고·문의·민원</h1>
			<span class="guideMent">로그인 후에 등록하시면 더욱 편리한 서비스를 이용할 수 있습니다</span>
			
			<span class="choiceButton">
				<a href="../view_jm/login">로그인하기</a>
				<a href="../view_jw/csMain">돌아가기</a>
			</span>
		</div>
	</div>
	<%@ include file="../footer.jsp" %>
</body>
</html>