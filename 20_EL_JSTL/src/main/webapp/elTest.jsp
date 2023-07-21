<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		session.setAttribute("sessionID", id);
	%>
	<br />
	EL scope session : ${sessionScope.sessionID} <br />
	EL ${sessionID} <br />
	<input type="text" value="${param.id}" />	
</body>
</html>