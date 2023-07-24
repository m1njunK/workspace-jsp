package service;

import java.io.IOException;
import java.util.ArrayList;

import beans.BoardVO;
import beans.MemberVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repositories.QNABoardDAO;
import repositories.QNABoardDAOImpl;
import util.Criteria;
import util.PageMaker;

public class QNABoardServiceImpl implements QNABoardService {

	QNABoardDAO dao = new QNABoardDAOImpl();

	@Override
	public ArrayList<BoardVO> getBoardList(HttpServletRequest request) {
		// 페이징 처리된 게시물 목록
		// 사용자가 요청한 페이지 번호
		int page = 1;
		String pageNum = request.getParameter("page");
		if (pageNum != null) {
			page = Integer.parseInt(pageNum);
		}
		Criteria criteria = new Criteria(page, 10);
		// 페이징 블럭 처리 정보 추가
		PageMaker pm = new PageMaker();
		pm.setCri(criteria);

		int totalCount = dao.getListCount();
		pm.setTotalCount(totalCount);
		request.setAttribute("pm", pm);
		ArrayList<BoardVO> list = dao.getBoardList(criteria);
		return list;
	}

	@Override
	public void boardWrite(HttpServletRequest request) {
		String qna_name = request.getParameter("qna_name");
		String qna_title = request.getParameter("qna_title");
		String qna_content = request.getParameter("qna_content");
		String num = request.getParameter("qna_writer_num");
		int qna_writer_num = Integer.parseInt(num);

		BoardVO vo = new BoardVO(qna_name,qna_title, qna_content, qna_writer_num);
		dao.boardWrite(vo);
	}

	@Override
	public BoardVO getBoardVO(HttpServletRequest request) {
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		return dao.getBoardVO(qna_num);
	}

	@Override
	public void updateReadCount(HttpServletRequest request) {
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		dao.updateReadCount(qna_num);
	}

	@Override
	public BoardVO boardReply(HttpServletRequest request) {
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		return dao.getBoardVO(qna_num);
	}

	@Override
	public void boardReplySubmit(HttpServletRequest request) {
		String qna_name = request.getParameter("qna_name");
		String qna_title = request.getParameter("qna_title");
		String qna_content = request.getParameter("qna_content");
		String num = request.getParameter("qna_writer_num");
		int qna_writer_num = Integer.parseInt(num);
		int qna_re_ref = Integer.parseInt(request.getParameter("qna_re_ref"));
		int qna_re_lev = Integer.parseInt(request.getParameter("qna_re_lev"));
		int qna_re_seq = Integer.parseInt(request.getParameter("qna_re_seq"));
		BoardVO vo = new BoardVO(qna_name, qna_title, qna_content, qna_re_ref, qna_re_lev, qna_re_seq, qna_writer_num);
		dao.boardReplySubmit(vo);
	}

	@Override
	public BoardVO getBoardVOByUpdate(HttpServletRequest request) {
		String numStr = request.getParameter("qna_num");
		int qna_num = Integer.parseInt(numStr);
		BoardVO board = dao.getBoardVO(qna_num);
		return board;
	}

	@Override
	public void boardUpdate(HttpServletRequest request, HttpServletResponse response) {
		String numStr = request.getParameter("qna_num");
		String qna_name = request.getParameter("qna_name");
		String qna_title = request.getParameter("qna_title");
		String qna_content = request.getParameter("qna_content");
		String numWriter = request.getParameter("qna_writer_num");
		BoardVO vo = new BoardVO(
				qna_name,
				qna_title, 
				qna_content, 
				Integer.parseInt(numWriter));
		vo.setQna_num(Integer.parseInt(numStr));

		dao.boardUpdate(vo);

		try {
			String page = "boardRead.qna?qna_num=" + numStr;
			response.sendRedirect(page);
		} catch (IOException e) {}
	}

	@Override
	public void boardDelete(HttpServletRequest request, HttpServletResponse response) {

		try {
			int qna_num = Integer.parseInt(request.getParameter("qna_num"));

			MemberVO member = (MemberVO) request.getSession().getAttribute("member");
			if (member == null) {
				response.sendRedirect("boardRead.qna?qna_num=" + qna_num);
				return;
			}

			boolean isSuccess = dao.boardDelete(qna_num, member.getNum());
			if (isSuccess) {
				response.sendRedirect("boardList.qna");
			} else {
				response.sendRedirect("boardRead.qna?qna_num=" + qna_num);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
