<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.sql.*, util.*, vo.*"%>
<%@ include file="checkAdmin.jsp" %>
<!-- memberList.jsp -->
<!-- 관리자 회원목록 확인 -->
<%
	Connection conn = DBCPUtil.getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM test_member ORDER BY num DESC";
	// 검색된 회원 목록을 저장할 리스트
	ArrayList<MemberVO> memberList = new ArrayList<>();
	try{
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){		
			MemberVO m = new MemberVO();
			m.setNum(rs.getInt(1));
			m.setId(rs.getString(2));
			m.setPass(rs.getString(3));
			m.setName(rs.getString(4));
			m.setAddr(rs.getString(5));
			m.setPhone(rs.getString(6));
			m.setGender(rs.getString(7));
			m.setAge(rs.getInt(8));
			memberList.add(m);
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBCPUtil.close(stmt,rs,conn);
	}
%>
<table border=1>
	<tr>
		<th colspan="7"><h1>회원목록</h1></th>
	</tr>
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>이름</th>
		<th>주소</th>
		<th>전화번호</th>
		<th>성별</th>
		<th>나이</th>
	</tr>
	<%
		if(!memberList.isEmpty()){
			for(MemberVO m : memberList){
	%>
		<tr title="<%=m.getName()%>님의 회원정보" onclick="location.href='index.jsp?page=memberInfo&num=<%=m.getNum()%>';">
			<td><%=m.getNum()%></td>
			<td><%=m.getId()%></td>
			<td><%=m.getName()%></td>
			<td><%=m.getAddr()%></td>
			<td><%=m.getPhone()%></td>
			<td><%=m.getGender()%></td>
			<td><%=m.getAge()%></td>
		</tr>
	<%
			}
		}else{ %>
			<tr>
				<th colspan="7">등록된 회원이 없다.</th>
			</tr>
	<%  } %>
</table>
