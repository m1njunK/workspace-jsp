<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이동된 페이지(forwardTest1.jsp)</h1>
	이름 : <%=request.getParameter("name") %> <br/>
	나이 : <%=request.getParameter("age") %> <br/>
	전화번호 : <%=request.getParameter("tel") %> <br/>
	<a href="/10_action_tag">Main 으로</a>
</body>
</html>