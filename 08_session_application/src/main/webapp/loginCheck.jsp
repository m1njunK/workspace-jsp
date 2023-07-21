<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	String registId = (String) application.getAttribute("id");
	String registPw = (String) application.getAttribute("pw");
	
	if(id.equals(registId) && pw.equals(registPw)){
		String appName = (String) application.getAttribute("name");
		session.setAttribute("userName", appName);
		response.sendRedirect(request.getContextPath());
	} else {
		String message = "로그인 정보가 일치하지 않습니다.";
		request.setAttribute("message", message);
		request.getRequestDispatcher("login.jsp").forward(request,response);
	}
%>