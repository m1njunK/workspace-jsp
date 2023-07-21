package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.GuestBookService;
import service.GuestBookServiceImpl;

/**
 * guest book 관련 요청 처리를 담당할 class
 * .gb로 끝나는 요청이 들어오면 현재 servlet이 처리
 * 
 * list.gb : 방명록 리스트 페이지 요청
 * wirte.gb : 방명록 작성 요청
 * confirm.gb : 삭제 요청 페이지 요청
 * delete.gb : 방명록 삭제 요청
 */
@WebServlet("*.gb")
public class GuestBookController extends HttpServlet{

	private static final long serialVersionUID = 2224193367516863558L;

	GuestBookService gbs = new GuestBookServiceImpl();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청 전체 경로
		String requestUri = request.getRequestURI();
		System.out.println("requestUri : " + requestUri);
		
		// 프로젝트
		String contextPath = request.getContextPath();
		System.out.println("contextPath : " + contextPath);
		
		// 요청 경로
		String command = requestUri.substring(contextPath.length()+1);
		System.out.println("command : " + command);
		
		String nextPage = null;

		// 게시물 목록 페이지 요청
		if(command.equals("list.gb")) {
			gbs.guestBookList(request);
			nextPage = "/guestbook/guestbook_list.jsp";
		}
		// 방명록 작성 요청
		if(command.equals("write.gb")) {
			gbs.writeBook(request);
			nextPage = "/guestbook/guestbook_write.jsp";
		}
		// 방명록 삭제 비밀번호 확인
		if(command.equals("confirm.gb")) {
			nextPage = "/guestbook/guestbook_confirm.jsp";
		}
		// 방명록 삭제 요청
		if(command.equals("delete.gb")) {
			gbs.deleteBook(request);
			nextPage = "/guestbook/guestbook_delete.jsp";
		}
		
		if(nextPage != null) {
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		}else {
			response.sendRedirect("list.gb");
		}
		
	}

}
