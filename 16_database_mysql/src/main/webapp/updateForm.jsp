<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="connection.jsp" %>
<%
	String mNum = request.getParameter("num");
	if(mNum == null){
		out.println("<script>alert('안됨');history.back();</script>");
		return;
	}
	
	int num = 0;
	try{
		num = Integer.parseInt(mNum);
	}catch(Exception e){
		out.println("<script>alert('잘못된 값이 전달되었습니다.');history.back();</script>");
		return;
	}
	String sql = "SELECT * FROM member WHERE num = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,num);
	
	ResultSet rs = pstmt.executeQuery();
	
	String name = "";
	String addr = "";
	if(rs.next()){
		name = rs.getString("name");
		addr = rs.getString("addr");
	}
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateForm.jsp</title>
</head>
<body>
	<h1>회원정보 수정</h1>

	<form action="updateExcute.jsp" method="POST">
		<input type="hidden" name="num" value="<%=num%>"/>
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=name%>" required/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="<%=addr%>" required/></td>
			</tr>
			<tr>
				<th colspan="2"><button>등록</button></th>
			</tr>
		</table>
	</form>
</body>
</html>