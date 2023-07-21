<%@page import="vo.MemberVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- loginCheck.jsp -->
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String rememberMe = request.getParameter("rememberMe");
	
	List<MemberVO> memberList = (List<MemberVO>) application.getAttribute("memberList");
	
	if(memberList == null){
		out.println("<script>");
		out.println("alert('등록된 회원정보가 없습니다. 회원가입부터 진행해주세요')");
		out.println("location.href = 'join.jsp';");
		out.println("</script>");
		return;
	}
	
	for(MemberVO m : memberList){
		if(m.getId().equals(id) && m.getPass().equals(pass)){
			session.setAttribute("loginMember",m);
			if(rememberMe != null){
				Cookie cookie = new Cookie("rememberMe",m.getId());
				cookie.setMaxAge(60*60*24*15);
				response.addCookie(cookie);
			}
			out.println("<script>");
			out.println("alert('" + m.getName() + "님 로그인 성공!');");
			out.println("location.href = 'index.jsp';");
			out.println("</script>");
			return;
		}
	}	
%>
<script>
	alert('로그인 실패');
	history.back();
</script>








