<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>여기는 include test 1 입니다.</h1>

	<%-- <%@ include file="includeTest2.jsp" %> --%>
	
	<%-- <jsp:include page="includeTest2.jsp?name=CGK" /> --%>

	<jsp:include page="includeTest2.jsp">
		<jsp:param name="name" value="CGK"/>
	</jsp:include>
	
</body>
</html>