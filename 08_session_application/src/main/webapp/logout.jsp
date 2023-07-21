<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "common/header.jsp" %>
<h1>logout</h1>
<%
	// session.removeAttribute("userName");
	session.invalidate();
	response.sendRedirect(request.getContextPath());
%>
</body>
</html>