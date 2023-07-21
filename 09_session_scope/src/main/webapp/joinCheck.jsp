<%@page import="java.util.*"%>
<%@page import="vo.MemberVO"%>
<%@page import="javax.print.attribute.standard.Media"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- joinCheck.jsp -->
<!-- 
	4대 영역 객체 - 속성 객체
	pageContext - 하나의 jsp page 정보
	request 	- 하나의 요청 응답 완료
	session 	- 한 사용자의 브라우저 사용 완료
	application - 서버 사용 완료
 -->
<% 
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");
	String uname = request.getParameter("uname");
	
	// method 전송방식을 소문자로
	// get or post
	String method = request.getMethod().toLowerCase();
	
	MemberVO joinMember = new MemberVO(uid,upw,uname);
	
	// 등록된 회원 목록 호출
	// application에 등록 된 회원 목록 정보를 memberList key 값으로 관리
	List<MemberVO> memberList = (List<MemberVO>) application.getAttribute("memberList");
	if(memberList == null){
		memberList = new ArrayList<>();
		application.setAttribute("memberList", memberList);
	}
	
	String message = "";
	String nextPage = "";
	
	if(method.equals("get")){
		message = "정상적인 접근이 아닙니다.";
		nextPage = "join.jsp";
	}else{
		boolean isCheck = false;
		for(MemberVO member : memberList){
			if(member.getUid().equals(joinMember.getUid())){
				isCheck = true;
				break;
			}
		}
		
		if(isCheck){
			message = "이미 사용중인 아이디 입니다.";
			nextPage = "join.jsp";
		}else{
			// 회원 목록 존재
			memberList.add(joinMember);
			message = "회원가입 완료";
			nextPage = "login.jsp";
		}	
	}
	
	request.setAttribute("message", message);
	
	// 출력 페이지를 login.jsp 로 변경
	RequestDispatcher rd = request.getRequestDispatcher(nextPage);
	rd.forward(request,response);
	
%>
	

