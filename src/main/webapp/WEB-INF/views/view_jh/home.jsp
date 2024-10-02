 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.userForm {
	    display: flex;
	    justify-content: center; 
	    align-items: center;   
	    height: 100vh;           
	    padding: 20px 50px;		
	    font-size: 20px;	    
	}	
</style>
</head>
<body>
        <div class="userForm">
            <form action="/view_jm/login" method="post">
                <input type="text" placeholder="아이디" name="user_id" required="required"><p>
                    <input type="password" placeholder="비밀번호" name="user_pw" required="required"><p>
                    <input type="submit" value="로그인">
            </form>
          
        </div>
</body>
</html>