<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlCore.jsp</title>
</head>
<body>
	<h3>JSP STANDARD TAG LIBRARY</h3>
	<!-- 특정 영역 객체에 속성 값을 추가 -->
	<c:set var="varPage" value="page 영역" scope="page"/>
	<% String id = "id001"; %>
	EL : ${varPage} <br />
	EL : ${id} <br />
</body>
</html>