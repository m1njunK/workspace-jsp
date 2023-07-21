<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="util.*, java.sql.*"%>
<!-- 
회원가입 요청 처리 - joinCheck.jsp
-->

<!-- request로 전달된 회원가입에 필요한 회원 정보 parameter 읽기 -->
<jsp:useBean id="joinMember" class="vo.MemberVO" scope="page"/>
<jsp:setProperty property="*" name="joinMember"/>

<%
	Connection conn = DBCPUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String msg = "";	// 처리 결과를 문자열로 저장
	String nextPage = "";	// 처리결과에 따라 이동할 페이지를 저장
	
	try{
		String sql = "SELECT id FROM test_member WHERE id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, joinMember.getId());
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			msg = "이미 사용중이다";
			nextPage = "join";
		}else{
			// 동일한 아이디가 존재하지 않음
			// 검색에 사용된 pstmt 제거
			JDBCUtil.close(pstmt);
			sql = "INSERT INTO test_member VALUES(NULL,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,joinMember.getId());
			pstmt.setString(2,joinMember.getPass());
			pstmt.setString(3,joinMember.getName());
			pstmt.setString(4,joinMember.getAddr());
			pstmt.setString(5,joinMember.getPhone());
			pstmt.setString(6,joinMember.getGender());
			pstmt.setInt(7,joinMember.getAge());
			// INSERT 작업이 수행된 행의 개수
			int result = pstmt.executeUpdate();
			if(result > 0){
				msg = "회원가입 완료";
				nextPage = "login";
			}
		}
	}catch(Exception e){
		msg = "회원가입 실패";
		nextPage = "join";
	}finally{
		DBCPUtil.close(rs,pstmt,conn);
		out.println("<script>");
		out.println("alert('"+msg+"');");
		out.println("location.href='index.jsp?page="+nextPage+"';");
		out.println("</script>");
	}
%>