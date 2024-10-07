<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<%@ include file="../kakao.jsp"%>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript"></script>

<title>구매자마이페이지</title>
<link rel="stylesheet" href="../css/myPage.css">
<div class="header_continer"><%@ include file="../header_white.jsp"%></div>
<div class="menu_continer"><%@ include file="../menu_B.jsp" %></div>
</head>
 
<style>
label {
	display: block;
	margin: 10px 0 5px;
}

.star-rating {
	display: flex;
	align-items: center;
	justify-content: center;
	border-bottom: 2px solid gray; /* 아래쪽 테두리 */
	padding-bottom: 15px;
	flex-direction: column;
}

.star {
	appearance: none;
	padding: 1px;
}

.star::after {
	content: '☆';
	color: yellow;
	font-size: 40px;
}

.star:hover::after, .star:has( ~ .star:hover)::after, .star:checked::after,
	.star:has( ~ .star:checked)::after {
	content: '★';
}

.star:hover ~ .star::after {
	content: '☆';
}

.chu-img {
	width: 150px;
	height: auto;
	margin: 0;
	padding: 0;
}

table.hoogi-gumae {
	width: 100%;
	border-collapse: collapse;
	margin-top: 0;
}

td {
	padding: 10px;
	vertical-align: middle;
}

.image-cell {
	text-align: right;
}

tr, td {
	border: none;
	padding-bottom: 20px;
}

tr:last-child {
	border-bottom: 2px solid gray; /* 아래쪽 테두리 */
}

tr {
	border: none; /* 각 행의 기본 테두리 제거 */
}

.info {
	color: gray;
	margin-right: 10px;
}

.rating-label {
	display: block;
	margin-top: 10px;
	color: gray;
	text-align: center;
}

.file-upload {
	display: none;
}

.file-upload-label {
	display: inline-block;
	padding: 10px 20px;
	width: 100px; /* 너비 */
	height: 90px; /* 높이 */
	border: 2px dashed gray; /* 테두리 스타일 */
	border-radius: 5px;
	background-color: #f9f9f9;
	cursor: pointer;
	text-align: center;
	color: gray;
	margin: 10px 0;
}

.file-upload-label:hover {
	background-color: #e0e0e0; /* 마우스 오버 시 색상 변경 */
}

input[type="text"], textarea {
	width: 100%; /* 너비 100%로 설정 */
	max-width: 400px; /* 최대 너비 조정 */
	padding: 10px; /* 패딩 추가 */
	margin-bottom: 20px; /* 아래 여백 추가 */
	border: 1px solid #ccc; /* 테두리 */
	border-radius: 4px; /* 테두리 둥글게 */
	box-sizing: border-box; /* 패딩 및 테두리 포함 */
}

.file-preview-container {
	display: flex; /* 가로로 나열 */
	flex-wrap: wrap; /* 줄바꿈 */
	margin-top: 10px;
}

.file-preview {
	display: flex;
	align-items: center;
	margin-right: 10px; /* 오른쪽 여백 */
	margin-bottom: 5px; /* 아래쪽 여백 */
}

#filePreview {
	max-width: 200px;
	max-height: 200px;
	margin-left: 10px;
}

.img {
	display: flex; /* 폼 그룹 내의 항목들을 플렉스 박스로 배치합니다. */
	align-items: center; /* 폼 그룹 내 항목들을 수직 중앙에 정렬합니다. */
	margin: 0 auto;
}

.img input {
	display: none;
}

