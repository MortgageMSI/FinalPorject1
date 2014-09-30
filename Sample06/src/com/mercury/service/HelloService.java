package com.mercury.service;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collection;

import org.json.simple.JSONArray;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mercury.beans.Rate;
import com.mercury.beans.User1;
import com.mercury.beans.UserInfo;
import com.mercury.dao.HelloDao;
import com.mercury.functions.md5Converter;
import com.mercury.logic.MCalculator;


@Service
@Transactional
public class HelloService implements UserDetailsService {
	private HelloDao hd;
		
	public HelloDao getHd() {
		return hd;
	}
	public void setHd(HelloDao hd) {
		this.hd = hd;
	}

	public boolean deactivate(User1 user) throws NoSuchAlgorithmException{
		String md5 = md5Converter.convert(user.getPassword());
		user.setPassword(md5);
		if(!hd.findByUsernamepassword(user.getUsername(), user.getPassword()))
		{
			//System.out.print("exist");
			return false;
		}
		else{
			//System.out.print(user.getUsername());
			User1 u = hd.findByUsername(user.getUsername());
			u.setEnabled(0);
			hd.update(u);
			//System.out.println("changed");
			return true;
		}
	}
	
	public boolean reactivate(User1 user) throws NoSuchAlgorithmException{
		String md5 = md5Converter.convert(user.getPassword());
		user.setPassword(md5);
		if(!hd.findByUsernamepasswordemail(user.getUsername(), user.getPassword(),user.getEmail()))
		{
			//System.out.print("exist");
			return false;
		}
		else{
			//System.out.print(user.getUsername());
			User1 u = hd.findByUsername(user.getUsername());
			u.setEnabled(1);
			hd.update(u);
			//System.out.println("changed");
			return true;
		}
	}
	
	public boolean hasUser(User1 user) throws NoSuchAlgorithmException{
		if(!hd.findByAll(user.getUsername(), user.getFirstname(),user.getLastname(),user.getEmail()))
		{
			//System.out.print("exist");
			return false;
		}
		else{

			return true;
		}
	}
	
	public boolean hasUserpassword(User1 user) throws NoSuchAlgorithmException{
		if(!hd.findByUsernamepasswordemail(user.getUsername(), user.getPassword(),user.getEmail()))
		{
			//System.out.print("exist");
			return false;
		}
		else{

			return true;
		}
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
	public void update(User1 user) throws NoSuchAlgorithmException{
			hd.update(user);
	}
	
	public boolean sendUsername(User1 user) {
		if(hd.emailIsExist(user.getEmail())){
			return true;
		}
		else
		{
		return false;
		}
	}
	
	public User1 findUserByEmail(String email) {
		return hd.findUserByEmail(email);
	}
	
	public UserInfo process(User1 user) {
		UserInfo userInfo = new UserInfo();
		userInfo.setMessage("Hello " + user.getUsername() + ", you are officially a member!");
		userInfo.setUser(hd.findByUsername(user.getUsername()));
		return userInfo;
	}
	
	public Rate getRate(int rid){
		return hd.getRate(rid);
	}
	

	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserDetails user = null;
		try {
			User1 user1 = hd.findByUsername(username);	
			boolean enabled;
			if(user1.getEnabled()==1)
				enabled = true;
			else
				enabled = false;
			Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
			authorities.add(new SimpleGrantedAuthority(user1.getAuthority()));
			user = new User(
						user1.getUsername(),
						user1.getPassword(),
						enabled,
						true,
						true,
						true,
						authorities 
					);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UsernameNotFoundException("Error in retrieving user");
		}
		return user;
	}
	
}
