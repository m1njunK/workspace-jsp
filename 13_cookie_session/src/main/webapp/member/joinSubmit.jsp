<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	joinSubmit.jsp 
	회원가입 요청한 한명의 사용자 정보를 application에 저장해 두고 비교
-->
<jsp:useBean id="joinMember" class="beans.MemberBean" scope="application"/>
<jsp:setProperty name="joinMember" property="*"/>
<%=joinMember%>
<script>
	alert("회원가입 완료");
	location.href='login.jsp';
</script>
