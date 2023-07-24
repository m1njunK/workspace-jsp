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

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	@Override
	public boolean noticeWrite(NoticeVO vo) {
		String sql = "INSERT INTO notice_board VALUES(NULL,?,?,?,?,NOW())";
		conn = DBCPUtil.getConnection();
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNotice_category());
			pstmt.setString(2, "admin");
			pstmt.setString(3, vo.getNotice_title());
			pstmt.setString(4, vo.getNotice_content());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs,pstmt,conn);
		}
		return result > 0;
	}

	@Override
	public ArrayList<NoticeVO> noticeList(SearchCriteria cri) {
		String sql = "";
		String value = cri.getSearchValue();
		ArrayList<NoticeVO> nList = new ArrayList<>();
		conn = DBCPUtil.getConnection();
		int sqlCase = 0;
		
		if(cri.getSearchType() == null && cri.getSearchValue() == null) {
			sql = "SELECT * FROM notice_board ORDER BY notice_num DESC limit ?,?";
			sqlCase = 1;
		}else {
			if(cri.getSearchType().equals("title")) {
				sql = "SELECT * FROM notice_board WHERE notice_title LIKE ? ORDER BY notice_num DESC limit ?,?";
			} else {
				sql = "SELECT * FROM notice_board WHERE notice_content LIKE ? ORDER BY notice_num DESC limit ?,?";
			}
		}
				
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(sqlCase == 1) {
				pstmt.setInt(1, cri.getStartRow());
				pstmt.setInt(2, cri.getPerPageNum());
			}else {
				pstmt.setString(1, "%"+value+"%");
				pstmt.setInt(2, cri.getStartRow());
				pstmt.setInt(3, cri.getPerPageNum());
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeVO n = new NoticeVO();
				n.setNotice_num(rs.getInt(1));
				n.setNotice_category(rs.getString(2));
				n.setNotice_author(rs.getString(3));
				n.setNotice_title(rs.getString(4));
				n.setNotice_content(rs.getString(5));
				n.setNotice_date(rs.getDate(6));
				nList.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs,pstmt,conn);
		}
		return nList;
	}

	@Override
	public int getTotalCount(SearchCriteria cri) {
		String sql = "SELECT COUNT(*) FROM notice_board";
		boolean sqlCase = false;
		
		if(cri.getSearchValue() != null && cri.getSearchType() != null) {
			if(cri.getSearchType().equals("title")) {
				sql = "SELECT COUNT(*) FROM notice_board WHERE notice_title LIKE ?";
				sqlCase = true;
			}else if(cri.getSearchType().equals("content")){
				sql = "SELECT COUNT(*) FROM notice_board WHERE notice_content LIKE ?";
				sqlCase = true;
			}
		}
		
		int count = 0;
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			if(sqlCase) {
				pstmt.setString(1, "%"+cri.getSearchValue()+"%");
			}
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
	public NoticeVO noticeDetail(int notice_num) {
		String sql = "SELECT * FROM notice_board WHERE notice_num = ?";
		conn = DBCPUtil.getConnection();
		NoticeVO n = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
			rs = pstmt.executeQuery();
			rs.next();
			n = new NoticeVO();
			n.setNotice_num(rs.getInt(1));
			n.setNotice_category(rs.getNString(2));
			n.setNotice_author(rs.getString(3));
			n.setNotice_title(rs.getString(4));
			n.setNotice_content(rs.getString(5));
			n.setNotice_date(rs.getDate(6));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs,pstmt,conn);
		}
		return n;
	}

	@Override
	public boolean noticeUpdate(NoticeVO vo) {
		String sql = "UPDATE notice_board SET notice_category = ? , notice_title = ? , notice_content = ? WHERE notice_num = ?";
		int result = 0;
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getNotice_category());
			pstmt.setString(2,vo.getNotice_title());
			pstmt.setString(3,vo.getNotice_content());
			pstmt.setInt(4,vo.getNotice_num());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt,conn);
		}
		return result > 0;
	}

	@Override
	public boolean noticeDelete(int notice_num) {
		String sql = "DELETE FROM notice_board WHERE notice_num = ?";
		conn = DBCPUtil.getConnection();
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
			result = 0;
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt,conn);
		}
		return result > 0;
	}

}
