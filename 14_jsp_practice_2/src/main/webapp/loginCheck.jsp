<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- loginCheck.jsp -->
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="memberList" type="java.util.List<vo.MemberVO>" class="java.util.ArrayList" scope="application"/>
<jsp:useBean id="dto" class="dto.LoginDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	if(memberList.isEmpty()){
		out.print("<script>");
		out.print("alert('회원가입부터 진행해주세욧!');");
		out.print("location.href='index.jsp?page=join';");
		out.print("</script>");
		return;
	}

	for(MemberVO m : memberList){
		if(m.getId().equals(dto.getId()) && m.getPass().equals(dto.getPass())){
			session.setAttribute("loginMember", m);
			if(dto.isRememberMe()){
				Cookie cookie = new Cookie("rememberMe",m.getId());
				cookie.setMaxAge(3600);
				response.addCookie(cookie);
			}
			out.print("<script>");
			out.print("alert('환영합니다!');");
			out.print("location.href='index.jsp';");
			out.print("</script>");	
			return;
		}
	}	
%>
<script>
	alert("아이디와 비밀번호를 확인해보거라");
	history.back();
</script>








