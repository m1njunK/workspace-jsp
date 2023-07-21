<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- logOut.jsp -->
<%
	session.removeAttribute("loginMember");

	// 등록된 자동로그인 쿠키 삭제
	Cookie cookie = new Cookie("rememberMe","");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
%>
<script>
	alert("로그아웃완료");
	location.href='index.jsp';
</script>