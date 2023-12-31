<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!-- loginCheck.jsp -->
<!--
	 로그인 요청 처리 
	 로그인 성공한 회원의 정보를 member 를 키값으로 저장
-->
<s:query var="rs" dataSource="java/MySqlDB">
	SELECT * FROM digital_member WHERE u_id = ? AND u_pass = ?;
	<s:param>${param.u_id}</s:param>
	<s:param>${param.u_pass}</s:param>
</s:query>
<c:choose>
	<c:when test="${rs.rowCount > 0 && rs.rows[0].u_join == 'Y'}">
			<c:set var="member" value="${rs.rows[0]}" scope="session"/>
			<c:if test="${param.login != null}">
				<%
					Cookie c = new Cookie("remember",request.getParameter("u_id"));
					c.setMaxAge(3600);
					c.setPath(request.getContextPath());
					response.addCookie(c);
				%>
			</c:if>
	 		<script>
				alert('로그인 성공!');
				location.href="../index.jsp";
			</script>
	</c:when>
	<c:otherwise>
		<script>
			alert('로그인 실패');
			history.back();
		</script>
	</c:otherwise>
</c:choose>