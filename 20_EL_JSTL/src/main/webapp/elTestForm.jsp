<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EXPRESSION LANGUAGE - 표현언어</title>
</head>
<body>
	<h1>EXPRESSION LANGUAGE - 표현언어</h1>
	<h2>
		4대 영역 객체의 속성값을 JSP page내에서
		쉽게 연산하고 읽어서 출력할 수 있도록 구성된 언어
	</h2>
	
<%
	// 4대 영역 객체에 각각 `scopeName`이라는 key값으로 속성값을 저장
/* 	pageContext.setAttribute("scopeName", "pageContext 영역"); */
	request.setAttribute("scopeName", "request 영역");
	session.setAttribute("scopeName", "session 영역");
	application.setAttribute("scopeName", "application 영역");
%>

page 영역 : <%=pageContext.getAttribute("scopeName") %> 	<br />
request 영역 : <%=request.getAttribute("scopeName") %> 	<br />
session 영역 : <%=session.getAttribute("scopeName") %> 	<br />
application 영역 : <%=application.getAttribute("scopeName") %> 	<br />
<hr />
<h3>EL 표현식 - \${영역객체.key값}</h3>
page EL : ${pageScope.scopeName} <br />
request EL : ${requestScope.scopeName} <br />
session EL : ${sessionScope.scopeName} <br />
application EL : ${applicationScope.scopeName} <br />
<hr />

<%-- <% pageContext.removeAttribute("scopeName"); %> --%>
EL 	scopeName : ${requestScope.scopeName} <br />
EL 	scopeName : ${scopeName} <br />
<hr />
<%
	session.setAttribute("test", "aaa");
	application.setAttribute("test", "application");
%>
<%
	session.removeAttribute("test");
%>
EL TEST : ${applicationScope.test} <br />
EL TEST : ${test} <br />
<hr />

<form action="elTest.jsp" method="POST">
	<input type="text" name="id" />
	<input type="submit" value="확인" />
</form>
</body>
</html>