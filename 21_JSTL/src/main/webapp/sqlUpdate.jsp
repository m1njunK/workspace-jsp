<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="sqlUpdateSubmit.jsp" method="POST">
		<input type="hidden" name="num" value="${param.num}"/>
		<h3>기존 비밀번호를 입력해 주세요.</h3>
		<input type="password" name="pass" />
		<h3>수정할 비밀번호를 입력해 주세요.</h3>
		<input type="password" name="rePass" />
		<button>확인</button>
	</form>
</body>
</html>