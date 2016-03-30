package kr.pe.temp.pension.vo;

public class TMember {

	private String name;
	private String tel;
	private String password;
	private String password1;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword1() {
		return password1;
	}
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	@Override
	public String toString() {
		return String.format("TMember [name=%s, tel=%s, password=%s]", name,
				tel, password);
	}


}
