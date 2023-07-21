<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>response.jsp</h1>
	<h3>pageContext attr : <%=pageContext.getAttribute("index") %></h3>
	<h3>request attr : <%=request.getAttribute("index") %></h3>
	<h3>request servlet attr : <%=request.getAttribute("response") %></h3>
	<h3>request parameter : <%=request.getAttribute("id") %></h3>
</body>
</html>