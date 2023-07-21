<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>forwardTest.jsp</h1>
	<form action="forwardTest2.jsp" method="POST">
		<input type="hidden" name="resultPage" value="forwardTest1.jsp"/>
		이름 : <input type="text" name="name"> <br/>
		나이 : <input type="number" name="age" min="1" max="100"> <br/>
		<button>확인</button>
	</form>
</body>
</html>