package service;

import java.util.ArrayList;

import beans.NoticeVO;
import jakarta.servlet.http.HttpServletRequest;
import repositories.NoticeDAO;
import repositories.NoticeDAOImpl;
import util.PageMaker;
import util.SearchCriteria;

public class NoticeServiceImpl implements NoticeService {

	NoticeDAO dao = new NoticeDAOImpl();

	@Override
	public boolean noticeWrite(HttpServletRequest request) {
		NoticeVO vo = new NoticeVO(
				request.getParameter("notice_category"), 
				request.getParameter("notice_author"),
				request.getParameter("notice_title"), 
				request.getParameter("notice_content"));
		System.out.println(vo);
		return dao.noticeWrite(vo);
	}

	@Override
	public void noticeList(HttpServletRequest request) {
		int page = 1;
		String requestPage = request.getParameter("page");
		if (requestPage != null) {
			page = Integer.parseInt(requestPage);
		}
		
		String perPageNum = request.getParameter("perPageNum");
		int pageNum = 10;
		if (perPageNum != null && !perPageNum.equals("")) {
			pageNum = Integer.parseInt(perPageNum);
		}
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(page);
		cri.setPerPageNum(pageNum);
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		
		if(searchType != null && !searchType.equals("")) {
			cri.setSearchType(searchType);
		}
		
		if(searchValue != null && !searchValue.equals("")) {
			cri.setSearchValue(searchValue);
		}
		
		ArrayList<NoticeVO> list = dao.noticeList(cri);
		request.setAttribute("noticeList", list);

		int listCount = dao.getTotalCount(cri);
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(listCount);
		System.out.println("NoticeList PageMaker : " + pm);
		request.setAttribute("pm", pm);
	}

	@Override
	public void noticeDetail(HttpServletRequest request) {
		String num = request.getParameter("notice_num");
		int notice_num = Integer.parseInt(num);
		request.setAttribute("notice", dao.noticeDetail(notice_num));
	}

	@Override
	public boolean noticeUpdate(HttpServletRequest request) {
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		String notice_category = request.getParameter("notice_category");
		String notice_author = request.getParameter("notice_author");
		String notice_title = request.getParameter("notice_title");
		String notice_content = request.getParameter("notice_content");

		NoticeVO notice = new NoticeVO(notice_category, notice_author, notice_title, notice_content);
		notice.setNotice_num(notice_num);
		System.out.println("update : " + notice);
		return dao.noticeUpdate(notice);
	}

	@Override
	public boolean noticeDelete(HttpServletRequest request) {
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		return dao.noticeDelete(notice_num);
	}

}
