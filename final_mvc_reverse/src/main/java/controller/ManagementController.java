package controller;

import java.io.IOException;

import beans.MemberVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repositories.MemberDAOImpl;
import service.ManagementService;
import service.ManagementServiceImpl;
import service.MemberService;

@WebServlet("*.mgc")
public class ManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ManagementService ms = new ManagementServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// 자동로그인 체크
		MemberService.loginCheck(request);
		
		// 관리자 체크
		boolean isCheck = ManagementService.checkAdmin(request, response);
		if (!isCheck)
			return;

		String command = request.getRequestURI().substring(request.getContextPath().length() + 1);
		System.out.println("Management 요청 : " + command);

		String view = null;
		if (command.equals("managementPage.mgc")) {
			// 회원 목록 페이지 요청
			request.setAttribute("memberList", ms.getMemberList(request));
			view = "/management/member.jsp";
		}else if(command.equals("managementUpdateForm.mgc")) {
			MemberVO vo = new MemberDAOImpl().getMemberById(request.getParameter("id"));
			request.setAttribute("updateMember", vo);
			view ="/management/memberUpdate.jsp";
		}else if(command.equals("managementUpdate.mgc")) {
			boolean isSuccess = ms.updateMember(request);
			if(isSuccess) {
				request.setAttribute("message", "수정 성공");
			}else {
				request.setAttribute("message", "수정 실패");
			}
			view ="/management/memberList.jsp";
		}else if(command.equals("managementDelete.mgc")) {
			boolean isSuccess = ms.deleteMember(request);
			if(isSuccess) {
				request.setAttribute("message", "삭제 성공");
			}else {
				request.setAttribute("message", "삭제 실패");
			}
			view = "/management/member.jsp";
		}else {
			response.sendError(405,"잘못된 요청입니다.");
		}
		
		if (view != null && !view.trim().equals("")) {
			request.getRequestDispatcher(view).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
