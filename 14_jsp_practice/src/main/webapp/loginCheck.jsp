<%@page import="javax.sql.CommonDataSource"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session"/>
<jsp:setProperty property="*" name="loginMember"/>
<!-- loginCheck.jsp -->
<%request.setCharacterEncoding("utf-8");%>
<%
	out.println("<script>");
	List<MemberVO> memberList = (List<MemberVO>) application.getAttribute("memberList");
	String id = loginMember.getId();
	String pw = loginMember.getPass();
	String name = null;
	String login = request.getParameter("login");
	
	if(memberList != null){
		for(MemberVO m : memberList){
			if(m.equals(loginMember) && m.getPass().equals(pw)){
				loginMember.setName(m.getName());
				loginMember.setAddr(m.getAddr());
				loginMember.setAge(m.getAge());
				loginMember.setGender(m.getGender());
				loginMember.setPhone(m.getPhone());
				name = loginMember.getName();
				break;
			}
		}
	}
	
	if(name != null){
		if(login != null){
			Cookie cookie = new Cookie("id",loginMember.getId());
			cookie.setMaxAge(60*60*24*30);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		session.setAttribute("loginMember", loginMember);
		out.println("alert('로그인 성공!')");
		out.println("location.href='index.jsp'");
	}else{
		session.removeAttribute("loginMember");
		out.println("alert('로그인 실패!')");
		out.println("history.go(-1)");
	}
	out.println("</script>");
%>







