<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

#floatMenu {
	position: absolute;
	display:flex;
	justify-content:space-between;
	right : 40px;
	bottom : 40px;
	color: #fff;
}

</style>

<script type="text/javascript">

	$(function() {
		//플로팅 배너 위치(top value)값을 가져와 저장
		var floatPosition = parseInt($("#floatMenu").css('top'));

		$(window).scroll(function() {
			// 현재 스크롤 위치를 가져와서 position 값을 연산 / 저장
			var scrollTop 	= $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";

			/* $("#floatMenu").css('top', newPosition); */

			$("#floatMenu").stop().animate({
				"top" : newPosition
			}, 300);

		}).scroll();

	});
</script>
</head>

<body>
	<div id="floatMenu">
    	<a href="https://open.kakao.com/o/sLynhoOg"><img alt="kakao" src="<%=request.getContextPath()%>/images/main/kakao.png"
      	style="width: 56px; height: 56px;"></a>
     </div>
</body>
</html>