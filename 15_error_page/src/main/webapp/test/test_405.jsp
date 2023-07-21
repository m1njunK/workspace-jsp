<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test_405.jsp</title>
</head>
<body>
	<%
		// 전달된 요청 전송 방식
		String method = request.getMethod().toLowerCase();
	
		if(method.equals("get")){
			// response.setStatus(405);
			response.sendError(405,"지정된 전송방식이 아입니다.");
			return;
		}
			
		String age = request.getParameter("age");
		if(age != null && !age.equals("")){
			int a = Integer.parseInt(age);
			out.println("나이는 : " + a);
		}
	%>
</body>+
</html>