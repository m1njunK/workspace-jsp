<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// request로 전달된 data를 처리할 언어 셋
	String encoding = request.getCharacterEncoding();
	out.println("encoding : " + encoding+"<br/>");
	
	// 요청이 전달된 client의 원격지 아이피 주소
	String ip = request.getRemoteAddr();
	out.println("ip : " + ip + "<br/>");
	
	// 요청이 전달된 사용자의 요청 전송 방식
	String method = request.getMethod();
	out.println("method : " + method + "<br/>");
	
	// 요청 경로 - 전체
	String requestURI = request.getRequestURI();
	out.println("requestURI : " + requestURI + "<br/>");
	
	// 주소줄의 URL 정보
	StringBuffer requestURL = request.getRequestURL();
	out.println("requestURL : " + requestURL.toString() + "<br/>");
	
	// contextPath
	// WAS(Web Application Server) 에서
	// 웹 애플리케이션(프로젝트)를 구현하기 위한 path
	String contextPath = request.getContextPath();
	out.println("contextPath : " + contextPath + "<br/>");
	
	// queryString - GET 방식으로 전달된 parameters
	String queryString = request.getQueryString();
	out.println("query String : " + queryString + "<br/>");

	// 요청 content type
	String contentType = request.getContentType();
	out.println("content type : " + contentType + "<br/>");
	
	// 요청 파라미터 값 확인
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String[] hobbys = request.getParameterValues("hobby");
	out.println("name : " + name + "<br/>");
	out.println("gender : " + gender + "<br/>");
	out.println("hobbys : " + Arrays.toString(hobbys) + "<br/>");	
	
	// 열거형
	// 동일한 데이터 타입을 나열하여 저장하는 class
	// 저장된 각 데이터를 element - 요소 라고 한다.
	out.println("<h1>PARAMETER NAMES</h1>");
	Enumeration<String> names = request.getParameterNames();
	// 읽을 요소가 존재하면 true, 존재하지 않으면 false
	while(names.hasMoreElements()){
		// names 열거형에 저장된 요소를 읽고 다음으로 이동한다.
		String keyName = names.nextElement(); 
	
		if(keyName.equals("hobby")){
			String[] nameValue = request.getParameterValues(keyName);
			out.println(keyName + " : " + Arrays.toString(nameValue) + "<br/>");
		}else{
			String nameValue = request.getParameter(keyName);
			out.println(keyName + " : " + nameValue + "<br/>");	
		}
	}
	
	out.println("<h1>모든 파라미터 묶음</h1>");
	Map<String,String[]> map = request.getParameterMap();
	for(String key : map.keySet()){
		out.println(key + " : " + Arrays.toString(map.get(key)) + "<br/>");
	}
	
	out.println("<h1>REQUEST Header names OR value<h1>");
	Enumeration<String> headerNames = request.getHeaderNames();
	while(headerNames.hasMoreElements()){
		String nameHeader = headerNames.nextElement();
		// request로 전잘된 헤더 정보들 중에 name이 nameHeader인 정보
		String value = request.getHeader(nameHeader);
		out.println(nameHeader + " : " + value + "<br/>");
	}
%>
</body>
</html>