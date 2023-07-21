package service;

import jakarta.servlet.http.HttpServletRequest;

public interface GuestBookService {
	/** 
	 * @param request
	 * request로 요청이 전달될 때 사용자가 전달한 데이터를 이용하여
	 * 리스트 페이지에서 출력에 필요한 정보를 생성, 저장
	 * 방명록 목록 및 페이징 처리에 필요한 정보
	 */
	void guestBookList(HttpServletRequest request);
	/**
	 * @param request
	 * 방명록 작성에 필요한 parameter를 전달 받아
	 * database에 삽입 후 결과 출력에 필요한 데이터를 전달
	 */
	void writeBook(HttpServletRequest request);
	/**
	 * @param request
	 * 방명록 삭제에 필요한 id, password를 전달받아
	 * database에 삭제 처리 한 후 결과 출력에 필요한 데이터를 전달
	 */
	void deleteBook(HttpServletRequest request);
}
