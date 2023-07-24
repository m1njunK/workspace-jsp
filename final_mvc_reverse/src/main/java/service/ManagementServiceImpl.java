package service;

import java.util.ArrayList;

import beans.MemberVO;
import jakarta.servlet.http.HttpServletRequest;
import repositories.ManagementDAO;
import repositories.ManagementDAOImpl;
import util.PageMaker;

public class ManagementServiceImpl implements ManagementService {

	ManagementDAO dao = new ManagementDAOImpl();
	
	@Override
	public boolean updateMember(HttpServletRequest request) {
		String paramNum = request.getParameter("num");
		String age = request.getParameter("age");
		String pass = request.getParameter("pass");
		String gender = request.getParameter("gender");
		MemberVO member = new MemberVO();
		member.setNum(Integer.parseInt(paramNum));
		member.setAge(Integer.parseInt(age));
		member.setPass(pass);
		member.setGender(gender);
		int result = dao.updateMember(member);
		return result == 1 ? true : false;
	}

	@Override
	public boolean deleteMember(HttpServletRequest request) {
		return dao.deleteMember(Integer.parseInt(request.getParameter("nu,"))) > 0 ? true : false;
	}

	@Override
	public ArrayList<MemberVO> getMemberList(HttpServletRequest request) {
		// page - 현재 페이지 번호
		// perPageNum - 한번에 보여줄 게시물 개수
		// totalCount - 전체 게시물 개수
		// displayPageNum - 한번에 보여줄 페이지 번호 개수
		int defaultPage = 1;
		String page = request.getParameter("page");
		if (page != null) {
			defaultPage = Integer.parseInt(page);
		}
		PageMaker pm = new PageMaker();
		pm.getCri().setPage(defaultPage);
		pm.setDisplayPageNum(10);
		int totalCount = dao.getMemberTotalCount();
		pm.setTotalCount(totalCount);

		request.setAttribute("pm", pm);

		ArrayList<MemberVO> memberList = dao.getMemberList(pm.getCri());
		return memberList;
	}
}
