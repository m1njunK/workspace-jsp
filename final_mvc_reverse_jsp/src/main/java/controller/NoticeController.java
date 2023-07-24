package controller;

import java.io.IOException;

import beans.NoticeVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.NoticeService;
import service.NoticeServiceImpl;

@WebServlet("*.do")
public class NoticeController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	// 공지 사항 관련 요청을 처리할 클래스
	NoticeService ns = new NoticeServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String command = request.getRequestURI().substring(request.getContextPath().length() + 1);
		System.out.println("NoticeController 요청 : " + command);

		String view = null;

		boolean isSuccess = false;

		String suc = "/board/notice/notice_success.jsp";
		String fail = "/board/notice/notice_fail.jsp";

		if(command.equals("notice.do")) {
			// 공지 목록
			ns.noticeList(request);
			view = "/board/notice/notice_list.jsp";
		}
		if(command.equals("noticeDetail.do")) {
			ns.noticeDetail(request);
			view = "/board/notice/notice_detail.jsp";
		}
		if(command.equals("noticeWrite.do")) {
			view = "/board/notice/notice_write.jsp";
		}
		if(command.equals("noticeWriteSubmit.do")) {
			isSuccess = ns.noticeWrite(request); 
			if(isSuccess) {
				request.setAttribute("message", "공지사항 작성 완료");
				view = suc;
			}else {
				request.setAttribute("message", "공지사항 작성 실패!!");
				view = fail;
			}
		}
		if(command.equals("noticeUpdate.do")) {
			ns.noticeDetail(request);
			view = "/board/notice/notice_update.jsp";
		}
		if(command.equals("noticeUpdateSubmit.do")) {
			if(ns.noticeUpdate(request)) {
				request.setAttribute("message", "공지사항 수정 완료");
				view = suc;
			}else {
				request.setAttribute("message", "공지사항 수정 실패");
				view = fail;
			}
		}
		if(command.equals("noticeDelete.do")) {
			isSuccess =  ns.noticeDelete(request);
			if(isSuccess) {
				request.setAttribute("message", "공지사항 삭제 완료");
				view = suc;
			}else {
				request.setAttribute("message", "공지사항 삭제 실패");
				view = fail;
			}
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
