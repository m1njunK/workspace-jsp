<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!-- withdraw.jsp -->
<!-- 회원 탈퇴 처리 - 회원 정보를 삭제하지 않고 u_join column의 값을 N으로 수정 -->
<s:update var="rs" dataSource="java/MySqlDB">
	UPDATE digital_member SET u_join = 'N' WHERE u_id = ?
	<s:param>${param.u_id}</s:param>
</s:update>

<c:if test="${rs == 1}">
	<c:remove var="member"/>
	<%
		Cookie c = new Cookie("remember",request.getParameter("u_id"));
		c.setMaxAge(0);
		c.setPath(request.getContextPath());
		response.addCookie(c);
	%>
	<script>
		alert('회원탈퇴 완료');
		location.href="../index.jsp";
	</script>
</c:if>








