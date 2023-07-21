<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>xmlGenerator.jsp</title>
<style>
	cgg{
		border:1px solid red;
		padding:10px;
		display:block;
	}
	
	#cggId{
		color:white;
	}
	
	.cggClass{
		background-color:black;
	}
</style>
</head>
<body>
	<!-- Custom tag 추가 -->
	<jsp:element name="cgg">
		<jsp:attribute name="id">
		cggId
		</jsp:attribute>
		<jsp:attribute name="class">
		cggClass
		</jsp:attribute>
		<jsp:body>
		<h3>cgg id 속성값은 cggId</h3>
		</jsp:body>
	</jsp:element>
</body>
</html>