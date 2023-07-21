<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인!</h2>
	<form action="loginCheck.jsp" method="POST">
		아이디 : <input type="text" name="id" required> <br/>
		비밀번호 : <input type="password" name="pw" required/> <br/>
		<label>
			<input type="checkbox" name="login" value="login">
			로그인 상태 유지
		</label> <br/>
		<input type="submit" value="로그인"/>
		<input type="button" value="MAIN" onclick="location.href='index.jsp'"/>
		<input type="button" value="회원가입" onclick="location.href='join.jsp'"/>
	</form>
	
</body>
</html>