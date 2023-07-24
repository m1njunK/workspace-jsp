package repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.BoardVO;
import util.Criteria;
import util.DBCPUtil;

public class QNABoardDAOImpl implements QNABoardDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	@Override
	public int getListCount() {
		String sql = "SELECT count(*) FROM qna_board";
		conn = DBCPUtil.getConnection();
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs,pstmt,conn);
		}
		return result;
	}

	@Override
	public ArrayList<BoardVO> getBoardList(Criteria cri) {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		BoardVO vo;
		
		String sql = "SELECT * FROM qna_board ORDER BY qna_re_ref DESC, qna_re_seq ASC limit ?, ?";
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cri.getStartRow());
			pstmt.setInt(2, cri.getPerPageNum());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new BoardVO();
				vo.setQna_num(rs.getInt(1));
				vo.setQna_name(rs.getString(2));
				vo.setQna_title(rs.getString(3));
				vo.setQna_content(rs.getString(4));
				vo.setQna_re_ref(rs.getInt(5));
				vo.setQna_re_lev(rs.getInt(6));
				vo.setQna_re_seq(rs.getInt(7));
				vo.setQna_writer_num(rs.getInt(8));
				vo.setQna_readcount(rs.getInt(9));
				vo.setQna_delete(rs.getString(10));
				vo.setQna_date(rs.getDate(11));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs,pstmt,conn);
		}
		return list;
	}

	@Override
	public void boardWrite(BoardVO board) {
		String sql = "INSERT INTO qna_board (qna_name,qna_title,qna_content,qna_writer_num) VALUES(?,?,?,?)";
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getQna_name());
			pstmt.setString(2, board.getQna_title());
			pstmt.setString(3, board.getQna_content());
			pstmt.setInt(4, board.getQna_writer_num());
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt,conn);
		}
		sql = "UPDATE qna_board SET qna_re_ref = LAST_INSERT_ID() WHERE qna_num = LAST_INSERT_ID()";
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt,conn);
		}
	}

	@Override
	public BoardVO getBoardVO(int board_num) {
		BoardVO vo = new BoardVO();
		String sql = "SELECT * FROM qna_board WHERE qna_num = ?";
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			rs.next();
			vo.setQna_num(rs.getInt(1));
			vo.setQna_name(rs.getString(2));
			vo.setQna_title(rs.getString(3));
			vo.setQna_content(rs.getString(4));
			vo.setQna_re_ref(rs.getInt(5));
			vo.setQna_re_lev(rs.getInt(6));
			vo.setQna_re_seq(rs.getInt(7));
			vo.setQna_writer_num(rs.getInt(8));
			vo.setQna_readcount(rs.getInt(9));
			vo.setQna_delete(rs.getString(10));
			vo.setQna_date(rs.getDate(11));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs,pstmt,conn);
		}

		return vo;
	}

	@Override
	public void updateReadCount(int board_num) {
		String sql = "UPDATE qna_board SET qna_readcount = qna_readcount + 1 WHERE qna_num = ?";
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBCPUtil.close(pstmt,conn);
		}
	}

	@Override
	public void boardReplySubmit(BoardVO board) {
		
		String sql = "UPDATE qna_board SET qna_re_seq = qna_re_seq + 1 WHERE qna_re_ref = ? AND qna_re_seq > ?";
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getQna_re_ref()-1);
			pstmt.setInt(2, board.getQna_re_seq()-1);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt,conn);
		}
		sql = "INSERT INTO qna_board (qna_title, qna_content, qna_re_ref, qna_re_lev, qna_re_seq, qna_writer_num, qna_name) VALUES(?, ?, ?, ?, ?, ?, ?)";
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getQna_title());
			pstmt.setString(2, board.getQna_content());
			pstmt.setInt(3, board.getQna_re_ref());
			pstmt.setInt(4, board.getQna_re_lev());
			pstmt.setInt(5, board.getQna_re_seq());
			pstmt.setInt(6, board.getQna_writer_num());
			pstmt.setString(7, board.getQna_name());
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt,conn);
		}
	}

	@Override
	public void boardUpdate(BoardVO board) {
		String sql = "UPDATE qna_board SET qna_title = ?, qna_content = ? WHERE qna_num = ?";
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getQna_title());
			pstmt.setString(2, board.getQna_content());
			pstmt.setInt(3, board.getQna_num());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean boardDelete(int board_num, int qna_writer_num) {
		String sql = "UPDATE qna_board SET qna_delete = ? WHERE qna_num = ?";
		int result = 0;
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "Y");
			pstmt.setInt(2, board_num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt,conn);
		}
		return result > 0;
	}

}
