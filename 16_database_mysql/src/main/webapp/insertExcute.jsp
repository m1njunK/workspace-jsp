<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertExcute.jsp</title>
</head>
<body>
	
	<h1>JDBC CONNECTION &amp; INSERT TEST</h1>
	<%
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		// 인증된 계정 정보로 데이터베이스에 연결된 정보를 제공하는 객체
		Connection conn = null;
		// 연결된 데이터베이스에 질의 작업을 수행하고
		// 결과를 반환하는 객체
		Statement stmt = null;
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/digital_jsp",
				"digital",
				"12345"
			);
			out.println("<h3>DB 연결 성공</h3>");
			stmt = conn.createStatement();
			// 회원 정보 등록 Query 작성
			String sql = "INSERT INTO member(name,addr) VALUES('"+name+"','"+addr+"')";
			int result = stmt.executeUpdate(sql);
			if(result > 0){
				out.println("회원정보 등록 완료");
			}else{
				out.println("회원정보 등록 실패");
			}
			out.println(" - " + result);
		}catch(Exception e){
			out.println("<h3>DB 작업 수행 실패</h3>");
			out.println("<h3>"+e.toString()+"</h3>");
		}finally{
			stmt.close();
			conn.close();
		}
	%>
<br/>
<a href="index.jsp">메인으로</a>
</body>
</html>