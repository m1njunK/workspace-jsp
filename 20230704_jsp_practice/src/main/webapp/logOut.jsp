<%@ page pageEncoding="UTF-8"%>
<!-- logOut.jsp -->
<%
	session.removeAttribute("loginMember");
	// 사용자 브라우저에 등록된 rememberMe cookie 정보 삭제
	Cookie cookie = new Cookie("rememberMe","");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
%>
<script>
	alert('처리 완료');
	location.href = 'index.jsp';
</script>






