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
import service.MemberService;
import service.QNABoardService;
import service.QNABoardServiceImpl;

@WebServlet("*.qna")
public class QNABoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	QNABoardService qs = new QNABoardServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		MemberService.loginCheck(request);

		String command = request.getRequestURI().substring(request.getContextPath().length() + 1);
		System.out.println("command : " + command);

		String nextPage = null;

		if (command.equals("boardList.qna")) {
			// 질문과 답변 게시물 목록
			ArrayList<BoardVO> list = qs.getBoardList(request);
			request.setAttribute("qnaList", list);
			nextPage = "/board/qna/qna_list.jsp";
		}

		// 원본글-질문글 작성 페이지로 이동
		if (command.equals("boardWrite.qna")) {
			nextPage = "/board/qna/qna_write.jsp";
		}

		// 원본글-질문글 등록 처리 요청
		if (command.equals("boardWriteSubmit.qna")) {
			qs.boardWrite(request);
			response.sendRedirect(request.getContextPath() + "/boardList.qna");
		}

		// 게시글 상세보기 페이지 요청
		if (command.equals("boardDetail.qna")) {
			// 조회수 증가
			qs.updateReadCount(request);
			// boardRead.qna?qna_num=3
			response.sendRedirect("boardRead.qna?qna_num=" + request.getParameter("qna_num"));
		}

		if (command.equals("boardRead.qna")) {
			// 게시글 상세보기
			BoardVO vo = qs.getBoardVO(request);
			request.setAttribute("qna", vo);
			nextPage = "/board/qna/qna_detail.jsp";
		}

		// 답변글 작성 페이지
		if (command.equals("boardReplyForm.qna")) {
			BoardVO boardVO = qs.boardReply(request);
			request.setAttribute("qna", boardVO);
			nextPage = "/board/qna/qna_reply.jsp";
		}
		// 답변글 등록 처리 요청
		if (command.equals("boardReplySubmit.qna")) {
			qs.boardReplySubmit(request);
			response.sendRedirect("boardList.qna");
		}

		// 게시글 수정 페이지 요청
		if (command.equals("boardUpdateForm.qna")) {
			BoardVO board = qs.getBoardVOByUpdate(request);
			request.setAttribute("boardVO", board);
			nextPage = "/board/qna/qna_update.jsp";
		}

		if (command.equals("boardUpdate.qna")) {
			// 게시글 수정 요청 처리
			qs.boardUpdate(request, response);
		}

		// 게시글 삭제 요청 처리
		if (command.equals("boardDelete.qna")) {
			qs.boardDelete(request, response);
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
