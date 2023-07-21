<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session"/>
<jsp:useBean id="memberList" type="java.util.List<vo.MemberVO>" class="java.util.ArrayList" scope="application"/>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null && loginMember.getId() == null && !memberList.isEmpty()){
		for(Cookie c : cookies){
			if(c.getName().equals("rememberMe")){
				String id = c.getValue();
				int index = memberList.indexOf(new MemberVO(id));
				loginMember = memberList.get(index);
				session.setAttribute("loginMember",loginMember);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/common.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		 <ul>
		 	<li><a href="index.jsp">HOME</a></li>
			<!-- 로그인 상태 -->
			<%if(loginMember.getId() != null){ %>
			<li><a href="index.jsp?page=info"> 
			<%=loginMember.getName()%></a> 님 반갑습니다.</li>
			<li><a href="logOut.jsp">로그아웃</a></li>
			<%} else {%>
			<!-- 비 로그인 상태 -->
		 	<li><a href="index.jsp?page=login">로그인</a></li>
		 	<li><a href="index.jsp?page=join">회원가입</a></li>
		 	<%}%>
		 </ul>
 </header>
 
 
 
 
 
 