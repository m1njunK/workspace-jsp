<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 스크립트 태그 - 자바 영역
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Insert title here</title>
</head>
<body>
	<h3>FIRST JSP!!!!</h3>
	<h2>id : <%out.print(id);%></h2>
	<h2>pw : <%out.print(pw);%></h2>
</body>
</html>