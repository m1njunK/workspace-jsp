package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBCPUtil;
import vo.GuestBookVO;

public class GuestBookDAOImpl implements GuestBookDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	@Override
	public List<GuestBookVO> pageList(int startRow, int pageNum) {
		List<GuestBookVO> bookList = new ArrayList<>();
		String sql = "SELECT * FROM test_guestbook ORDER BY id DESC limit ?, ?";
		
		conn = DBCPUtil.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GuestBookVO vo = new GuestBookVO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4)
				);
				bookList.add(vo);
			}
		} catch (SQLException e) {
			bookList.clear();
		}finally {
			DBCPUtil.close(rs,pstmt,conn);
		}
		return bookList;
	}

	@Override
	public int totalCount() {
		int totalCount = 0;
		String sql = "SELECT count(*) FROM test_guestbook";
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			totalCount = 0;
		}finally {
			DBCPUtil.close(rs,pstmt,conn);
		}
		
		return totalCount;
	}

	@Override
	public int insertGuestBook(GuestBookVO guestBook) {
		return 0;
	}

	@Override
	public int deleteGuestBook(String id, String password) {
		return 0;
	}

}
