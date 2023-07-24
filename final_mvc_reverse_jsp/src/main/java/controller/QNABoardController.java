package controller;

import java.io.IOException;
import java.util.ArrayList;

import beans.BoardVO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.QNABoardService;
import service.QNABoardServiceImpl;

@WebServlet("*.qna")
public class QNABoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	QNABoardService qs = new QNABoardServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String command = request.getRequestURI().substring(request.getContextPath().length() + 1);
		System.out.println("command : " + command);

		String nextPage = null;

		if (command.equals("boardList.qna")) {
			// 질문과 답변 게시물 목록
			ArrayList<BoardVO> list = qs.getBoardList(request);
			request.setAttribute("qnaList", list);
			nextPage = "/board/qna/qna_list.jsp";
		}
		if (command.equals("detail.qna")) {
			BoardVO qna =  qs.getBoardVO(request);
			qs.updateReadCount(request);
			request.setAttribute("qna", qna);
			nextPage = "/board/qna/qna_detail.jsp";
		}
		if (command.equals("update.qna")) {
			BoardVO qna =  qs.getBoardVOByUpdate(request);
			request.setAttribute("qna", qna);
			nextPage = "/board/qna/qna_update.jsp";
		}
		if(command.equals("updateSubmit.qna")) {
			qs.boardUpdate(request, response);
			request.setAttribute("message", "수정완료");
			nextPage = "boardList.qna";
		}
		if(command.equals("delete.qna")) {
			qs.boardDelete(request, response);
			nextPage = "boardList.qna";
		}
		if(command.equals("write.qna")) {
			nextPage = "/board/qna/qna_write.jsp";
		}
		if(command.equals("writeSubmit.qna")) {
			qs.boardWrite(request);
			nextPage = "boardList.qna";
		}
		if(command.equals("reply.qna")) {
			BoardVO qna =  qs.boardReply(request);
			request.setAttribute("qna", qna);
			nextPage = "/board/qna/qna_reply.jsp";
		}
		if(command.equals("replySubmit.qna")) {
			qs.boardReplySubmit(request);
			nextPage = "boardList.qna";
		}
		if (nextPage != null && !nextPage.trim().equals("")) {
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
