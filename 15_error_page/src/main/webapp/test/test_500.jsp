<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/test_500.jsp</title>
</head>
<body>
	<%
		if(request.getParameter("aa") == null){
			throw new ClassNotFoundException("없지롱");
		}
	%>
</body>
</html>