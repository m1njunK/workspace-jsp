<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session"/>
<table>
	<tr>
		<td colspan="2"><h1>회원정보</h1></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><jsp:getProperty property="id" name="loginMember"/></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><jsp:getProperty property="name" name="loginMember"/></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><jsp:getProperty property="addr" name="loginMember"/></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><jsp:getProperty property="phone" name="loginMember"/></td>
	</tr>
	<tr>
		<td>성별</td>
		<td><jsp:getProperty property="gender" name="loginMember"/></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><jsp:getProperty property="age" name="loginMember"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onclick="location.href='index.jsp';">메인으로</button>
			<button type="button" onclick="withdraw();">회원탈퇴</button>
		</td>
	</tr>
</table>
<script>
	function withdraw(){
		var bool = confirm("정말로 탈퇴하시겠습니까?");
		if(bool){
			location.href="withdraw.jsp";
		}
	}
</script>























