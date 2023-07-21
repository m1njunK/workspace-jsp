package beans;

public class MemberVO {
	
	String name;
	String addr;
	String email;
	int age;
	
	public MemberVO() {}

	public MemberVO(String name, String addr, String email, int age) {
		this.name = name;
		this.addr = addr;
		this.email = email;
		this.age = age;
	}
	
	public MemberVO(String name, String addr, String email) {
		this.name = name;
		this.addr = addr;
		this.email = email;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "MemberVO [name=" + name + ", addr=" + addr + ", email=" + email + ", age=" + age + "]";
	}

}
