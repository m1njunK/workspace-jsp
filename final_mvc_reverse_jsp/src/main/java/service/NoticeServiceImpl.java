package service;

import java.util.ArrayList;

import beans.NoticeVO;
import jakarta.servlet.http.HttpServletRequest;
import repositories.NoticeDAO;
import repositories.NoticeDAOImpl;
import util.PageMaker;
import util.SearchCriteria;
import util.SearchPageMaker;

public class NoticeServiceImpl implements NoticeService {
	NoticeDAO nd = new NoticeDAOImpl();
	
	@Override
	public boolean noticeWrite(HttpServletRequest request) {
		NoticeVO notice = new NoticeVO();
		notice.setNotice_category(request.getParameter("notice_category"));
		notice.setNotice_title(request.getParameter("notice_title"));
		notice.setNotice_content(request.getParameter("notice_content"));

		return nd.noticeWrite(notice);
	}

	@Override
	public void noticeList(HttpServletRequest request) {
		SearchCriteria cri = new SearchCriteria();
		int pageNum = 1;
		String requestPage = request.getParameter("page");
		if(requestPage != null && !requestPage.trim().equals("")){
			pageNum = Integer.parseInt(requestPage);
		}
		cri.setPage(pageNum);
		
		String searchType = "";
		searchType = request.getParameter("searchType");
		
		if(searchType != null) {
			cri.setSearchType(searchType);
		}
		
		String searchValue = "";
		searchValue = request.getParameter("searchValue");
		
		if(searchValue != null) {
			cri.setSearchValue(searchValue);
		}
		
		int perPageNum = 10;
		String sPerPageNum = request.getParameter("perPageNum");
		if(sPerPageNum != null && !sPerPageNum.trim().equals("")) {
			perPageNum = Integer.parseInt(sPerPageNum);
		}
		cri.setPerPageNum(perPageNum);
		
		PageMaker pm = new SearchPageMaker();
		pm.setCri(cri);
		pm.setTotalCount(nd.getTotalCount(cri));
		ArrayList<NoticeVO> nList =  nd.noticeList(cri);
		request.setAttribute("pm", pm);
		request.setAttribute("noticeList", nList);
	}

	@Override
	public void noticeDetail(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("notice_num"));
		NoticeVO n = nd.noticeDetail(num);
		request.setAttribute("notice", n);
	}

	@Override
	public boolean noticeUpdate(HttpServletRequest request) {
		int num = Integer.parseInt( request.getParameter("notice_num"));
		String category = request.getParameter("notice_category");
		String title = request.getParameter("notice_title");
		String content = request.getParameter("notice_content");
		NoticeVO n = new NoticeVO();
		n.setNotice_num(num);
		n.setNotice_category(category);
		n.setNotice_title(title);
		n.setNotice_content(content);
		
		return nd.noticeUpdate(n);
	}

	@Override
	public boolean noticeDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("notice_num")); 
		return nd.noticeDelete(num);
	}

}
