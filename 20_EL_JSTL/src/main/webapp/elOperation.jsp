<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>elOperation</title>
</head>
<body>
	<h2>EL 표현언어 내부에서의 연산</h2>
	<h3>\${5 + 7} : ${ 5 + 7}</h3>
	<h3>\${5 == 7} : ${ 5 == 7}</h3>
	<h3>\${5 &lt; 7} : ${ 5 < 7}</h3>
	<h3>\${5 + 7 == 8 ? true : false} : ${5 + 7 == 8 ? true : false}</h3>
	<%
		String s = null;
		String s1 = new String("hi");
		String s2 = new String("attribute");
		String s3 = new String("attribute");
		request.setAttribute("s", s);
		request.setAttribute("s2", s2);
		session.setAttribute("s1", s1);
		session.setAttribute("s3", s3);
	%>
	<!-- 비교 연산 -->
	<h3>\${s == s1} : ${s == s1}</h3>
	<h3>\${s2 == s3} : ${s2 == s3}</h3>
	<h3>\${s1 != s} : ${s1 != s}</h3>
	<h3>\${s2 eq s3} : ${s2 eq s3}</h3>	<!-- equals -->
	<h3>\${s2 ne s3} : ${s2 ne s3}</h3> <!-- not equals -->
	<hr />
	<h3>\${s != s1 && s2 != s3} : ${s != s1 && s2 != s3}</h3>
	<h3>\${s != s1 and s2 != s3} : ${s != s1 and s2 != s3}</h3>
	<h3>\${s ne sq || s2 ne se} : ${s ne sq || s2 ne se}</h3>
	<h3>\${s ne sq or s2 ne se} : ${s ne sq or s2 ne se}</h3>
	<hr />
	<h3>\${s1 ne "hi"} : ${s1 ne "hi"}</h3>		
	<h3>\${s1 eq "hi"} : ${s1 eq "hi"}</h3>		
	
	<%
		ArrayList<String> list = null;
		request.setAttribute("list", list);
	%>
	
	<h3>\${empty list} : ${empty list}</h3>
	
	<%
		list = new ArrayList<>();
		request.setAttribute("list", list);
	%>
	
	<h3>\${empty list} : ${empty list}</h3>
	<h3>\${list.isEmpty()} : ${list.isEmpty()}</h3>
	
	<%
		list.add("김판길 보고 있냐?");
	%>
	<h3>\${empty list} : ${empty list}</h3>
	<!-- 객체가 생성되어 있고 비어있지 않으면 -->
	<h3>\${!empty list} : ${!empty list}</h3>
	<h3>\${not empty list} : ${not empty list}</h3>
	<h3>\${list} : ${list}</h3>
	
</body>
</html>