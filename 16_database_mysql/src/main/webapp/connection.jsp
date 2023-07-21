<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
	<!--  connection.jsp -->
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/digital_jsp",
		"digital",
		"12345"
	);
%>