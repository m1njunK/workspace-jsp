<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlCore.jsp</title>
</head>
<body>
	<h3>JSP STANDARD TAG LIBRARY</h3>
	<!-- 특정 영역 객체에 속성 값을 추가 -->
	<c:set var="varPage" value="page 영역" scope="page"/>
	<c:set var="numPage" value="10" scope="page"/>
	<% String id = "id001"; %>
	EL : ${varPage} <br/>
	<!-- 연산을 처리하기 위해서 영역객체에 저장된 data를 숫자 타입으로 변경 -->
	EL : ${numPage + 11} <br/>
	EL : ${id} <br/>
	
	<c:set var="request1" value="request 영역" scope="request" />
	<c:set var="session1" value="session 영역" scope="session" />
	<c:set var="application1" value="application 영역" scope="application" />
	
	request1 : ${request1} <br/>
	<c:remove var="request1" scope="request" />
	request1 : ${request1} <br/>
	<hr/>
	<c:set var="test1" value="<script>alert('경고!! 메롱메롱!');</script>"/>
	<%-- ${test1} <br/> --%>
	<!-- escapeXml="true" default = true -->
	<c:out value="${test1}" escapeXml="true"/> <br/>
	<c:out value="${test2}" default="test2의 값이 존재하지 않습니다."/> <br/>
	<c:out value="${test2}" escapeXml="false">
		<h3>test2는 존재하지않습니다.</h3>
	</c:out>
	
	<jsp:useBean id="member" class="test.MemberVO" scope="page"/>
	${member} <br/>
	<c:set target="${member}" property="num" value="1" />
	<c:set target="${member}" property="id" value="id001" />
	<c:set target="${member}" property="pass" value="pw001" />
	${member} <br/>
	<hr/>
	
	<a href="/index.jsp">index.jsp</a>
	<c:url var="pageLink" value="/index.jsp"/>
	pageLink : ${pageLink} : <a href="${pageLink}">index url</a><br/>
	<hr/>
	<a href="<c:url value='/index.jsp'/>">url index</a>
	<hr/>
	
	<!-- response.sendRedirect("jstlCore2.jsp"); -->
	<c:redirect url="jstlCore2.jsp"/>
	
	
	<div>
		<textarea>
			<c:import url="index.jsp" />
		</textarea>
	</div>
	<hr/>
	<br/>
	<%-- <%@ include file="https://www.nate.com" %> --%>
	<div>
		<textarea cols="200" rows="10">
			<c:import url="https://www.nate.com"/>
		</textarea>
	</div>
	
	
	
</body>
</html>













