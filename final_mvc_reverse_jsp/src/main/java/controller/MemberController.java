package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MemberService;
import service.MemberServiceImpl;

/**
 *  *. mc 요청 처리 
 */
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 회원 관련된 요청을 처리할 서비스 
	MemberService ms = new MemberServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// Cookie 정보 확인 - 자동 로그인
		MemberService.loginCheck(request);
		
		// 요청에 따른 처리 결과 화면 을 저장할 변수 
		String view = "";
		// 요청에 따라 데이터의 처리가 필요하다면 서비스로 처리 요청
		String command = request.getRequestURI().substring(request.getContextPath().length() + 1);
		
		if(command.equals("join.mc")) {
			view = "/member/join.jsp";
		}
		if(command.equals("joinMember.mc")) {
			ms.memberJoin(request, response);
		}
		if(command.equals("login.mc")) {
			view = "/member/login.jsp";
		}
		if(command.equals("memberLogin.mc")) {
			if(ms.memberLogin(request, response)) {
				view = "/index.jsp";
			}else {
				view = "/member/login.jsp";
			}
		}
		if(command.equals("logOut.mc")) {
			ms.logOut(request, response);
			view = "/index.jsp";
		}
		if(command.equals("withdraw.mc")) {
			ms.withDraw(request, response);
			view = "/index.jsp";
		}
		
		// view 정보가 존재할 시 forward로 페이지 이동
		if (view != null && !view.equals("")) {
			request.getRequestDispatcher(view).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
