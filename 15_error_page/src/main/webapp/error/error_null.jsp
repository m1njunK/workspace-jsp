<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error_null.jsp</title>
</head>
<body>
	<h3>필수 요청 값이 존재 하지 않습니다.</h3>
	<h2>확인 후 다시 요청 바랍니다.</h2>
	<%= exception.toString() %>
	<a href="../index.jsp">메인으로</a>
</body>
</html>