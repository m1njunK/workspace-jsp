<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<%
		// 요청을 보낸 client의 브라우저에 저장된 Cookie 항목
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			System.out.println("cookie 존재 : " + cookies.length);
			for(Cookie c : cookies){
				// cookie 구분자 - 식별자
				System.out.println("name : " + c.getName());
				System.out.println("value : " + c.getValue());
				System.out.println("maxAge : " + c.getMaxAge());
				System.out.println("domain : " + c.getDomain());
				System.out.println("path : " + c.getPath());
				System.out.println();
			}
		}else{
			System.out.println("등록된 쿠키가 없음");	
		}
		
		// cookie 생성
		Cookie cookie = new Cookie("target","KPG");
		// cookie 유지 시간 - second 초단위
		cookie.setMaxAge(60 * 60 * 24 * 15);
		cookie.setPath("/");
		cookie.setDomain("10.100.205.175");
		response.addCookie(cookie);
		
		Cookie cookie1 = new Cookie("tt","tt");
		response.addCookie(cookie1);
		
		// cookie 삭제
		Cookie cookie2 = new Cookie("target","KPG");
		cookie2.setMaxAge(0);
		cookie2.setPath("/");
		cookie2.setDomain("10.100.205.175");
		
		response.addCookie(cookie2);
		
		response.sendRedirect("member/index.jsp");
	%>
</body>
</html>