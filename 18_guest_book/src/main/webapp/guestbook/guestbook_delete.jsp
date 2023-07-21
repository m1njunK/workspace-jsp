<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.DBCPUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>방명록 메시지 삭제함</title>
</head>
<body>
<br/>

<!-- 삭제 확인 처리  알림 code 작성-->
<%
	String num = request.getParameter("num");
	String pass = request.getParameter("pass");
	
	System.out.println("전달받은 값 : " + num);
	System.out.println("전달받은 값 : " + pass);
	
	String sql = "DELETE FROM test_guestbook WHERE id = ? AND password = ?;";

	Connection conn = DBCPUtil.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, num);
	pstmt.setString(2, pass);
	int result = pstmt.executeUpdate();
	
	if(result > 0){
%>		
<h1>방명록 삭제 성공!!</h1>	
<%}else{ %>
<h1>방명록 삭제 실패!!</h1>	
<%}DBCPUtil.close(pstmt,conn);%>
<a href="guestbook_list.jsp">[목록 보기]</a>
</body>
</html>