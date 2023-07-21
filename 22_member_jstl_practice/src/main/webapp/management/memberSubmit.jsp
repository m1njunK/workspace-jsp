<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!-- memberSubmit.jsp -->
<!-- 관리자 회원 정보 수정 완료 -->
<s:update var="rs" dataSource="java/MySqlDB">
	UPDATE digital_member SET u_id = ?, u_pass = ?, u_age = ?, u_gender = ? WHERE u_num = ?;
	<s:param>${param.u_id}</s:param>
	<s:param>${param.u_pass}</s:param>
	<s:param>${param.u_age}</s:param>
	<s:param>${param.u_gender}</s:param>
	<s:param>${param.u_num}</s:param>
</s:update>
<c:if test="${rs > 0}">
	<script>
		alert('회원정보 수정 완료!');
		location.href = "member.jsp"
	</script>
</c:if>









