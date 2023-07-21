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
		<c:when test="${!empty requestScope.memberList}">
			<c:forEach var="m" items="${requestScope.memberList}">
				<!-- 등록된 회원 정보가 있을 시 출력 -->
				<tr>
					<td>
						<!-- 회원번호 -->
						${m.num}
					</td>
					<td>
						<!-- 이름 -->
						${m.name}
					</td>
					<td>
						<!-- 회원등록일 -->
						${m.regdate}
					</td>
					<td>
						<!-- 기타 -->
						[<a href="updateMember.mgc">수정</a>] |
						[<a href="#">삭제</a>]
					</td>
				</tr>
			</c:forEach>
			<!-- 등록된 회원 목록정보가 존재할 시 페이징 처리 블럭 작성 -->
			<tr>
				<th colspan="4"></th>
			</tr>
			
		</c:when>
		<c:otherwise>
			<!-- 등록된 회원 정보가 없을 시 출력 -->
			<tr>
				<th>등록된 회원 정보가 없습니다.</th>
			</tr>
		</c:otherwise>
	</c:choose>
	
</table>
</section>
<jsp:include page="/common/footer.jsp" />










