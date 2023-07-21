<%@page import="java.util.Base64"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session"/>
<jsp:useBean id="memberList" 
type="java.util.List<vo.MemberVO>" 
class="java.util.ArrayList" 
scope="application" />

<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null && !memberList.isEmpty() && loginMember.getId() == null){
		for(int i = 0 ; i < cookies.length; i++){
			Cookie cookie = cookies[i];
			String name = cookie.getName();
			String id = cookie.getValue();
			
			// BASE64 ASCII 문자로 표현된 문자를 원본 문자로 복원 
			byte[] encodedID = Base64.getDecoder().decode(id.getBytes());
			id = new String(encodedID);
			
			if(name.equals("rememberMe")){
				int index = memberList.indexOf(new MemberVO(id));
				if(index >= 0){
					loginMember = memberList.get(index);
					session.setAttribute("loginMember",loginMember);
					break;
				}
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
		 	<% if(loginMember.getId() != null){ %>
			<!-- 로그인 상태 -->
			<li><a href="index.jsp?page=info"> <!-- 회원이름 -->
				<%=loginMember.getName() %> </a>님 반갑습니다.</li>
			<li><a href="logOut.jsp">로그아웃</a></li>
			<% }else { %>
			<!-- 비 로그인 상태 -->
		 	<li><a href="index.jsp?page=login">로그인</a></li>
		 	<li><a href="index.jsp?page=join">회원가입</a></li>
		 	<%
		 		session.removeAttribute("loginMember");
				}
		 	%>
		 </ul>
 </header>
 
 
 
 
 
 