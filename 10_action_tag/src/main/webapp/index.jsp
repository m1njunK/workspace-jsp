<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Action Tag</title>
</head>
<body>
	<% String s = "test Text"; %>
	<jsp:text>
		<![CDATA[
		CDATA : Character Data 의 약자
		[] 안에 있는 문장은 파싱되지 않고 그대로 문자열로 출력됨.
		<h1>
		단순히 문자열 텍스트를 출력한다는 걸 명시하기 위한 액션태그
		텍스트 이외의 다른 JSP 태그나 표현식을 사용할 수 없음.
		<%=s%>
		</h1>
		]]>
	</jsp:text>
	<a href="includeTest1.jsp">include action tag</a>
	<br/>
	<a href="forwardTest.jsp">forward action tag</a>
	<br/>
	<a href="xmlGenerator.jsp">element action tag</a>
</body>
</html>