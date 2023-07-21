<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session"/>
<%
	Cookie[] cookies = request.getCookies();
	String lid = loginMember.getId();	
	
	if(cookies != null && lid == null){
		for(Cookie c : cookies){
			String name = c.getName();
			String value = c.getValue();
			if(name.equals("id")){
				List<MemberVO> mList = (List<MemberVO>) application.getAttribute("memberList");
				if(mList != null){
					MemberVO member = new MemberVO(value);
					for(MemberVO m : mList){
						if(m.equals(member)){
							loginMember = m;
							session.setAttribute("loginMember", loginMember);
							break;
						}
					}
				}
				break;
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
<%
	String message = (String) request.getAttribute("message");
	if(message != null){
%>
<script>
	alert("<%=message%>");	
</script>
<%}%>
</head>
<body>
	<header>
		 <ul>
		 	<li><a href="index.jsp">HOME</a></li>
			<!-- 로그인 상태 -->
			<%
				String name = loginMember.getName();
				String id = loginMember.getId();
				if(name != null && id != null){
			%>
			<li><a href="info.jsp"> <%=name%> </a>님 반갑습니다.</li>
			<li><a href="logOut.jsp">로그아웃</a></li>
			<% } else { %>
			<!-- 비 로그인 상태 -->
		 	<li><a href="login.jsp">로그인</a></li>
		 	<li><a href="join.jsp">회원가입</a></li>
		 </ul>
		 <% } %>
 </header>
 
 
 
 
 
 