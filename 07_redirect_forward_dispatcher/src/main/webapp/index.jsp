<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<!-- 
		jsp or servlet class 에서
		자바 코드로 페이지를 전환하는 기능
		1. response
		// 응답을 받은 브라우저에게
		// 우리가 전달한 페이지로 새롭게 요청을 전달하라고 send
		response.sendRedirect("이동할 페이지");
		
		2. RequestDispatcher forward
		request.getRequerstDispatcher("출력할 페이지").forward(request,response);
		요청을 처리할때 출력 할 페이지를 변경하는 방법
	 -->
	
	 <%
	 	pageContext.setAttribute("index", "111");
	 	request.setAttribute("index", "222");
	 %>
	 
	 <h3>pageContext attr : <%=pageContext.getAttribute("index") %></h3>
	 <h3>request attr : <%=request.getAttribute("index") %></h3>
	
	 <a href="result.jsp">result</a>
	 
</body>
</html>