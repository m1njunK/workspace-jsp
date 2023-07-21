package service;

import java.util.ArrayList;

import beans.MemberVO;
import jakarta.servlet.http.HttpServletRequest;
import repositories.ManagementDAO;
import repositories.ManagementDAOImpl;
import util.Criteria;

public class ManagementServiceImpl implements ManagementService {

	@Override
	public ArrayList<MemberVO> getMemberList(HttpServletRequest request) {
		ManagementDAO mgd = new ManagementDAOImpl();
		ArrayList<MemberVO> mList = mgd.getMemberList(new Criteria());
		return mList;
	}

	@Override
	public boolean updateMember(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteMember(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return false;
	}

}