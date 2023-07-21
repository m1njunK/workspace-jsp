<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="test/page_error.jsp?aa=삼">page error</a> <br/>
	<a href="test/test_null.jsp">Null Test</a> <br/>
	<a href="test/test_500.jsp">500 Test</a> <br/>
	<a href="wow.jsp/">404 Test</a> <br/>
	<form action="test/test_405.jsp" method="post">
		<input type="number" name="age"/>
		<button>전송</button>
	</form>
</body>
</html>