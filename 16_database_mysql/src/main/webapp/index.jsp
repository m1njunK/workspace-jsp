<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<%@ page import="java.sql.*" %>
	<%
		// database와 연결 하기 위한 필수 정보
		// 현재 프로젝트 또는 서버에 jdbc library 가 정상적으로 등록되어 있는지 확인 하기 위한 정보
		String driver = "com.mysql.cj.jdbc.Driver";
		// db server와 연결 하기 위한 위치 정보
		String url = "jdbc:mysql://localhost:3306/digital_jsp";
		// 권한을 가진 사용자 계정 정보
		String username = "digital";
		String password = "12345";
		
		Connection conn = null;
		
		try{
			Class.forName(driver);
			out.println("Driver Class가 존재합니다.");
			out.println("<br/>");
			conn = DriverManager.getConnection(url,username,password);
			out.println("DB 연결 완료");
			out.println("<br/>");
			out.println(conn);
			out.println("<br/>");
		}catch(ClassNotFoundException e){
			out.println("Driver Class를 찾을 수 없습니다.");
			out.println("<br/>");
		}catch(SQLException e){
			out.println("연결 요청 정보 오류 : " + e.getMessage());
			out.println("<br/>");
		}finally{
			if(conn != null){
				conn.close();
			}
		}
	%>
	<br/>
	<hr/>
	<a href="insertForm.jsp">회원정보 입력</a>
	<a href="memberList.jsp">회원 목록</a>
</body>
</html>