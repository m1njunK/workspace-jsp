<%@page import="java.util.Base64"%>
<%@page import="java.sql.*"%>
<%@page import="util.DBCPUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session"/>
<jsp:setProperty property="id" name="loginMember"/>
<jsp:setProperty property="pass" name="loginMember"/>

<%
	Connection conn = DBCPUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String msg = "";
	String nextPage = "";
	
	String sql = "SELECT * FROM test_member WHERE id = ? AND pass = ?;";
	
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, loginMember.getId());
		pstmt.setString(2, loginMember.getPass());
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){	// 아이디와 패스워드가 일치하는 사용자 정보 존재
		// num(int) / name / addr / phone / gender / age(int)
			loginMember.setNum(rs.getInt(1));
			loginMember.setName(rs.getString(4));
			loginMember.setAddr(rs.getString(5));
			loginMember.setPhone(rs.getString(6));
			loginMember.setGender(rs.getString(7));
			loginMember.setAge(rs.getInt(8));
			
			msg = "로그인 성공";
			nextPage = "default";
			
			// 자동로그인 체크 - 로그인 상태 유지 요청 처리
			String login = request.getParameter("login");
			if(login != null){
				String id = loginMember.getId();
				byte[] bytes = id.getBytes();
				byte[] encodedID = Base64.getEncoder().encode(bytes);
				String encodeID = new String(encodedID);
				System.out.println("encodedID : " + encodeID);
				System.out.println("id : " + id);
				Cookie cookie = new Cookie("rememberMe",encodeID);
				cookie.setMaxAge(3600*24);
				response.addCookie(cookie);
			}
			
		}else{
			msg = "틀렸다";
			nextPage = "login";
			session.removeAttribute("loginMember");
		}
	}catch(Exception e){
		msg = "틀렸다";
		nextPage = "login";
		session.removeAttribute("loginMember");
	}finally{
		DBCPUtil.close(rs,pstmt,conn);
		out.println("<script>");
		out.println("alert('"+msg+"');");
		out.println("location.href='index.jsp?page="+nextPage+"';");
		out.println("</script>");
	}
	
%>