package dao;

import java.util.List;

import vo.GuestBookVO;

public interface GuestBookDAO {
	/**
	 * @param startRow - 리스트 검색 시작 인덱스 번호
	 * @param pageNum - 검색할 게시물 개수
	 * @return - 페이징 처리된 게시물 목록
	 */
	List<GuestBookVO> pageList(int startRow, int pageNum);
	/**
	 * @return 전체 게시물 개수 - 행 게수
	 */
	int totalCount();
	
	/**
	 * @param guestBook - table에 삽입할 방명록 정보
	 * @return - 삽입된 행의 개수
	 */
	int insertGuestBook(GuestBookVO guestBook);
	
	/**
	 * @param id - 삭제할 게시물 번호
	 * @param password - 삭제할 게시물 비밀번호
	 * @return - 일치하는 행정보 삭제 결과 - 삭제된 행 개수
	 */
	int deleteGuestBook(String id, String password);
}
