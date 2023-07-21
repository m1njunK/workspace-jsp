<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "common/header.jsp" %>
<%
	String message = (String) request.getAttribute("message");
%>
<%
	if(message != null){
%>
<script>
	alert('<%=message%>');
</script>
<% }%>
<h1>LOGIN</h1>
<form action="loginCheck.jsp" method="POST">
	아이디 : <input type="text" name="id" /> <br/>
	비밀번호 : <input type="password" name="pw" /> <br/>
	<button>확인</button>
</form>
</body>
</html>