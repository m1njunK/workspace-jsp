<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- withdraw.jsp -->
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session"/>
<jsp:useBean id="memberList" type="java.util.List<vo.MemberVO>" class="java.util.ArrayList" scope="application"/>
<%request.setCharacterEncoding("utf-8");%>
<%-- <%
	memberList.remove(loginMember);
	session.removeAttribute("loginMember");
	Cookie c = new Cookie("rememberMe","");
	c.setMaxAge(0);
	response.addCookie(c);
%> --%>
<%
	memberList.remove(loginMember);
	String path = request.getContextPath();
	response.sendRedirect(path+"/logOut.jsp");
%>
<!-- <script>
	alert("회원탈퇴 완료");
	location.href='index.jsp';
</script> -->






