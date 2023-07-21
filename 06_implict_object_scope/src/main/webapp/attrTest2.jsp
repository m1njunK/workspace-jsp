<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		
		if(email != null){
			session.setAttribute("email", email);
			request.setAttribute("reqEmail", email);
			application.setAttribute("email", email);
		}
		
	%>
	<h3>request param email <%=email%></h3>
	<h3>request param id <%=id%></h3>
	<h3>application id : <%=application.getAttribute("id")%></h3>
	<h3>pageContext id : <%=pageContext.getAttribute("pageID") %></h3>
	<h3>request email : <%=request.getAttribute("reqEmail") %></h3>
	<h3>session email : <%=session.getAttribute("email") %></h3>
	<h3>application email : <%=application.getAttribute("email") %></h3>
	
	<a href="attrTest3.jsp">확인하기</a>
</body>
</html>