<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.*,java.sql.*,vo.*" %>
<%
	String sql = "SELECT * FROM test_member WHERE num = ?";
	String num = request.getParameter("num");

	Connection conn = DBCPUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	MemberVO vo = null;
	
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,Integer.parseInt(num));
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			// 일치하는 회원정보 찾음
			vo = new MemberVO();
			vo.setNum(Integer.parseInt(num));
			vo.setId(rs.getString(2));
			vo.setPass(rs.getString(3));
			vo.setName(rs.getString(4));
			vo.setAddr(rs.getString(5));
			vo.setPhone(rs.getString(6));
			vo.setGender(rs.getString(7));
			vo.setAge(rs.getInt(8));
		}else{
			throw new NullPointerException("회원정보 없음");			
		}
	}catch(Exception e){
		out.println("<script>");
		out.println("alert('없다')");
		out.println("history.back()");
		out.println("</script>");
	}finally{
		DBCPUtil.close(rs,pstmt,conn);
	}
%>


<!-- memberUpdateForm.jsp -->
<script type="text/javascript" src="js/inputCheck.js"></script>
<form action="memberUpdate.jsp" method="POST">
	<input type="hidden" name="num" value="<%=vo.getNum()%>"/>
	<table>
		<tr>
			<td colspan="2"><h1>회원가입</h1></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="id" data-msg="아이디" value="<%=vo.getId()%>"/>
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="pass" data-msg="비밀번호" value="<%=vo.getPass()%>"/>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="name" data-msg="이름" value="<%=vo.getName()%>"/>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" name="addr" data-msg="주소" value="<%=vo.getAddr()%>"/>
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<input type="text" name="phone" data-msg="전화번호" value="<%=vo.getPhone()%>"/>
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<label>
				<input type="radio" name="gender" value="남성" <%= vo.getGender().equals("남성") ? "checked" : "" %>/>
				남성
				</label>
				<label>
				<input type="radio" name="gender" value="여성" <%= vo.getGender().equals("여성") ? "checked" : "" %>/>
				여성
				</label>
			</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>
				<input type="number" name="age" data-msg="나이" value="<%=vo.getAge()%>"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button>회원정보 수정</button>
			</td>
		</tr>
	</table>
</form>










