<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertFrom.jsp</title>
</head>
<body>
	<form action="insertExcute.jsp" method="POST">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" required/></td>
			</tr>
			<tr>
				<th colspan="2"><button>등록</button></th>
			</tr>
		</table>
	</form>
</body>
</html>