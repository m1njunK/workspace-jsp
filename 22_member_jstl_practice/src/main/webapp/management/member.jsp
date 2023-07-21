<%@page import="util.Criteria"%>
<%@page import="util.PageMaker"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<s:query var="rs" dataSource="java/MySqlDB">
	SELECT count(*) AS count FROM digital_member WHERE u_join = 'Y'
</s:query>
<c:set var="total" value="${rs.rows[0].count}" scope="session"/>
<%
	String pagee = request.getParameter("selectPage");

	long total = (long) session.getAttribute("total");

	int pageNum = 1;
	
	if(pagee != null) {
		pageNum = Integer.parseInt(pagee);
	}
	
	Criteria cri = new Criteria();
	cri.setPage(pageNum);
	
	// page block 정보 - criteria , totalCount, displayPageNum
	// 전체 게시물 개수
	
	
	PageMaker pm = new PageMaker();
	pm.setCri(cri);
	
	pm.setTotalCount((int) total);
	
	request.setAttribute("pm", pm);
%>
<jsp:include page="/common/header.jsp" />
<section class="wrap">
<table border=1>
	<tr>
		<th colspan="4">회원정보</th>
	</tr>
	<tr>
		<th>회원번호</th>
		<th>아이디</th>
		<th>회원등록일</th>
		<th>기타</th>
	</tr>
	<s:query var="rs" dataSource="java/MySqlDB">
		SELECT * FROM digital_member WHERE u_join = 'Y' ORDER BY u_num DESC limit <%=cri.getStartRow() %>  ,<%=cri.getPerPageNum() %>;
	</s:query>
	<c:choose>
		<c:when test="${rs.rowCount > 0}">
			<c:forEach var="m" items="${rs.rows}">
				<c:if test="${m.u_join == 'Y'}">
				<!-- 등록된 회원 정보가 있을 시 출력 -->
					<tr>
						<td>${m.u_num}</td>
						<td>${m.u_id}</td>
						<td>${m.u_regDate}</td>
						<td>
							<a href="<c:url value='/management/memberUpdate.jsp'/>?u_num=${m.u_num}">수정</a> |
							<a href="<c:url value='/management/memberDelete.jsp'/>?u_num=${m.u_num}">삭제</a>
						</td>
					</tr>
				</c:if>
			</c:forEach>
			<tr>
				<td colspan="4">
					<c:if test="${pm.prev}">
						<a href="<c:url value='/management/member.jsp'/>?selectPage=${pm.startPage-1}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
						<a href="<c:url value='/management/member.jsp'/>?selectPage=${i}">[${i}]</a>
					</c:forEach>
					<c:if test="${pm.next}">
						<a href="<c:url value='/management/member.jsp'/>?selectPage=${pm.endPage + 1}">[다음]</a>
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
</section>
<jsp:include page="/common/footer.jsp" />











