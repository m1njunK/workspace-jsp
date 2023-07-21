<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!-- memberDelete.jsp -->
<!-- 삭제할 회원 번호를 넘겨 받아 u_join column의 값을 N으로 수정 -->
<s:update var="rs" dataSource="java/MySqlDB">
	UPDATE digital_member SET u_join = 'N' WHERE u_num = ?
	<s:param>${param.u_num}</s:param>
</s:update>
<c:if test="${rs == 1}">
	<script>
		alert('회원 삭제 완료!');
		location.href='member.jsp';
	</script>
</c:if>











