package util;
/**
 * 페이징 처리된 게시물 목록을 검색 할 수 있도록
 * 검색에 필요한 정보 기준을 저장하는 class
 */
public class Criteria {

	private int page;			// 사용자가 요청한 페이지 번호
	private int perPageNum; 	// 한 페이지에 보여줄 게시글 개수
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int page, int perPageNum) {
		setPage(page);
		setPerPageNum(perPageNum);
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	// 게시글 검색 시작 인덱스 번호
	public int getStartRow() {
		return (this.page - 1) * perPageNum;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}
