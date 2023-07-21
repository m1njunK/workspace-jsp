<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		/*
		String name = request.getParameter("name");
		// out.print(name.toString());
		*/
		String age = request.getParameter("age");
		int ageInt = Integer.parseInt(age);
		out.print(ageInt);
	%>
</body>
</html>