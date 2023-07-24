package repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.NoticeVO;
import util.DBCPUtil;
import util.SearchCriteria;

public class NoticeDAOImpl implements NoticeDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	@Override
	public boolean noticeWrite(NoticeVO vo) {
		boolean isSuccess = false;
		conn = DBCPUtil.getConnection();
		String sql = "INSERT INTO notice_board VALUES(null,?,?,?,?,now())";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNotice_category());
			pstmt.setString(2, vo.getNotice_author());
			pstmt.setString(3, vo.getNotice_title());
			pstmt.setString(4, vo.getNotice_content());
			if (pstmt.executeUpdate() != 0) {
				isSuccess = true;
			}
		} catch (SQLException e) {
			isSuccess = false;
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
		return isSuccess;
	}

	@Override
	public ArrayList<NoticeVO> noticeList(SearchCriteria cri) {
		ArrayList<NoticeVO> list = new ArrayList<>();

		conn = DBCPUtil.getConnection();
		String query = makeCondition(cri);
		String sql = "SELECT * FROM notice_board ";
					if(query != null) {
						sql += query;
					}
				    sql += " ORDER BY notice_num DESC limit ?, ?";

		try {
			pstmt = conn.prepareStatement(sql);
			if(query != null) {
				pstmt.setString(1, cri.getSearchValue());
				pstmt.setInt(2, cri.getStartRow());
				pstmt.setInt(3, cri.getPerPageNum());
			}else {
				pstmt.setInt(1, cri.getStartRow());
				pstmt.setInt(2, cri.getPerPageNum());
			}
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				NoticeVO n = new NoticeVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getTimestamp(6));
				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs, pstmt, conn);
		}
		return list;
	}

	private String makeCondition(SearchCriteria cri) {
		String query = null;
		if(cri.getSearchValue() != null && !cri.getSearchValue().equals("")) {
			if(cri.getSearchType().equals("title")) {
				query = " WHERE notice_title LIKE CONCAT('%',?,'%')";
			}else {
				query = " WHERE notice_content LIKE CONCAT('%',?,'%')";
			}
		}
		return query;
	}
	
	
	@Override
	public int getTotalCount(SearchCriteria cri) {
		conn = DBCPUtil.getConnection();
		int listCount = 0;
		String query = makeCondition(cri);
		String sql = "SELECT count(*) FROM notice_board ";
		if(query != null) {
			sql += query;
		}
		try {
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			if(query != null) {
				pstmt.setString(1, cri.getSearchValue());
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs, pstmt, conn);
		}
		return listCount;
	}

	@Override
	public NoticeVO noticeDetail(int notice_num) {
		NoticeVO notice = null;
		conn = DBCPUtil.getConnection();
		String sql = "SELECT * FROM notice_board WHERE notice_num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				notice = new NoticeVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getTimestamp(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs, pstmt, conn);
		}
		return notice;
	}

	@Override
	public boolean noticeUpdate(NoticeVO vo) {
		boolean isSuccess = false;
		String sql = " UPDATE notice_board SET " 
					+ " notice_category = ? ," 
					+ " notice_author = ? ," 
					+ " notice_title = ? ,"
					+ " notice_content = ? , " 
					+ " notice_date = now() " 
					+ " WHERE notice_num = ? ";
		conn = DBCPUtil.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNotice_category());
			pstmt.setString(2, vo.getNotice_author());
			pstmt.setString(3, vo.getNotice_title());
			pstmt.setString(4, vo.getNotice_content());
			pstmt.setInt(5, vo.getNotice_num());
			if (pstmt.executeUpdate() > 0) {
				isSuccess = true;
			}
		} catch (SQLException e) {
			isSuccess = false;
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
		return isSuccess;
	}

	@Override
	public boolean noticeDelete(int notice_num) {
		boolean isSuccess = false;
		conn = DBCPUtil.getConnection();
		String sql = "DELETE FROM notice_board WHERE notice_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
			if (pstmt.executeUpdate() > 0) {
				isSuccess = true;
			}
		} catch (SQLException e) {
			isSuccess = false;
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
		return isSuccess;
	}
	
	
	
	
	
	
}
