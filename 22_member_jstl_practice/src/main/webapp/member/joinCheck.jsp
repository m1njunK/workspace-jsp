<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!-- joinCheck.jsp -->
<!-- 회원가입 처리 -->
<s:update var="rs" dataSource="java/MySqlDB">
	INSERT IGNORE INTO digital_member (u_id,u_pass,u_age,u_gender) VALUES(?, ?, ?, ?);
	<s:param>${param.u_id}</s:param> 
	<s:param>${param.u_pass}</s:param> 
	<s:param>${param.u_age}</s:param> 
	<s:param>${param.u_gender}</s:param> 
</s:update>
<c:choose>
	<c:when test="${rs > 0}">
		<script>
			alert('회원가입 성공!');
			location.href="login.jsp";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert('회원가입 실패다');
			history.back();
		</script>
	</c:otherwise>
</c:choose>
<%-- 	u_num INT primary key auto_increment, 	-- 회원번호
	u_id VARCHAR(30) unique,			  	-- 회원아이디
	u_pass VARCHAR(30) NOT NULL,			-- 비밀번호
	u_age int,								-- 나이
	u_gender VARCHAR(10), 				    -- 성별
	u_join char(1) default 'Y',				-- 회원탈퇴 여부 Y == 가입상태
	u_regdate TIMESTAMP default now() 		-- 회원가입일	 
 --%>







