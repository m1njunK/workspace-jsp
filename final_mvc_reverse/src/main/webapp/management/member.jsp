<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<jsp:include page="/common/header.jsp"/>
<section class="wrap">
<table border=1>
	<tr>
		<th colspan="4">회원정보</th>
	</tr>
	<tr>
		<th>회원번호</th>
		<th>이름</th>
		<th>회원등록일</th>
		<th>기타</th>
	</tr>
	<c:choose>
	<c:when test="${!empty memberList}">
		<jsp:useBean id="now" class="java.util.Date" />
		<f:formatDate var="date" pattern="yyyy-MM-dd" value="${now}"/>
		<c:forEach var="m" items="${memberList}">
			<tr>
				<td>${m.num}</td>
				<td>${m.name}</td>
				<f:formatDate var="reg" pattern="yyyy-MM-dd" value="${m.regdate}"/>
				<td>
					<c:choose>
						<c:when test="${date eq reg}">
							<f:formatDate value="${m.regdate}"  pattern="HH:mm:ss"/>
						</c:when>
						<c:otherwise>
							${reg}
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<a href="javascript:updateForm.id.value='${m.id}';updateForm.submit();">수정</a> |
					<a href="<c:url value='/managementPage.mgc'/>?num=${m.num}">삭제</a>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4">
				<c:if test="${pm.prev}">
					<a href="<c:url value='/managementPage.mgc'/>?page=${pm.startPage-1}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
					<a href="<c:url value='/managementPage.mgc'/>?page=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${pm.next}">
					<a href="<c:url value='/managementPage.mgc'/>?page=${pm.endPage + 1}">[다음]</a>
				</c:if>
			</td>
		</tr>
	</c:when>
	<c:otherwise>
			<!-- 등록된 회원 정보가 없을 시 출력 -->
		<tr>
			<td colspan="4">등록된 회원정보가 없습니다.</td>
		</tr>
	</c:otherwise>
</c:choose>
</table>
<form name="updateForm" action="managementUpdateForm.mgc" method="POST">
	<input type="hidden" name="id" />
</form>
</section>
<jsp:include page="/common/footer.jsp" />










