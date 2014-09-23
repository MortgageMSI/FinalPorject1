package com.mercury.dao;

import java.util.List;

import com.mercury.beans.User;
import com.mercury.beans.User1;

public interface HelloDao {
	public User1 findByName(String name);
	public void save(User1 user);
	public void update(User1 user);
	public void delete(User1 user);
	public List<User1> queryAll();
}
