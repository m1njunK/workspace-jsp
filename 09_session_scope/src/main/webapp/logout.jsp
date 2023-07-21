<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setMaxInactiveInterval(3600);
	// interval second - 초단위
	int max = session.getMaxInactiveInterval();
	System.out.println("max interval : " + max);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	
	// session 생성 시간
	long create = session.getCreationTime();
	String time = sdf.format(create);
	System.out.println(time);
	
	// session 마지막 요청 시간
	long last = session.getLastAccessedTime();
	time = sdf.format(last);
	System.out.println(time);
	
	// 파라미터로 전달된 속성만 삭제
	session.removeAttribute("loginMember");
	// session 객체 새로 생성 - 모든 속성 삭제
	// session.invalidate();
	response.sendRedirect(request.getContextPath());
	
%>