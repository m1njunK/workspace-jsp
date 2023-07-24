package service;

import java.util.ArrayList;

import beans.BoardVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repositories.QNABoardDAO;
import repositories.QNABoardDAOImpl;
import util.Criteria;
import util.PageMaker;

public class QNABoardServiceImpl implements QNABoardService {
	QNABoardDAO qd = new QNABoardDAOImpl();
	@Override
	public ArrayList<BoardVO> getBoardList(HttpServletRequest request) {
		Criteria cri = new Criteria();
		int pageNum = 1;
		if(request.getParameter("page") != null) {
			pageNum = Integer.parseInt(request.getParameter("page"));
		}
		cri.setPage(pageNum);
		PageMaker pm = new PageMaker(cri,qd.getListCount());
		request.setAttribute("pm", pm);
		ArrayList<BoardVO> list = qd.getBoardList(cri);
		
		return list;
	}

	@Override
	public void boardWrite(HttpServletRequest request) {
		BoardVO board = new BoardVO();
		board.setQna_name(request.getParameter("qna_name"));
		board.setQna_title(request.getParameter("qna_title"));
		board.setQna_content(request.getParameter("qna_content"));
		board.setQna_writer_num(Integer.parseInt(request.getParameter("qna_writer_num")));
		qd.boardWrite(board);
	}

	@Override
	public BoardVO getBoardVO(HttpServletRequest request) {
		int num = 0;
		if(request.getParameter("qna_num") != null) {
			num = Integer.parseInt(request.getParameter("qna_num"));
		}
		return qd.getBoardVO(num);
	}

	@Override
	public void updateReadCount(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("qna_num"));
		if(num > 0) {
			qd.updateReadCount(num);
		}
	}

	@Override
	public BoardVO boardReply(HttpServletRequest request) {
		BoardVO qna = new BoardVO();
		qna.setQna_writer_num(Integer.parseInt(request.getParameter("qna_writer_num")));
		qna.setQna_re_ref(Integer.parseInt(request.getParameter("qna_re_ref")));
		qna.setQna_re_lev(Integer.parseInt(request.getParameter("qna_re_lev"))+1);
		qna.setQna_re_seq(Integer.parseInt(request.getParameter("qna_re_seq"))+1);
		qna.setQna_title(request.getParameter("qna_title"));
		qna.setQna_content(request.getParameter("qna_content"));
		return qna;
	}

	@Override
	public void boardReplySubmit(HttpServletRequest request) {
		BoardVO qna = boardReply(request);
		qna.setQna_re_lev(Integer.parseInt(request.getParameter("qna_re_lev")));
		qna.setQna_re_seq(Integer.parseInt(request.getParameter("qna_re_seq")));
		qna.setQna_name(request.getParameter("qna_name"));
		qd.boardReplySubmit(qna);
	}

	@Override
	public BoardVO getBoardVOByUpdate(HttpServletRequest request) {
		int num = 0;
		if(request.getParameter("qna_num") != null) {
			num = Integer.parseInt(request.getParameter("qna_num"));
		}
		return qd.getBoardVO(num);
	}

	@Override
	public void boardUpdate(HttpServletRequest request, HttpServletResponse response) {
		BoardVO qna = new BoardVO();
		qna.setQna_num(Integer.parseInt(request.getParameter("qna_num")));
		qna.setQna_title(request.getParameter("qna_title"));
		qna.setQna_content(request.getParameter("qna_content"));
		qd.boardUpdate(qna);
	}

	@Override
	public void boardDelete(HttpServletRequest request, HttpServletResponse response) {
		int board_num = Integer.parseInt(request.getParameter("qna_num"));
		if(qd.boardDelete(board_num, 0)) {
			request.setAttribute("message","삭제완료");
		}else {
			request.setAttribute("message","삭제실패");
		}
	}

}
