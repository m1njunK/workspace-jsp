<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- includeTest2.jsp -->
<hr />
	<h1>여기는 include test 2 입니다.</h1>
	<%
		String name = request.getParameter("name");
	%>
	
	<h2> test 2 <%=name%></h2>
<hr />