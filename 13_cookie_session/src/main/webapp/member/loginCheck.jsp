<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- loginCheck.jsp -->
<jsp:useBean id="joinMember" class="beans.MemberBean" scope="application" />
<jsp:useBean id="loginMember" class="beans.MemberBean" scope="session"/>
<jsp:setProperty name="loginMember" property="*"/>

<%
	out.println("<script>");	
	if(joinMember.getId() != null 
		&& loginMember.getId().equals(joinMember.getId()) 
		&& loginMember.getPw().equals(joinMember.getPw())){
		loginMember.setName(joinMember.getName());
		
		// 로그인 상태 유지 처리
		String login = request.getParameter("login");
		if(login != null){
			// 체크박스 체크
			Cookie cookie = new Cookie("id",loginMember.getId());
			cookie.setMaxAge(60*60*24*30);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		
		out.println("alert('로그인 성공')");
		out.println("location.href='index.jsp'");
		
	}else{
		// 로그인 실패
		session.removeAttribute("loginMember");
		out.println("alert('로그인 실패')");
		out.println("history.go(-1);");
	}
	out.println("</script>");
%>