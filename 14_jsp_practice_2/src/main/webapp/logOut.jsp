<%@ page pageEncoding="UTF-8"%>
<!-- logOut.jsp -->
<%
	session.invalidate();
	Cookie c = new Cookie("rememberMe","");
	c.setMaxAge(0);
	response.addCookie(c);
%>
<script>
	alert('로그아웃 되었습니다.');
	location.href='index.jsp';
</script>






