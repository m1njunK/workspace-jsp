package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ManagementService;
import service.MemberService;
import service.NoticeService;
import service.NoticeServiceImpl;

@WebServlet("*.do")
public class NoticeController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	NoticeService ns = new NoticeServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		MemberService.loginCheck(request);

		String command = request.getRequestURI().substring(request.getContextPath().length() + 1);
		System.out.println("NoticeController 요청 : " + command);

		String view = null;

		boolean isSuccess = false;

		String suc = "/board/notice/notice_success.jsp";
		String fail = "/board/notice/notice_fail.jsp";

		if (command.equals("notice.do")) {
			// 공지 목록
			ns.noticeList(request);
			view = "/board/notice/notice_list.jsp";
		}

		if (command.equals("noticeDetail.do")) {
			// 상세보기
			ns.noticeDetail(request);
			view = "/board/notice/notice_detail.jsp";
		}

		if (command.equals("noticeWrite.do")) {
			System.out.println("공지 작성 페이지 요청");
			if (!ManagementService.checkAdmin(request, response))
				return;
			// 공지사항 작성
			view = "/board/notice/notice_write.jsp";
		}

		if (command.equals("noticeWriteSubmit.do")) {
			// 공지사항 작성 완료 요청
			// 작성 여부에 따라 성공 실패 페이지 매핑
			if (!ManagementService.checkAdmin(request, response))
				return;
			isSuccess = ns.noticeWrite(request);
			request.setAttribute("message", "작성");
			view = isSuccess ? suc : fail;
		}

		if (command.equals("noticeUpdate.do")) {
			// 공지사항 수정 페이지 요청
			if (!ManagementService.checkAdmin(request, response))
				return;
			ns.noticeDetail(request);
			view = "/board/notice/notice_update.jsp";
		}

		if (command.equals("noticeUpdateSubmit.do")) {
			// 공지사항 수정 완료 요청
			if (!ManagementService.checkAdmin(request, response))
				return;
			isSuccess = ns.noticeUpdate(request);
			request.setAttribute("message", "수정");
			view = isSuccess ? suc : fail;
		}

		if (command.equals("noticeDelete.do")) {
			// 공지사항 삭제
			if (!ManagementService.checkAdmin(request, response))
				return;
			isSuccess = ns.noticeDelete(request);
			request.setAttribute("message", "삭제");
			view = isSuccess ? suc : fail;
		}

		if (view != null && !view.equals("")) {
			request.getRequestDispatcher(view).forward(request, response);
		} else {
			request.getRequestDispatcher(fail).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
