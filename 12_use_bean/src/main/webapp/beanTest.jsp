<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- beanTest.jsp -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>USE BEAN TEST</title>
</head>
<body>
	<h1>BEAN TEST</h1>
	<%
		beans.Member m = null;
		if(pageContext.findAttribute("m") == null){
			m = new beans.Member();
			System.out.println(m.getName());
			m.setName("LYS");
			System.out.println(m.getName());
			application.setAttribute("m",m);
		}else{
			m = (beans.Member) pageContext.findAttribute("m");
		}
	%>
	<%= m.toString() %> <br/>
	<%= pageContext.getAttribute("m") %> <br />
	<%= pageContext.findAttribute("m") %>
	
	<hr/>
	<h3>USE BEAN ACTION TAG</h3>
	<!-- scope="page"	기본값 -->
	<jsp:useBean id="aaa" class="beans.Member" />
	<jsp:useBean id="bbb" class="beans.Member" scope="request"/>
	<jsp:useBean id="ccc" class="beans.Member" scope="session"/>
	<jsp:useBean id="ddd" class="beans.Member" scope="application"/>
	<jsp:setProperty name="aaa" property="name" value="KGP" />
	<%=aaa.getName()%>
	
	<%
		beans.Member member
			= (beans.Member) pageContext.getAttribute("aaa");
		out.println(member.getName()+"<br/>");
	%>
	
	<h3>
		<jsp:getProperty property="name" name="ddd"/>
	</h3>
	
	<a href="beanTest2.jsp">beanTest2.jsp</a>
</body>
</html>