<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	
	application.setAttribute("id", id);
	application.setAttribute("pw", pw);
	application.setAttribute("name", name);
	
	response.sendRedirect("login.jsp");
%>