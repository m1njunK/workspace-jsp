<%@page import="java.sql.*"%>
<%@page import="util.DBCPUtil"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session" />
<!-- header.jsp -->
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie c : cookies){
			if(c.getName().equals("rememberMe")){
				// 자동 로그인 용으로 등록한 cookie가 존재
				String value = c.getValue();
				
				byte[] bytes = Base64.getDecoder().decode(value.getBytes());
				String id = new String(bytes);
				// cookie로 등록된 사용자 정보 확인 - id가 일치하는 사용자
				String sql = "SELECT * FROM test_member WHERE id = ?";
				Connection conn = DBCPUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()){
					loginMember.setNum(rs.getInt(1));
					loginMember.setId(rs.getString(2));
					loginMember.setPass(rs.getString(3));
					loginMember.setName(rs.getString(4));
					loginMember.setAddr(rs.getString(5));
					loginMember.setPhone(rs.getString(6));
					loginMember.setGender(rs.getString(7));
					loginMember.setAge(rs.getInt(8));
				}
				DBCPUtil.close(pstmt,rs,conn);
			}
		}
	}
%>
<ul>
    <li><a href="index.jsp">home</a></li>
    <% if(loginMember.getName() == null){ %>
    
      <li><a href="index.jsp?page=login">로그인</a></li>
      <li><a href="index.jsp?page=join">회원가입</a></li>
      
    <%  session.removeAttribute("loginMember");
       } else { %>
             
       <li>
          <a href="index.jsp?page=info"><jsp:getProperty name="loginMember" property="name"/>
          </a>님 방가방가
       </li>
       		
       <% if(loginMember.getId().equals("admin")){ %>
          <li><a href="index.jsp?page=memberList">회원관리</a></li>
       <% } %>
       
       <li><a href="logOut.jsp">로그아웃</a></li>
       
    <% } %>
</ul>
 