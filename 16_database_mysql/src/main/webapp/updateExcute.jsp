<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- updateExcute.jsp -->
<!-- db 연결 정보 및 java.sql.* -->
<%@ include file="connection.jsp" %>
<%
	String mNum = request.getParameter("num");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	int num = Integer.parseInt(mNum);
			
	PreparedStatement pstmt = null;
	
	try{
		pstmt = conn.prepareStatement("UPDATE member SET name = ?, addr = ? WHERE num = ?");
		pstmt.setString(1,name);
		pstmt.setString(2,addr);
		pstmt.setInt(3,num);
		
		int result = pstmt.executeUpdate();
		out.println("<script>");
		out.println("alert('"+result+"개의 행 수정완료!');");
		out.println("location.href='memberList.jsp';");
		out.println("</script>");
		
		/* "UPDATE member SET name = '"+name+"', addr = '"+addr+"' WHERE num = '"num"';" */
	}catch(Exception e){
		out.println("<script>");
		out.println("alert('수정작업 실패');");
		out.println("history.go(-1);");
		out.println("</script>");
	}finally{
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
%>