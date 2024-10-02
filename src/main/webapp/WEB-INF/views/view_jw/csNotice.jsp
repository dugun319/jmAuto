<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header_white.jsp" %>
<%@ include file="../kakao.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="/css/csNotice.css" rel="stylesheet" type="text/css"/>
<meta charset="UTF-8">
<title>공지사항 및 약관확인</title>
</head>
<body>

	<div class="notice">
		<!-- 사이드바 -->
		<div class="noticeSidebar">
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
		
		<!-- 공지사항 메인 내용 -->
		<div class="noticeContainer">
			<h1>공지사항 및 약관</h1>
			<span class="noticeMent">공지사항 및 이용약관을 확인해주세요</span>
				
			<!-- 상단 메뉴바 -->
			<div class="noticeTopMenu">
				<a href="csNotice?noticeCls=6100"
					<c:if test="${param.noticeCls == null || param.noticeCls == '6100'}">
					    <c:set var="selNoticeCls" 		value="6100"></c:set>
						class="active"
					</c:if>>
					공지사항
				</a>
				
				<a href="csNotice?noticeCls=6200"
					<c:if test="${param.noticeCls == '6200'}">
					    <c:set var="selNoticeCls" 	 value="6200"></c:set>
						class="active"
					</c:if>>
					이용약관
				</a>
			</div>
			
			<!-- 공지사항, 약관 리스트 -->
			<div class="noticeList">	 	
		 		<table class="noticeTable">
			        <tbody>
			        	<c:forEach var="notice" items="${ listNotice }">
			        		<c:choose>
			        			<c:when test="${ selNoticeCls == '6100' && 
			        			(notice.notice_cls == '6100' || notice.notice_cls == '6300') }">
									<tr><td>
										<span>
											<c:choose>
												<c:when test="${ notice.notice_cls == '6100' }">
			                                        <span class="gongji">공지사항</span>
			                                    </c:when>
			                                    <c:otherwise>
			                                        <span class="event">이벤트</span>
			                                    </c:otherwise>
											</c:choose>
										</span>
										<a href="../view_jw/csNoticeSelect" class="noticeButton">
											${ notice.notice_title }
										</a>
										<span class="date">
											<fmt:formatDate type="date" value="${ notice.notice_date }" pattern="YYYY/MM/dd"/>
										</span>
									</td></tr>
								</c:when>
			        			<c:when test="${ selNoticeCls == '6200' && notice.notice_cls == '6200' }">
									<tr><td>
										<span class="eYong">이용약관</span>
										<a href="../view_jw/csNoticeSelect" class="noticeButton">	
											${ notice.notice_title }
										</a>
										<span class="date">
											<fmt:formatDate type="date" value="${ notice.notice_date }" pattern="YYYY/MM/dd"/>
										</span>
									</td></tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
		</div>
		
	</div>
	<%@ include file="../footer.jsp" %>
</body>
</html>