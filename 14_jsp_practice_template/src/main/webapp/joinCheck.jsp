<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- joinCheck.jsp -->
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="joinMember" class="vo.MemberVO" />
<jsp:setProperty name="joinMember" property="*"/>

<jsp:useBean id="memberList" type="java.util.List<vo.MemberVO>" class="java.util.ArrayList" scope="application"/>

<%
	if(memberList.contains(joinMember)){
		// 중복 아이디
		out.print("<script>");
		out.print("alert('이미 사용중인 아이디 입니다.');");	
		out.print("history.back();");
		out.print("</script>");	
	}else{
		memberList.add(joinMember);
		out.print("<script>");
		out.print("alert('회원가입 성공');");	
		out.print("location.href='index.jsp?page=login';");
		out.print("</script>");	
	}

	System.out.println("====================================");
	for(MemberVO m : memberList){
		System.out.println(m);
	}
	System.out.println("====================================");
%>


















