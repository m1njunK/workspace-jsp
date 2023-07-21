<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ include file="../common/header.jsp" %>
<div class="container">
	<h1>
		알수 없는 오류로 페이지를 출력할 수 없습니다.
	</h1>
	<h2>
		다시 요청해 주세요.
	</h2>
	<h3><%=exception.getMessage() %></h3>
</div>
<%@ include file="../common/footer.jsp"%>