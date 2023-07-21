<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result.jsp</title>
</head>
<body>
	<h3>pageContext attr : <%=pageContext.getAttribute("index") %></h3>
	<h3>request attr : <%=request.getAttribute("index") %></h3>
	
	<a href="response?id=chlrlrms">response send redirect</a>
	<hr/>
	<a href="dispatcher?id=chlrlrms">dispatcher forward</a>
	
</body>
</html>