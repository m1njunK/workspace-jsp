<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sqlUpdateSubmit.jsp</title>
</head>
<body>
	<c:catch var="e">
		<s:update var="result" dataSource="java/MySqlDB">
			UPDATE test_member SET pass = ? WHERE num = ? AND pass = ?;
			<s:param>${param.rePass}</s:param>
			<s:param>${param.num}</s:param>
			<s:param>${param.pass}</s:param>
		</s:update>
		
		<c:choose>
			<c:when test="${result == 1}">
				<c:redirect url="sqlMember.jsp?num=${param.num}"/>
			</c:when>	
			<c:otherwise>
				<script>
					alert('잘못된 정보입니다. 확인 후 요청해 주세요..'); 
					location.href='sqlQuery.jsp';
				</script>		
			</c:otherwise>	
		</c:choose>
		
	</c:catch>
	<c:if test="${!empty e}">
		<script>
			alert('회원정보 수정 실패!'); 
			history.go(-1);
		</script>
	</c:if>
</body>
</html>