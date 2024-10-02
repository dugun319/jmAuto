<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../kakao.jsp" %>
<%@ include file="../header_white.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link href="/css/csFaq.css" rel="stylesheet" type="text/css"/>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
</head>
<body>

	<div class="faq">
		<!-- 사이드바 -->
		<div class="faqSidebar">
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
		
		<!-- 민원 메인 내용 -->
		<div class="csContainer">
			<h1>자주 묻는 질문</h1>
			<span class="faqMent">고객님의 궁금증을 해결해드립니다</span>
			
			<!-- 상단 메뉴바 -->
			<div class="faqTopMenu">
				<a href="csFaq?faqCls=5100"
				<c:if test="${param.faqCls == null || param.faqCls == '5100'}">class="active"</c:if>>
				전체</a>
				<a href="csFaq?faqCls=5200"
				<c:if test="${param.faqCls == '5200'}">class="active"</c:if>>
				구매가이드</a>
				<a href="csFaq?faqCls=5300"
				<c:if test="${param.faqCls == '5300'}">class="active"</c:if>>
				회원정보관리</a>
				<a href="csFaq?faqCls=5400"
				<c:if test="${param.faqCls == '5400'}">class="active"</c:if>>
				전문가</a>
				<a href="csFaq?faqCls=5500"
				<c:if test="${param.faqCls == '5500'}">class="active"</c:if>>
				배송</a>
				<a href="csFaq?faqCls=5600"
				<c:if test="${param.faqCls == '5600'}">class="active"</c:if>>
				내차팔기</a>
				<a href="csFaq?faqCls=5700"
				<c:if test="${param.faqCls == '5700'}">class="active"</c:if>>
				기타</a> 
			</div>

		 	<div class="faqList">	 	
		 		<div class="faqItem">
			 		<table class="faqTable">
				        <tbody>
							<c:forEach var="faq" items="${ listFaq }">
				               <c:choose>
				               		<c:when test="${selectCls==null }">
				               			<tr><td>
					               			<details>
										  		<summary>
											  		<span class="Q">Q.</span>
											  		${faq.faq_title}
											  	</summary>
										 		<span class="A">A.</span>
										 		<span class="answer">
													${faq.faq_content}<p>
										 		</span>
											</details>
										</td></tr>
				               		</c:when>
				               		
				               		<c:when test="${selectCls==5100}">
				               			<tr><td>
											<details>
										  		<summary>
											  		<span class="Q">Q.</span>
											  		${faq.faq_title}
											  	</summary>
										  		<span class="A">A.</span>
										 		<span class="answer">
													${faq.faq_content}<p>
										 		</span>
											</details>
										</td></tr>
									</c:when>
				               		<c:when test="${selectCls == faq.faq_cls}">
										<tr><td>
											<details>
										  		<summary>
											  		<span class="Q">Q.</span>
											  		${faq.faq_title}
											  	</summary>
											  	<span class="A">A.</span>
										 		<span class="answer">
													${faq.faq_content}<p>
										 		</span>
											</details>
										</td></tr>
									</c:when>
								</c:choose>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
		</div>
		
	</div>	
	<%@ include file="../footer.jsp" %>
</body>
</html>