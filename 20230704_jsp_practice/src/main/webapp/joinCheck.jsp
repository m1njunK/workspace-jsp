<%@page import="org.apache.jasper.runtime.JspApplicationContextImpl"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- joinCheck.jsp -->
<%
	request.setCharacterEncoding("utf-8");
	
	List<MemberVO> memberList = (List<MemberVO>) application.getAttribute("memberList");
	if(memberList == null){
		memberList = new ArrayList<>();
		application.setAttribute("memberList",memberList);
	}
	
	String id = request.getParameter("id");
	
	MemberVO member = new MemberVO(id);
	
	if(!memberList.isEmpty() && memberList.contains(member)){
		// memberList에 memberVO 정보가 존재하고 id가 일치하는 MemberVO가 존재
		out.println("<script>");
		out.println("alert('이미 사용중인 아이디입니다.');");
		out.println("history.go(-1)");
		out.println("</script>");
		return;
	}
	
	// 회원 정보 등록
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");
	String strAge = request.getParameter("age");
	int age = Integer.parseInt(strAge);
	
	member.setPass(pass);
	member.setAddr(addr);
	member.setName(name);
	member.setPhone(phone);
	member.setGender(gender);
	member.setAge(age);
	
	memberList.add(member);

	System.out.println("====================================");
	System.out.println(application.getAttribute("memberList"));
	System.out.println("====================================");
%>

<script>
	alert('회원가입 성공');
	location.href="login.jsp";
</script>






