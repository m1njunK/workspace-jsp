 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="util.*, java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>방명록 메시지 작성 확인</title>
</head>
<body>

<!-- 방명록 작성 후 처리 결과 출력 code 작성 -->
<%
	boolean check = true;

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String message = request.getParameter("message");
	
	if(id.equals("") || pass.equals("")){
		check = false;
	}else{
		String sql = "INSERT INTO test_guestbook VALUES (NULL, ?, ?, ?)";
		
		Connection conn = DBCPUtil.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setString(3, message);
		
		pstmt.executeUpdate();
		check = true;
		DBCPUtil.close(pstmt,conn);
	}
%>
		
<h1><%=check ? "방명록 등록 성공" : "방명록 등록 실패" %></h1><br/>
<p>방명록에 메시지를 남겼습니다.</p>
<!-- 방명록 작성 후 처리 결과 출력 code 작성 end-->
<a href="guestbook_list.jsp">[목록 보기]</a>
</body>
</html>