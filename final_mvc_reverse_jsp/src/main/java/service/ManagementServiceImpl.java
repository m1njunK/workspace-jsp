package service;

import java.util.ArrayList;

import beans.MemberVO;
import jakarta.servlet.http.HttpServletRequest;
import repositories.ManagementDAO;
import repositories.ManagementDAOImpl;
import util.Criteria;
import util.PageMaker;

public class ManagementServiceImpl implements ManagementService {
	ManagementDAO mgd = new ManagementDAOImpl();
	
	@Override
	public ArrayList<MemberVO> getMemberList(HttpServletRequest request) {
		Criteria cri = new Criteria();
		int pageNum = 1;
		String requestPage = request.getParameter("page");
		if(requestPage != null && !requestPage.trim().equals("")){
			pageNum = Integer.parseInt(requestPage);
		}
		cri.setPage(pageNum);
		PageMaker pm = new PageMaker(cri, mgd.getMemberTotalCount());
		request.setAttribute("pm", pm);
		ArrayList<MemberVO> mList = mgd.getMemberList(cri);
		
		return mList;
	}

	@Override
	public boolean updateMember(HttpServletRequest request) {
		MemberVO m = new MemberVO();
		m.setNum(Integer.parseInt(request.getParameter("num")));
		m.setPass(request.getParameter("pass"));
		m.setAge(Integer.parseInt(request.getParameter("age")));
		m.setGender(request.getParameter("gender"));
		if(0 < mgd.updateMember(m)) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteMember(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		if(0 < mgd.deleteMember(num)) {
			return true;
		}
		return false;
	}

}
