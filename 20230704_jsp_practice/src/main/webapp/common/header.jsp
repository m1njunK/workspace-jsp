<%@page import="java.util.List"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
	if(loginMember == null){
		List<MemberVO> memberList = (List<MemberVO>)application.getAttribute("memberList");
			Cookie[] cookies = request.getCookies();
			if(cookies != null){
				cookie : for(Cookie c : cookies){
					String name = c.getName();
					String id = c.getValue();
					System.out.println(name + " : " + id);
					if(name.equals("rememberMe")){
						// 자동 로그인 요청이 들어온 사용자 브라우저에 저장된 cookie
						if(memberList != null && !memberList.isEmpty()){
							for(MemberVO m : memberList){
								if(m.getId().equals(id)){
									loginMember = m;
									session.setAttribute("loginMember",m);
									break cookie; // label이 cookie인 반복문 break
								}
							} // end for
						} // end if
					} // end if
				} // end for
			} //end if
		} // end if
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
		 	
		 	<% if(loginMember != null){ %>
			<!-- 로그인 상태 -->
			<li><a href="info.jsp"> <!-- 회원이름 --> 
			<%=loginMember.getName()%></a>님 반갑습니다.</li>
			<li><a href="logOut.jsp">로그아웃</a></li>
			<%}else{%>
			<!-- 비 로그인 상태 -->
		 	<li><a href="login.jsp">로그인</a></li>
		 	<li><a href="join.jsp">회원가입</a></li>
			<%}%>
		 </ul>
 </header>
 
 
 
 
 
 