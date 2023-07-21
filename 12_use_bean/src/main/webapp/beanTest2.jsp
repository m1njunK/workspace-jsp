<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>beanTest2.jsp</title>
</head>
<body>
	<form action="beanResult.jsp" method="POST">
		이름 : <input type="text" name="name" required/> <br/>
		주소 : <input type="text" name="addr" required/> <br/>
		이메일 : <input type="email" name="email" required/> <br/>
		나이 : <input type="number" name="age" min="1" max="100" required />
		<button>쏘세요!</button>
	</form>
</body>
</html>