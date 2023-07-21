<!-- webapp/index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메인 페이지</h1>
	<a href="page_contentType01.jsp">contentType1</a> <br/>
	<a href="page_info.jsp">info</a> <br/>
	<!-- 억지로 에러를 만들어내는 페이지 -->
	<a href="null_error.jsp?age=삼십">null_error.jsp</a>
</body>
</html>