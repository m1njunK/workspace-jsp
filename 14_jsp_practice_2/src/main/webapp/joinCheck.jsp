<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- joinCheck.jsp -->
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="joinMember" class="vo.MemberVO"/>
<jsp:setProperty property="*" name="joinMember"/>
<jsp:useBean id="memberList" type="java.util.List<vo.MemberVO>" class="java.util.ArrayList" scope="application"/>
<%
	if(memberList.contains(joinMember)){
		out.print("<script>");
		out.print("alert('이미 사용중인 아이디 입니다.');");
		out.print("history.back();");
		out.print("</script>");
	}else{
		memberList.add(joinMember);
		out.print("<script>");
		out.print("alert('회원가입 완료!');");
		out.print("location.href='index.jsp?page=login'");
		out.print("</script>");
	}
%>






