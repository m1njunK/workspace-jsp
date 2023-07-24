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
		String sql = "SELECT num,name,regdate FROM mvc_member ORDER BY num DESC limit ?,?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,cri.getStartRow());
			pstmt.setInt(2,cri.getPerPageNum());
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
		}
		
		return mList;
	}

	@Override
	public int getMemberTotalCount() {
		int count = 0;
		String sql = "SELECT count(*) AS count FROM mvc_member WHERE joinYN = 'Y'";
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs,pstmt,conn);
		}
		return count;
	}

	@Override
	public int updateMember(MemberVO vo) {
		int result = 0;
		String sql = "UPDATE mvc_member SET pass = ?, age = ?, gender = ? WHERE num = ?";
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPass());
			pstmt.setInt(2, vo.getAge());
			pstmt.setString(3, vo.getGender());
			pstmt.setInt(4, vo.getNum());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt,conn);
		}
		return result;
	}

	@Override
	public int deleteMember(int num) {
		String sql = "UPDATE mvc_member SET joinYN = 'Y' WHERE num = ? AND id != 'admin'";
		conn = DBCPUtil.getConnection();
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);		
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt,conn);
		}
		return result;
	}

	@Override
	public MemberVO getMember(int num) {
		MemberVO m = new MemberVO();
		conn = DBCPUtil.getConnection();
		String sql = "SELECT * FROM mvc_member WHERE num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m.setNum(rs.getInt(1));
				m.setId(rs.getString(2));;
				m.setPass(rs.getString(3));
				m.setAge(rs.getInt(5));
				m.setGender(rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs,pstmt,conn);
		}
		return m;
	}

}
