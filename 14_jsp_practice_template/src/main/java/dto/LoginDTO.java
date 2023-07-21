package dto;

public class LoginDTO{
	
	private String id;
	private String pass;
	private boolean rememberMe;
	
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
	public boolean isRememberMe() {
		return rememberMe;
	}
	public void setRememberMe(boolean rememberMe) {
		this.rememberMe = rememberMe;
	}
	@Override
	public String toString() {
		return "LoginDTO [id=" + id + ", pass=" + pass + ", rememberMe=" + rememberMe + "]";
	}
	
}
