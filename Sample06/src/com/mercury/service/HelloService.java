package com.mercury.service;

import com.mercury.beans.User;
import com.mercury.beans.User1;
import com.mercury.beans.UserInfo;
import com.mercury.dao.HelloDao;

public class HelloService {
	private HelloDao hd;
		
	public HelloDao getHd() {
		return hd;
	}
	public void setHd(HelloDao hd) {
		this.hd = hd;
	}

	
	public UserInfo process(User1 user) {
		hd.save(user);
		UserInfo userInfo = new UserInfo();
		userInfo.setMessage("Hello " + user.getUsername() + ", you are officially a member!");
		userInfo.setUsers(hd.queryAll());
		return userInfo;
	}
	
}
