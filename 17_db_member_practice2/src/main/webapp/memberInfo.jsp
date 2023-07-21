<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, util.*, vo.*"%>
<%@ include file="checkAdmin.jsp" %>
<!-- memberInfo.jsp -->
<%
	String sql = "SELECT id,name,addr FROM test_member WHERE num = ?";
	String num = request.getParameter("num");

	Connection conn = DBCPUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	MemberVO vo = null;
	
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,Integer.parseInt(num));
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			// 일치하는 회원정보 찾음
			vo = new MemberVO();
			vo.setId(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setAddr(rs.getString(3));
			vo.setNum(Integer.parseInt(num));
		}else{
			throw new NullPointerException("회원정보 없음");			
		}
	}catch(Exception e){
		out.println("<script>");
		out.println("alert('없다')");
		out.println("history.back()");
		out.println("</script>");
	}finally{
		DBCPUtil.close(rs,pstmt,conn);
	}
%>
<table>
	<tr>
		<th colspan="2">
			<%=vo.getNum()%>번 회원의 정보
		</th>
	</tr>
	<tr>
		<td>아이디</td>
		<td><%=vo.getId()%></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=vo.getName()%></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><%=vo.getAddr()%></td>
	</tr>
	<tr>
		<th colspan="2">
			<a href="javascript:memberUpdate('<%=vo.getNum()%>')">수정</a> | <a href="javascript:memberDelete();">삭제</a>
		</th>
	</tr>
</table>
<script>
	// 회원정보 수정 페이지 요청
	function memberUpdate(num){
		location.href='index.jsp?page=memberUpdateForm&num='+num;	
	}

	// 회원 삭제 요청
	function memberDelete(){
		if('<%=vo.getId()%>' == 'admin'){
			alert('장난치지마라');
			return;
		}
		
		if(confirm('<%=vo.getNum()%>'+"번 회원 정보를 정말로 삭제?")){
			location.href='memberDelete.jsp?num='+'<%=vo.getNum()%>';
		}
	}
</script>