package com.mercury.beans;

import java.util.List;

public class UserInfo {
	private String message;
	private List<User1> users;
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public List<User1> getUsers() {
		return users;
	}
	public void setUsers(List<User1> users) {
		this.users = users;
	}
}