/* 가로세로 비율 맞추기 위해 하나만 설정함 */
#Imgs1, #Imgs2, #Imgs3 {
	width: 400px;
	height: 300px;
	margin-right: 50px;
	align-items: center;
}
</style>
<script type="text/javascript">

	 
	// fileSelect 함수 수정: 선택한 파일을 특정 img 태그로 미리보기
    function fileSelect(input, targetImg) {
    		/* 사용자가 파일을 선택하고 그 파일이 한 개 이상인 경우 (배열로 나타내는 듯..) */
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function(e) {
            	
            	// $(targetImg) = "#mainImg" 같은 전달받은 미리보기를 출력할 이미지의 id 정보 전달
                // 선택한 파일을 이미지 태그의 src 속성에 설정하여 미리보기
                // .attr = HTML 속성(attribute)을 설정 >> src 경로를 설정하기 위함
                // e.target.result = FileReader 객체를 통해 읽은 파일의 데이터 URL
                $(targetImg).attr("src", e.target.result);
            }
            
            reader.readAsDataURL(input.files[0]);  // 파일을 읽어서 DataURL 형식으로 변환
        }
    }

	/* 이미지 업로드시 이미지 미리보기 구현 */
	/* 해당 버튼을 누를 때까지 대기함 */
	$(document).ready(function() {
    // 메인 이미지 선택 버튼을 누르면 파일 선택 창 열기
    $("#Imgs1").on("click", function(e) {
        e.preventDefault();// 버튼의 기본 동작을 막음 (submit 방지)
        $("#img1Input").click(); // 사용자가 input 버튼을 누르면 파일 선택창 출력
    });

    $("#Imgs2").on("click", function(e) {
        e.preventDefault();
        $("#img2Input").click();
    });
    $("#Imgs3").on("click", function(e) {
        e.preventDefault();
        $("#img3Input").click();
    });

	
    // 사용자가 input 버튼을 클릭해서 안에 내용물을 바꾸는 경우 실행
    // "change" = 각 파일 입력 요소에서 파일이 변경되면 미리보기 처리
    $("#img1Input").on("change", function() {
    	/* this = <input type="file">  >> 파일을 선택한 input이 무엇인지 이름을 가르킴, 이미지 아이디 "#mainImg"에 미리보기 전달*/
        fileSelect(this, "#Imgs1");
    });
    $("#img2Input").on("change", function() {
        fileSelect(this, "#Imgs2");
    });
    $("#img3Input").on("change", function() {
        fileSelect(this, "#Imgs3");
    });
    
});
    </script>
<body>
	
	<div class="container">
		<main class="content">
			<h1 class="text-center">
				<a href="#">구매후기 작성</a>
			</h1>
			<div class="block">
				<form action="/hoogiwrite" method="POST" enctype="multipart/form-data">
					<input type="hidden" name="approval_num" value="${approval_num}">
					<table class="hoogi-gumae">
						<tr>
							<td class="image-cell"><img alt="chuCarimg" src="../images/main/377조7542_1.png" class="chu-img"></td>
							
							<td class="text-cell">계약 번호 : ${approval_num}
								<p></p> <c:forEach var="Car_General_Info"
									items="${car_general_info}">${Car_General_Info.model}</c:forEach>
								<c:forEach var="Car_General_Info" items="${car_general_info}">
									<div class="gugu">
										<span class="info">${Car_General_Info.manu_date}</span> 
										<span class="info">|</span> <span class="info">${Car_General_Info.mileage}</span>
										<span class="info">|</span> <span class="info">${Car_General_Info.fuel}</span>
										<span class="info">|</span> <span class="info">${Car_General_Info.user_id}</span>
									</div>
								</c:forEach>
							</td>
						</tr>
					</table>

					<!-- 별점체크 -->
					<label for="rating" style="font-size: 10px; color: gray;">상품은
						만족하셨나요 ?</label>
					<div class="star-rating">
						<div class="star-container">
							<input type="radio" class="star" name="evaluation" value="1">
							<input type="radio" class="star" name="evaluation" value="2">
							<input type="radio" class="star" name="evaluation" value="3">
							<input type="radio" class="star" name="evaluation" value="4">
							<input type="radio" class="star" name="evaluation" value="5">
						</div>
						<span class="rating-label">선택해주세요</span>
					</div>
					<!-- 별점체크 -->

					<div class="input-container">
						<label for="title">후기 작성</label> <br> 제목 <input type="text"
							id="review_title" name="review_title" required>
					</div>
					<div class="input-container">
						<label for="review">내용</label> 내용
						<textarea id="review_content" name="review_content" rows="5"
							required></textarea>
					</div>
					<br> <br> <br>
					<div class="img">
						<input type="file" id="img1Input" accept=".jpg, .jpeg, .png" name="img_url_1"> 
						<img id="Imgs1" alt="" src="../images/sellMyCar/이미지선택해주세요.png"> 
						
						<input type="file" id="img2Input" accept=".jpg, .jpeg, .png" name="img_url_2">
						<img id="Imgs2" alt="" src="../images/sellMyCar/이미지선택해주세요.png">

						<input type="file" id="img3Input" accept=".jpg, .jpeg, .png" name="img_url_3"> 
						<img id="Imgs3" alt="" src="../images/sellMyCar/이미지선택해주세요.png"> 
					</div>

					<br> 
					<span style="color: orange; font-size: 8px;">
					상품과 무관한 사진을 첨부한 리뷰는 통보없이 삭제됩니다.</span>
					<br> <br> <br>
					<button type="submit"><img alt="" src="../images/main/리뷰작성_but.png"></button>
				</form>
			</div>
		</main>
</div>
<!--------------------------------------- 푸터 --------------------------------------->
	<%@ include file="../footer.jsp"%>
</body>
</html>