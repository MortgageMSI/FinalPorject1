package com.mercury.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.mercury.beans.User;
import com.mercury.beans.User1;
import com.mercury.dao.HelloDao;

public class HelloDaoImpl implements HelloDao {
	private HibernateTemplate template;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		template = new HibernateTemplate(sessionFactory);
	}
	
	@Override
	public User1 findByName(String name) {
		// TODO Auto-generated method stub
		return (User1)template.load(User1.class, name);
	}

	@Override
	public void save(User1 user) {
		// TODO Auto-generated method stub
		template.save(user);
	}

	@Override
	public void update(User1 user) {
		// TODO Auto-generated method stub
		template.update(user);
	}

	@Override
	public void delete(User1 user) {
		// TODO Auto-generated method stub
		template.delete(user);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User1> queryAll() {
		// TODO Auto-generated method stub
		String hql = "from User1";
		return template.find(hql);
	}

}
