package test;

public class MemberVO {
	private int num;
	private String id;
	private String pass;
	// getter setter toString
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	@Override
	public String toString() {
		return "MemberVO [num=" + num + ", id=" + id + ", pass=" + pass + "]";
	}

}
