package controller;

import java.io.IOException;

import beans.MemberVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repositories.ManagementDAO;
import repositories.ManagementDAOImpl;
import service.ManagementService;
import service.ManagementServiceImpl;

@WebServlet("*.mgc")
public class ManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ManagementService ms = new ManagementServiceImpl();
	ManagementDAO md = new ManagementDAOImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String command = request.getRequestURI().substring(request.getContextPath().length() + 1);
		System.out.println("Management 요청 : " + command);

		String view = null;
		
		if (command.equals("managementPage.mgc")) {
			// 회원 목록 페이지 요청
			request.setAttribute("memberList", ms.getMemberList(request));
			view = "/management/member.jsp";
		}
		if(command.equals("updateMember.mgc")) {
			MemberVO m = md.getMember(Integer.parseInt(request.getParameter("num")));
			request.setAttribute("updateMember", m);
			view = "/management/memberUpdate.jsp";
		}
		if(command.equals("memberUpdate.mgc")) {
			if(ms.updateMember(request)) {
				request.setAttribute("message", "회원정보 수정 완료!");
				view = "managementPage.mgc";
			}else {
				request.setAttribute("message", "회원정보 수정 실패!");
				view = "managementPage.mgc";
			}
		}
		if(command.equals("memberDelete.mgc")) {
			if(ms.deleteMember(request)) {
				request.setAttribute("message", "회원 삭제 완료");
				view = "managementPage.mgc";
			}else {
				request.setAttribute("message", "꺼져");
				view = "managementPage.mgc";
			}
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
