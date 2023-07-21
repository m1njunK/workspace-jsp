<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- withdraw.jsp -->
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session"/>
<jsp:useBean id="memberList" type="java.util.List<vo.MemberVO>" class="java.util.ArrayList" scope="application"/>
<%
	// 회원목록에서 현재 로그인된 회원 정보 삭제
	memberList.remove(loginMember);
	String contextPath = request.getContextPath();
	// 회원 정보 삭제 후 session 및 cookie 기록도 삭제
	response.sendRedirect(contextPath+"/logOut.jsp");
%>








