<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="util.*, java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>방명록 메시지 목록</title>
</head>
<style>
	
</style>
<body>
<!-- 방명록 작성 전달을 위한 form tag 완성 -->
<form action="guestbook_write.jsp" method="post">
	<table>
		<tr>
			<td colspan=3><h1>방명록 작성</h1></td>
		</tr>
		<tr>
			<td colspan=2></td>
			<td rowspan="4"><input type="submit" value="메시지 남기기" style="width:100%;height:100px;margin-left:20px;"/></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="id" style="width:100%;"/></td>
		<tr>
			<td>암호</td>
			<td><input type="password" name="pass" style="width:100%;"/></td>
		</tr>
		<tr>
			<td>메시지</td>
			<td><textarea cols="35" rows="3" name="message"></textarea></td>
		</tr>
	</table>
</form>
<hr>

<!-- 방명록 리스트 정보 출력 -->
<%
	Connection conn = DBCPUtil.getConnection();
	Statement stmt = conn.createStatement();
	String sql = "SELECT * FROM test_guestbook ORDER BY id DESC;";
	ResultSet rs = stmt.executeQuery(sql);
	
	if(rs.next()){
		do{int num = rs.getInt(1); 
%>	
	<div style="border: black solid 1px">
		<p>메시지 번호 : <%=rs.getInt(1) %></p>
		<p>손님 이름 : <%=rs.getString(2) %></p>
		<p>메시지 : <%=rs.getString(4) %></p>
		<p>[<a href="guestbook_confirm.jsp?num=<%=num%>">삭제하기</a>]</p>
	</div>
<%
		}while(rs.next());%>		
<%}else{%>
<p>등록된 메시지가 없습니다.</p>
<% }DBCPUtil.close(conn,stmt,rs);%>
<!-- 방명록 리스트 정보 출력 end -->



<!-- 방명록 정보에 따른 paging block 화면 출력 작성 -->


<!-- 방명록 정보에 따른 paging block 화면 출력 end-->
</body>
</html>