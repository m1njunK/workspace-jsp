<%@page import="java.util.Base64"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- loginCheck.jsp -->
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="dto" class="dto.LoginDTO" />
<jsp:setProperty name="dto" property="*"/>
<jsp:useBean id="memberList" 
type="java.util.List<vo.MemberVO>" 
class="java.util.ArrayList" 
scope="application" />

<%
	for(MemberVO m : memberList){
		if(m.getId().equals(dto.getId()) && m.getPass().equals(dto.getPass())){
			session.setAttribute("loginMember", m);
			
			if(dto.isRememberMe()){
				
				// BASE64 바이너리 데이터를 문자코드에 영향을 받지 않는 
				// 공통 ASCII 문자로 표현하기 위해 만들어진 인코딩 
				byte[] encodedID = Base64.getEncoder().encode(m.getId().getBytes());
				
				String id = new String(encodedID);
				
				Cookie cookie = new Cookie("rememberMe",id);
				cookie.setMaxAge(60*60*24*10);
				response.addCookie(cookie);
			}
			
			out.print("<script>");
			out.print("alert('로그인 성공');");
			out.print("location.href='index.jsp';");
			out.print("</script>");
			return;
		}
	}
%>
<script>
	alert('로그인 실패');
	history.back();
</script>




















