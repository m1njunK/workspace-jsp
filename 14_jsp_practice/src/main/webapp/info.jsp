<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO m = (MemberVO) session.getAttribute("loginMember");
	String id = m.getId();
	String pw = m.getPass();
	String name = m.getName();
	String addr = m.getAddr();
	String phone = m.getPhone();
	String gender = m.getGender();
	int age = m.getAge();
%>
<!-- info.jsp -->
 	<table>
 		<tr>
 			<td>아이디</td>
 			<td>
 				<%=id%>		
			</td>
 		</tr>
 		<tr>
 			<td>비밀번호</td>
 			<td>
 				<%=pw%>
			</td>
 		</tr>
 		<tr>
 			<td>이름</td>
 			<td>
 				<%=name%>
 			</td>
 		</tr>
 		<tr>
 			<td>주소</td>
 			<td>
 				<%=addr%>
 			</td>
 		</tr>
 		<tr>
 			<td>전화번호</td>
 			<td>
 				<%=phone%>
 			</td>
 		</tr>
 		<tr>
 			<td>성별</td>
 			<td>
 				<label>
 					<input id="male" type="radio" disabled/> 남성
 				</label>
 				<label>
 					<input id="female" type="radio" disabled/> 여성
 				</label>
 			</td>
 		</tr>
 		<tr>
 			<td>나이</td>
 			<td>
 				<%=age%>
 			</td>
 		</tr>
 		<tr>
 			<td colspan="2">
 				<button onclick="location.href='index.jsp';">메인으로</button> 
 			</td>
 		</tr>
 	</table>	
<%
	out.println("<script>");
	if(gender.equals("남성")){
		out.println("document.querySelector('#male').checked = 'true';");
	}else{
		out.println("document.querySelector('#female').checked = 'true';");
	}
	out.println("</script>");
%>












 	
 	
 	
 	
 	
 	