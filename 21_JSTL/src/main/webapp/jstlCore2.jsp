<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlCore2.jsp</title>
</head>
<body>
	<h3>CORE TAG CONTROL CONDITION</h3>
	<core:set var="myCar" value="SANTAFE"/>
	
	<core:if test="${myCar eq 'GV80'}">
		내차는 GV80 <br/>
	</core:if>
	${myCar} <br/>
	
	<core:set var="myName" value="김혜정"/>
	<core:if test="${myName eq '김혜정'}">
		내이름은 김혜정 <br/>
	</core:if>
	
	<core:set var="grade" value="95"/>
	<core:choose>
		<core:when test="${grade >= 90}">
			A 학점
		</core:when>
		<core:when test="${grade >= 80}">
			B학점
		</core:when>
		<core:otherwise>
			F학점
		</core:otherwise>
	</core:choose>
	<hr/>
	<br/>
	<core:forEach var="i" begin="1" end="100" step="3">
		${i} &nbsp;&nbsp;
	</core:forEach>
	
	<%
		int[] nums = {10,9,8,7,6,5,4,3,2,1};
		request.setAttribute("nums",nums);
	%>
	<br/>
	<core:forEach var="n" items="${nums}">
		${n} &nbsp;&nbsp;&nbsp; 
	</core:forEach>
	<br/>
	<core:set var="datas" value="김민준,김서영,김진우,김판길,박준우,이인,이진형,이봉수,김선국,이수석,김혜정,이윤서"/>
	
	<core:forTokens var="name" items="${datas}" delims=",">
		${name} &nbsp;
	</core:forTokens>
	
	<jsp:useBean id="dogList" type="java.util.List<String>"  
	class="java.util.ArrayList" scope="request"/>
	<core:set var="a" value="${dogList.add('리트리버')}"/>
	<core:set var="a" value="${dogList.add('시베리안 허스키')}"/>
	<core:set var="a" value="${dogList.add('치와와')}"/>
	<core:set var="a" value="${dogList.add('푸들')}"/>
	<core:set var="a" value="${dogList.add('시고르자브르종')}"/>
	<core:set var="a" value="${dogList.add('샤모에드')}"/>
	<br/>
	
	<core:choose>
		<%-- 
			<core:if test="${empty dogList}">
				도그 목록이 없습니다.
			</core:if>
		 --%>
		<core:when test="${!empty dogList}">
			<core:forEach var="dog" items="${dogList}">
				${dog} &nbsp;
				<core:if test="${dog eq '시고르자브르종'}">
					우리집 강아지 &nbsp;
				</core:if>
			</core:forEach>
		</core:when>
		<core:otherwise>
			목록이 존재하지 않습니다.
		</core:otherwise>
	</core:choose>
	
</body>
</html>











