package repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import beans.MemberVO;
import util.Criteria;
import util.DBCPUtil;

public class ManagementDAOImpl implements ManagementDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	@Override
	public ArrayList<MemberVO> getMemberList(Criteria cri) {
		ArrayList<MemberVO> mList = new ArrayList<>();
		conn = DBCPUtil.getConnection();
		String sql = "SELECT num,name,regdate FROM mvc_member";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt(1);
				String name = rs.getString(2);
				Date date = rs.getDate(3);
				MemberVO m = new MemberVO();
				m.setNum(num);
				m.setName(name);
				m.setRegdate(date);
				mList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBCPUtil.close(rs,pstmt,conn);
			System.out.println(mList);
		}
		
		return mList;
	}

	@Override
	public int getMemberTotalCount() {

		return 0;
	}

	@Override
	public int updateMember(MemberVO vo) {

		return 0;
	}

	@Override
	public int deleteMember(int num) {

		return 0;
	}

}
