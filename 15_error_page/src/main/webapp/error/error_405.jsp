<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error_405.jsp</title>
</head>
<body>
	<h1>405 - 그렇게 요청 하면 안되요.</h1>
	<%--<h2><%=exception.getMessage()%></h2>--%>
	<a href="<%=request.getContextPath()%>/index.jsp">메인으로</a>
</body>
</html>