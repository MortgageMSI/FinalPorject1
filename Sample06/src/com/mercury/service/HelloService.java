package com.mercury.service;

import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mercury.beans.User1;
import com.mercury.beans.UserInfo;
import com.mercury.dao.HelloDao;
import com.mercury.functions.md5Converter;

@Service
@Transactional
public class HelloService {
	private HelloDao hd;
		
	public HelloDao getHd() {
		return hd;
	}
	public void setHd(HelloDao hd) {
		this.hd = hd;
	}

	
	public boolean register(User1 user) throws NoSuchAlgorithmException{
		if(hd.nameIsExist(user.getUsername()) || hd.emailIsExist(user.getEmail()))
		{
			//System.out.print("exist");
			return false;
		}
		else{
			//System.out.print(user.getUsername());
			String md5 = md5Converter.convert(user.getPassword());
			user.setPassword(md5);
			hd.save(user);
			return true;
		}
	}
	
	public UserInfo process(User1 user) {
		UserInfo userInfo = new UserInfo();
		userInfo.setMessage("Hello " + user.getUsername() + ", you are officially a member!");
		userInfo.setUser(hd.findByUsername(user.getUsername()));
		return userInfo;
	}
	
}
