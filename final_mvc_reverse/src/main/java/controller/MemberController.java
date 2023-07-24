package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MemberService;
import service.MemberServiceImpl;
import util.FactoryUtil;

public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	MemberService ms = new MemberServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Cookie 정보 확인 - 자동 로그인
		MemberService.loginCheck(request);

		String requestPath = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestPath.substring(contextPath.length() + 1);
		System.out.println("MemberController 요청 : " + command);
		
		command = FactoryUtil.getCommand(request);

		String view = "";

		if (command.equals("join.mc")) {
			view = "/member/join.jsp";
		}else if (command.equals("login.mc")) {
			view = "/member/login.jsp";
		}else if (command.equals("info.mc")) {
			view = "/member/info.jsp";
		}else if (command.equals("update.mc")) {
			view = "/member/update.jsp";
		}else if (command.equals("logOut.mc")) {
			ms.logOut(request, response);
			// 요청 처리
			request.setAttribute("test", "로그아웃 완료");
			view = "/common/main.jsp";
		}else if (command.equals("withdraw.mc")) {
			System.out.println("회원 탈퇴 요청 처리");
			// 비밀번호를 다시 입력받아 비밀번호가 일치할 경우 탈퇴 처리;
			view = "/member/withdraw.jsp";
		}else {
			response.sendError(405,"정상적인 전송 방식이 아닙니다.");
		}
		
		FactoryUtil.nextPage(request, response, view);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String command = FactoryUtil.getCommand(request);
		
		String view = "";
		
		if (command.equals("joinSubmit.mc")) {
			System.out.println("회원 가입 처리 요청");
			ms.memberJoin(request, response);
		}else if (command.equals("loginSubmit.mc")) {
			System.out.println("로그인 처리 요청");
			boolean isLogin = ms.memberLogin(request, response);
			if (isLogin) {
				// 로그인 성공
				request.setAttribute("msg", "로그인 성공");
				view = "/index.jsp";
			} else {
				// 로그인 실패
				request.setAttribute("msg", "로그인 실패");
				view = "/member/login.jsp";
			}
		}else if (command.equals("updateSubmit.mc")) {
			System.out.println("회원 정보 수정 요청 처리 ");
			ms.memberUpdate(request, response);
		}else if (command.equals("withdrawSubmit.mc")) {
			System.out.println("회원 탈퇴 요청 처리");
			// 비밀번호를 다시 입력받아 비밀번호가 일치할 경우 탈퇴 처리;
			ms.withDraw(request, response);
		}else {
			response.sendError(405,"정상적인 전송 방식이 아닙니다.");
		}
		FactoryUtil.nextPage(request, response, view);
	}

}









