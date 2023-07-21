<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- memberDelete.jsp -->
<%@ page import="java.sql.*, util.*"%>
<%
	String num = request.getParameter("num");
	Connection conn = DBCPUtil.getConnection();
	PreparedStatement pstmt = null;
	String sql = "DELETE FROM test_member WHERE num = ? ";
	
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(num));
		int result = pstmt.executeUpdate();
		if(result == 0){
			throw new NullPointerException("삭제 회원 없믐");
		}
	}catch(Exception e){
		out.println("<script>");
		out.println("alert('요청 처리 실패?????')");
		out.println("</script>");
	}finally{
		DBCPUtil.close(pstmt,conn);
		// response.sendRedirect("index.jsp?page=memberList");
		out.println("<script>");
		out.println("location.href='index.jsp?page=memberList';");
		out.println("</script>");
	}
%>
