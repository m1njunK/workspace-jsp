<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="common/header.jsp" />    
<!-- info.jsp -->
<%
	MemberVO m = (MemberVO)session.getAttribute("loginMember");
	if(m == null){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.');");
		out.println("location.href = 'https://www.naver.com';");
		out.println("</script>");
		return;
	}
%>
<section>
 	<table>
 		<tr>
 			<td colspan="2"><h1>회원정보</h1></td>
 		</tr>
 		<tr>
 			<td>아이디</td>
 			<td>
 				<%=m.getName()%>
			</td>
 		</tr>
 		<tr>
 			<td>비밀번호</td>
 			<td>
 				<%=m.getPass()%>
			</td>
 		</tr>
 		<tr>
 			<td>이름</td>
 			<td>
 				<%=m.getName()%>		
 			</td>
 		</tr>
 		<tr>
 			<td>주소</td>
 			<td>
 				<%=m.getAddr()%>
 			</td>
 		</tr>
 		<tr>
 			<td>전화번호</td>
 			<td>
 				<%=m.getPhone()%>
 			</td>
 		</tr>
 		<tr>
 			<td>성별</td>
 			<td>
 				<label>
 					<input type="radio" <%=m.getGender().equals("남성") ? "checked" : "disabled"%> /> 남성
 				</label>
 				<label>
 					<input type="radio" <%=m.getGender().equals("여성") ? "checked" : "disabled"%> /> 여성
 				</label>
 			</td>
 		</tr>
 		<tr>
 			<td>나이</td>
 			<td>
 				<%=m.getAge()%>
 			</td>
 		</tr>
 		<tr>
 			<td colspan="2">
 				<button onclick="location.href='index.jsp';">메인으로</button> 
 			</td>
 		</tr>
 	</table>
</section>	
<jsp:include page="common/footer.jsp" />












 	
 	
 	
 	
 	
 	