<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    <!-- error_page.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 처리 실패</title>
</head>
<body>
	<h2>요청 처리 실패 - <%= exception.getMessage() %></h2>
	<h2>페이지를 이동하여 다시 요청해 주세요.</h2>
	<a href="<%=request.getContextPath()%>">MAIN PAGE</a>
</body>
</html>