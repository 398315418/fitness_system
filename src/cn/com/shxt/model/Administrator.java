package cn.com.shxt.model;
	/**
	 * 
	 * @描述:
	 * @作者:
	 * @版本:1.0
	 * @版权所有:
	 * @时间 2015-9-24 下午09:07:18
	 */
public class Administrator {
	public String id;
	public String account;
	private String password;
	private String role;
	private String state;
	private String ymoney;
	private String bianhao;
	private int age;
	private String photo;
	public String getPhoto() {
		return photo;
	}
	public int getAge() {
		
		return age;
	}
	public String getBianhao() {
		return bianhao;
	}
	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
	}
	public String getYmoney() {
		return ymoney;
	}
	public void setYmoney(String ymoney) {
		this.ymoney = ymoney;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	
	
}
