package service;

import java.util.List;

import dao.GuestBookDAO;
import dao.GuestBookDAOImpl;
import jakarta.servlet.http.HttpServletRequest;
import util.Criteria;
import util.PageMaker;
import vo.GuestBookVO;

public class GuestBookServiceImpl implements GuestBookService {

	GuestBookDAO dao = new GuestBookDAOImpl();
	
	@Override
	public void guestBookList(HttpServletRequest request) {
		// 페이징 처리된 리스트 정보 전달
		String page = request.getParameter("page");
		int pageNum = 1;
		if(page != null) {
			pageNum = Integer.parseInt(page);
		}
		
		Criteria cri = new Criteria();
		cri.setPage(pageNum);
		
		List<GuestBookVO> list = dao.pageList(cri.getStartRow(), cri.getPerPageNum());
		
		request.setAttribute("bookList", list);
		
		// page block 정보 - criteria , totalCount, displayPageNum
		// 전체 게시물 개수
		int totalCount = dao.totalCount();
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(totalCount);
		request.setAttribute("pm", pm);
	}

	@Override
	public void writeBook(HttpServletRequest request) {

	}

	@Override
	public void deleteBook(HttpServletRequest request) {

	}

}
