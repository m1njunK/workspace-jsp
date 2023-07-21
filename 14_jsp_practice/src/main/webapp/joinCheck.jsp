<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:useBean id="joinMember" class="vo.MemberVO" scope="request"/>
<jsp:setProperty property="*" name="joinMember"/>
<!-- joinCheck.jsp -->
<%request.setCharacterEncoding("utf-8");%>
<%
	List<MemberVO> memberList = (List<MemberVO>) application.getAttribute("memberList");
	String message = "";	
	String path = "";
	
	if(memberList == null){
		memberList = new ArrayList<>();
		application.setAttribute("memberList", memberList);
	}
	
	boolean isCheck = false;
	
	for(MemberVO m : memberList){
		if(m.equals(joinMember)){
			isCheck = true;
			break;
		}
	}
	
	if(isCheck){
		message = "이미 사용중인 아이디 입니다.";
		path = "join.jsp";
	}else{
		memberList.add(joinMember);
		message = "회원가입 완료!";
		path = "login.jsp";
	}
	
	request.setAttribute("message", message);
	
	RequestDispatcher rd = request.getRequestDispatcher(path);
	rd.forward(request,response);
	
%>







