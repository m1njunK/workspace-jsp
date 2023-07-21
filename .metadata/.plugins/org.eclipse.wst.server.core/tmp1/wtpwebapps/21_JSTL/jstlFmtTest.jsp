<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlFmtTest.jsp</title>
</head>
<body>
	<%-- <%
		request.setCharacterEncoding("UTF-8");
	%> --%>
	<f:requestEncoding value="UTF-8"/>
	<c:out value="${param.addr}"/> <br/>
	<c:out value="${param.encode}"/> <br/>
	<c:out value="${param.selectDate}"/> <br/>
	
	<h3>다국어 처리 지원 - bundle</h3>
	<!-- basename == 접두어 -->
	<f:bundle basename="bundle">
		<f:message key="name"/>
		<f:message key="name_en"/>
	</f:bundle>
	
	<c:if test="${!empty param.encode}">
		<c:set var="encode" value="${param.encode}"/>
	</c:if>
	<br />
	<%= response.getLocale() %>
	<br />
	<f:setLocale value="${encode}"/>
	현재 Locale : <%= response.getLocale() %>
	<br />
	<f:bundle basename="prop/bundle">
		<f:message var="name" key="name" scope="session"/>
		<c:choose>
			<c:when test="${!empty param.addr}">
				<f:message var="addr" key="addr">
					<f:param value="${param.addr}"/>
					<f:param value="70"/>					
				</f:message>
			</c:when>
			<c:otherwise>
				<f:message var="addr" key="addr_default"/>
			</c:otherwise>
		</c:choose>
		<f:message var="phone" key="phone"/>
		<!-- 변수를 지정하지 않으면 현재 자리에 출력 -->
		<hr /> 
		<f:message key="phone"/> 
		<br />
	</f:bundle>
	이름 : ${name} - ${sessionScope.name} <br/>
	주소 : ${addr} <br />
	전번 : ${phone} <br />
	<hr />
	
	<h2>날짜 형식 지정</h2>
	<jsp:useBean id="now" class="java.util.Date"/>
	java.util.Date : <c:out value="${now}"/>
	<br />
	<!-- 
		f:formatDate
		type(default : date)
		date(날짜) / time(시간) / both(둘다)
		
		style
		full / long / medium(default) / short
	 -->
	 <f:formatDate value="${now}" type="date" dateStyle="full"/> <br />
	 <f:formatDate value="${now}" type="time" timeStyle="full"/> <br />
	 <f:formatDate value="${now}" type="both" dateStyle="short" timeStyle="long"/> <br />
	 <h3>pattern</h3>
	 <f:formatDate value="${now}" pattern="yyyy-MM-dd E HH:mm:ss"/>
	 
	 <h3>parseDate : ${param.selectDate}</h3>
	 <f:parseDate var="n" value="${param.selectDate}" pattern="yyyy-MM-dd" scope="page"/>
	 변경된 date : <c:out value="${n}"/> <br />
	 formatDate : <f:formatDate value="${n}" pattern="yyyy년MM월dd일"/>
	 <br/>
	 
	 <h3>Number Formatter</h3>
     <c:set var="price" value="10000000"/>
     <!-- type : number(숫자),currency(통화) -->
     <f:formatNumber var="numberType" type="number" value="${price}"/>	 
     numberType = ${numberType} <br />
     <!-- 통화 형식 -->
     통화형식 : <f:formatNumber type="currency" value="${price}"/> <br />
     <f:setLocale value="ko_KR"/>
     원화 : <f:formatNumber type="currency" value="${price}"/> <br />
     <f:setLocale value="en_US"/>
     달러 : <f:formatNumber type="currency" value="${price}"/> <br />
     <h3>pattern</h3>
     <f:formatNumber value="${price}" pattern="￦0,000.00"/>
</body>
</html>