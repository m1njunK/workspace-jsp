<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 선언부 class 영역 -->
<%!
	// <%!실행문 사용 불가
	// System.out.println("Hello JSP"); 
	
	// FIELD
	String s = "test";
	int count = 0;

	String getStr(String str){
		s+=str;
		count++;
		return s;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>TIME JSP</h1>
	<!-- 표현문 response 응답 객체를 이용하여 출력 -->
	<%= getStr("컴퓨터 바보 멍청이!!!") + count %>
	<!-- 스크립틀릿 scriptlet java 실행문 작성 공간 -->
	<%
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat();
		String time = sdf.format(new java.util.Date());
	%>
	<hr/>
	<span>현재 시간 : <%-- <%=time%> --%>></span><br/>
</body>
</html>