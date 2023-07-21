<!-- webapp/page_info.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = sdf.format(new Date());
		// _jspService의 response.getWriter();
		// out 내장객체를 이용하여 출력
		out.println(date+"<br/>");
	%>

	<%@ page info="Date 클래스를 이용한 날짜 출력하기" %>
	Today is <%= new Date() %>
	<br/>
	<!-- Jasper JSP 3.1 엔진 -->
	<%= getServletInfo() %>
</body>
</html>