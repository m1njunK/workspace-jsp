<%@page import="beans.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>beanResult.jsp</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String email = request.getParameter("email");
		String strAge = request.getParameter("age");
		int age = Integer.parseInt(strAge);
		
		MemberVO m = new MemberVO(name,addr,email,age);
		
		m.setName(name);
		m.setAddr(addr);
		m.setEmail(email);
		m.setAge(age);
		
		pageContext.setAttribute("a",m);
		System.out.println(m);
	%>
	<%=m.toString()%> <br/>
	
	<jsp:useBean id="a" class="beans.MemberVO"/>
	<jsp:getProperty property="name" name="a"/> <br/>
	<jsp:getProperty property="addr" name="a"/> <br/>
	<jsp:getProperty property="email" name="a"/> <br/>
	<jsp:getProperty property="age" name="a"/> <br/>
	<hr/>
	<!-- useBean 프로퍼티 활용 -->		
	<jsp:useBean id="m1" class="beans.MemberVO" />
	<jsp:setProperty property="*" name="m1"/>
	<%-- <jsp:setProperty property="name" name="m1" />
	<jsp:setProperty property="addr" name="m1" />
	<jsp:setProperty property="email" name="m1" />
 	--%>
	이름 : <jsp:getProperty property="name" name="m1"/> <br/>
	addr : <jsp:getProperty property="addr" name="m1"/> <br/>
	email : <jsp:getProperty property="email" name="m1"/> <br/>
	나이 : <jsp:getProperty property="age" name="m1"/> <br/>
			
</body>
</html>