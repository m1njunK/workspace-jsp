<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="joinMember" class="beans.MemberBean" scope="application"/>
<jsp:useBean id="loginMember" class="beans.MemberBean" scope="session"/>
<%
	
	Cookie[] cookies = request.getCookies();
	
	String lid = loginMember.getId();	// 로그인 정보
	String jid = joinMember.getId();	// 회원가입 정보

	if(cookies != null && jid != null && lid == null){
		
		for(Cookie c : cookies){
			String name = c.getName();
			String value = c.getValue();
			System.out.println(name+":"+value);
			if(name.equals("id") && jid.equals(value)){
				session.setAttribute("loginMember",joinMember);
				break;
			}
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<h1>member index</h1>
	<%
		String name = loginMember.getName();
		
		if(name != null){
	%>
	
	<a href="logOut.jsp">로그아웃</a> |
	<%=name%>님 방가방가
	
	<% }else{ %>	
				
	<a href="login.jsp">로그인</a> | <a href="join.jsp">회원가입</a>		
	
	<% } %>

</body>
</html>