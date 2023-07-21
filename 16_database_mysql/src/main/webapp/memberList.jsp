<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList.jsp</title>
</head>
<body>
	<%
		Statement stmt = conn.createStatement();
		String sql = "SELECT * FROM member ORDER BY num DESC";
		ResultSet rs =  stmt.executeQuery(sql);
	%>
	<h1>등록된 회원 목록</h1>
	<table border="1">
		<tr>
			<th colspan="3">회원정보</th>
		</tr>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>주소</th>
		</tr>
		<%
			while(rs.next()){
				int num = rs.getInt("num");				// 1
				String name = rs.getString("name");		// 2
				String addr = rs.getString("addr");		// 3
		%>
		<tr onclick="location.href='updateForm.jsp?num=<%=num%>'">
			<td><%=num%></td>
			<td><%=name%></td>
			<td><%=addr%></td>
		</tr>		
		<%
			}
		
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		%>
		
	</table>
	
	<a href="index.jsp">메인으로</a>
</body>
</html>