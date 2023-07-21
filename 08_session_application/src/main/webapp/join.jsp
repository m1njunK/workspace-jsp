<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "common/header.jsp" %>
<!-- join.jsp -->	
	<h1>JOIN</h1>
	<form action="joinCheck.jsp" method="POST">
		아이디 : <input type="text" name="id" /> <br/>
		비밀번호 : <input type="password" name="pw" /> <br/>
		이름 : <input type="text" name="name" />	<br/>
		<button>회원 가입</button>
	</form>
</body>
</html>