<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp"%>
<main>
	<article>
		<h1><%=s%> MAIN 본문 내용 입니다.</h1>
	</article>
	<%! String result = "본문에서 작성된 내용"; %>
	<h2>
		<%=result %>
	</h2>
</main>
<%@ include file="common/footer.jsp"%>