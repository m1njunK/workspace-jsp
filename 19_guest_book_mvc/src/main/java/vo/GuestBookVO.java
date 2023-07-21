package vo;
/**
 * 방명록 행 정보를 저장할 class
 */
public class GuestBookVO {
	
	private int id;				// 게시글 번호
	private String guestName;	// 작성자
	private String password;	// 비밀번호
	private String message;
	
	public GuestBookVO () {}

	// 글 작성용
	public GuestBookVO(String guestName, String password, String message) {
		this.guestName = guestName;
		this.password = password;
		this.message = message;
	}
	
	// 방명록 리스트용 생성자
	public GuestBookVO(int id, String guestName, String password, String message) {
		this.id = id;
		this.guestName = guestName;
		this.password = password;
		this.message = message;
	}

	// getter , setter, toString
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGuestName() {
		return guestName;
	}

	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "GuestBookVO [id=" + id + ", guestName=" + guestName + ", password=" + password + ", message=" + message
				+ "]";
	}
		
}



