<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userName = (String) session.getAttribute("userName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
	<a href="<%=request.getContextPath()%>">Main</a> |
	<% if(userName != null){ %>
		<%=userName%>님 반갑습니다. |
		<a href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>
	<%}else{%>
	<a href="<%=request.getContextPath()%>/join.jsp">회원가입</a> |
	<a href="<%=request.getContextPath()%>/login.jsp">로그인</a>
	<%}%>
</header>