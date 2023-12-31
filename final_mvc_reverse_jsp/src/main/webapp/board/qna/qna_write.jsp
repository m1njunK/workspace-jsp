<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- qna_writer.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<jsp:include page="../../common/header.jsp" />
<section class="wrap">
	<h1> 글 작성</h1>
	<form action="writeSubmit.qna" method="POST">
		<input type="hidden" name="qna_writer_num" value="${member.num}"/>
		<table>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="qna_name" value="${member.name}" required />
				</td>
			</tr>
			<tr>
				<td>글제목</td>
				<td>
					<input type="text" name="qna_title" required />
				</td>
			</tr>
			<tr>
				<td>
					글 내용
				</td>
				<td>
					<textarea name="qna_content" cols="50" rows="10" required></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="작성완료"/> 
					<input type="reset" value="새로작성"/>
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="../../common/footer.jsp" />









