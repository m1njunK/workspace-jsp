<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입</h2>
	<form action="joinSubmit.jsp" method="POST">
		아이디 : <input type="text" name="id" required/>	<br/>
		비밀번호 : <input type="password" name="pw" required/> <br />
		이름 : <input type="text" name="name" required/> <br />
		<button>회원가입</button>
		<button type="button" onclick="location.href='login.jsp';">로그인</button>
	</form>
</body>
</html>