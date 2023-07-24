package repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import beans.MemberVO;
import util.DBCPUtil;

public class MemberDAOImpl implements MemberDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	@Override
	public boolean memberJoin(MemberVO member) {
		
		conn = DBCPUtil.getConnection();
		int result = 0;
		
		String sql = "INSERT INTO mvc_member (id,pass,name,age,gender) VALUES(?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getName());
			pstmt.setInt(4, member.getAge());
			pstmt.setString(5, member.getGender());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt,conn);
		}
		if(result > 0) {
			return true;
		}
		return false;
	}

	@Override
	public MemberVO memberLogin(String id, String pass) {
		
		MemberVO m = null;
		conn = DBCPUtil.getConnection();
		
		String sql = "SELECT * FROM mvc_member WHERE id = ? AND pass = ? AND joinYN = 'Y'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = new MemberVO();
				
				m.setNum(rs.getInt(1));
				m.setId(rs.getString(2));
				m.setPass(rs.getString(3));
				m.setName(rs.getString(4));
				m.setAge(rs.getInt(5));
				m.setGender(rs.getString(6));
				m.setJoinYN(rs.getString(7).charAt(0));
				m.setRegdate(rs.getDate(8));
				m.setUpdatedate(rs.getDate(9));
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(conn,pstmt,rs);
		}
		return m;
	}

	@Override
	public boolean memberUpdate(MemberVO member) {
		
		return false;
	}

	@Override
	public MemberVO getMemberById(String id) {
		MemberVO m = null;
		conn = DBCPUtil.getConnection();
		String sql = "SELECT * FROM mvc_member WHERE id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m = new MemberVO();
				
				m.setNum(rs.getInt(1));
				m.setId(rs.getString(2));
				m.setPass(rs.getString(3));
				m.setName(rs.getString(4));
				m.setAge(rs.getInt(5));
				m.setGender(rs.getString(6));
				m.setJoinYN(rs.getString(7).charAt(0));
				m.setRegdate(rs.getDate(8));
				m.setUpdatedate(rs.getDate(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs,pstmt,conn);
		}

		return m;
	}

	@Override
	public void withDrawMember(int num) {
		conn = DBCPUtil.getConnection();
		String sql = "UPDATE mvc_member SET joinYN = 'N' WHERE num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt,conn);
		}
		
	}

}
