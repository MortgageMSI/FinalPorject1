package com.mercury.beans;

public class User1 {
	private int userid;
	private String username;
	private String password;
	private String email;
	private	String firstname;
	private String lastname;
	private String authority="ROLE_USER";
	private int enabled=1;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getAuthority() {
		return authority;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	

}
