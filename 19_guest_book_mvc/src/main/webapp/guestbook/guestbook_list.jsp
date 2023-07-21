<%@page import="util.PageMaker"%>
<%@page import="vo.GuestBookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>방명록 메시지 목록</title>
</head>
<style>
	
</style>
<body>
<!-- 방명록 작성 전달을 위한 form tag 완성 -->
<form action="write.gb" method="post">
	<table>
		<tr>
			<td colspan=3><h1>방명록 작성</h1></td>
		</tr>
		<tr>
			<td colspan=2></td>
			<td rowspan="4"><input type="submit" value="메시지 남기기" style="width:100%;height:100px;margin-left:20px;"/></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="guestName"  style="width:100%;"/></td>
		<tr>
			<td>암호</td>
			<td><input type="password" name="password" style="width:100%;"/></td>
		</tr>
		<tr>
			<td>메시지</td>
			<td><textarea cols="35" rows="3" name="message"></textarea></td>
		</tr>
	</table>
</form>
<hr>
<%@ page import="java.util.*, vo.GuestBookVO" %>
<!-- 방명록 리스트 정보 출력 -->
<% 
List<GuestBookVO> list = (List<GuestBookVO>)request.getAttribute("bookList"); 
if(list != null && !list.isEmpty()){
%>
	<table border="1">
		<% for(GuestBookVO vo : list){ %>
		<tr>
			<td>
				메세지 번호 <%=vo.getId()%> <br/>
				손님 이름 : <%=vo.getGuestName() %> <br/> 
				메세지 : <%=vo.getMessage() %> <br />
				<a href="confirm.gb?id=<%=vo.getId()%>">[삭제]</a>
			</td>
		</tr>
		<%}%>
	</table>
	<%
		PageMaker pm = (PageMaker)request.getAttribute("pm");
		if(pm != null){
			if(pm.isPrev()){
	%>
		<a href="list.gb?page=1">[처음]</a>
		<a href="list.gb?page=<%=pm.getStartPage()-1%>">[이전]</a>
		<% } %>
		<%
			for(int i = pm.getStartPage(); i <= pm.getEndPage(); i++){
		%>	
			<a href="list.gb?page=<%=i%>">[<%=i%>]</a>	
		<% } // end for %>
		<% if(pm.isNext()){ %>
			<a href="list.gb?page=<%=pm.getEndPage() + 1%>">[다음]</a>
			<a href="list.gb?page=<%=pm.getMaxPage() + 1%>">[마지막]</a>
		<% } // end if next %>
	<%
		} // page != null
	%>
<%}else{%>

<%}%>


<!-- 방명록 리스트 정보 출력 end -->



<!-- 방명록 정보에 따른 paging block 화면 출력 작성 -->


<!-- 방명록 정보에 따른 paging block 화면 출력 end-->

</body>
</html>