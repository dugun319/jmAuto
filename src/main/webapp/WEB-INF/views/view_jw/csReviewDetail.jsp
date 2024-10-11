<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="/css/csReviewDetail.css" rel="stylesheet" type="text/css"/>
<meta charset="UTF-8">
<title>고객후기</title>
</head>
<body>
	<div class="Container">
	
		<div class="title">
			<div>${ review.review_title }</div>
		</div>
		
		<div class="carInfo">
			${ review.model }&emsp;|&emsp;
			${ review.manu_date_char }&emsp;|&emsp;
			${ review.mileage }&emsp;|&emsp;
			${ review.fuel }
		</div>
		
			
		<div class="evaluation">
			<span class="subtitle">평점</span>
			<c:choose>
				<c:when test="${review.evaluation == 5}">
					<img alt="별5점" src="../images/main/star_5.png" class="star_img">
				</c:when>
				<c:when test="${review.evaluation == 4}">
					<img alt="별4점" src="../images/main/star_4.png" class="star_img">
				</c:when>
				<c:when test="${review.evaluation == 3}">
					<img alt="별3점" src="../images/main/star_3.png" class="star_img">
				</c:when>
				<c:when test="${review.evaluation == 2}">
					<img alt="별2점" src="../images/main/star_2.png" class="star_img">
				</c:when>
				<c:otherwise>
					<img alt="별1점" src="../images/main/star_1.png" class="star_img">
				</c:otherwise>
			</c:choose>	
		</div>

		<div class="content"> ${ review.review_content }</div>

		<div class="car">
			<!-- 첨부 이미지들 -->
			 <c:if test="${not empty reviewImages.file_name1}">
	            <img src="${reviewImages.file_url}${reviewImages.file_name1}" alt="Review Image 1" class="revImg">
	        </c:if>
		    <c:if test="${not empty reviewImages.file_name2}">
	            <img src="${reviewImages.file_url}${reviewImages.file_name2}" alt="Review Image 2" class="revImg">
	        </c:if>
		    <c:if test="${not empty reviewImages.file_name3}">
	            <img src="${reviewImages.file_url}${reviewImages.file_name3}" alt="Review Image 3" class="revImg">
	        </c:if>
	        
	        <!-- 기본 이미지 -->
           	<img src="${reviewImages.img_url}" class="carImage">
		</div>
		
	</div>
</body>
</html>