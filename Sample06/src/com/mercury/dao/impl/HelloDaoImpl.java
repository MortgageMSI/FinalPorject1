package com.mercury.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.mercury.beans.Rate;
import com.mercury.beans.User1;
import com.mercury.dao.HelloDao;

public class HelloDaoImpl implements HelloDao {
	private HibernateTemplate template;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		template = new HibernateTemplate(sessionFactory);
	}
	
	@Override
	public Boolean nameIsExist(String str){
		if ((template.findByCriteria(DetachedCriteria.forClass(User1.class).add(Restrictions.eq("username", str))).size()!=0)){
				return true;
			}
			else 
				return false;
		}
	
	@Override
	public Boolean emailIsExist(String str){
		if ((template.findByCriteria(DetachedCriteria.forClass(User1.class).add(Restrictions.eq("email", str))).size()!=0)){
				return true;
			}
			else 
				return false;
		}


	
	@Override
	public User1 findByName(String name) {
		// TODO Auto-generated method stub
		return (User1)template.load(User1.class, name);
	}
	
	
	@Override
	public User1 findByUsername(String username) {
		// TODO Auto-generated method stub
		User1 u = null;
			u = (User1)template.findByCriteria(DetachedCriteria.forClass(User1.class).add(Restrictions.eq("username", username))).get(0);
		return u;
	}
	
	@Override
	public User1 findUserByEmail(String email) {
		// TODO Auto-generated method stub
		User1 u = null;
			u = (User1)template.findByCriteria(DetachedCriteria.forClass(User1.class).add(Restrictions.eq("email", email))).get(0);
		return u;
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
	public void updateRate(Rate rate) {
		// TODO Auto-generated method stub
		template.update(rate);
	}

	@Override
	public void delete(User1 user) {
		// TODO Auto-generated method stub
		template.delete(user);
	}
	
	@Override
	public Boolean findByUsernamepassword(String username, String password) {
		// TODO Auto-generated method stub
		if ((template.findByCriteria(DetachedCriteria.forClass(User1.class).add(Restrictions.eq("username", username)).add(Restrictions.eq("password", password))).size()!=0)){
			return true;
		}
		else
		{
		return false;
		}
	}
	
	@Override
	public Boolean findByUsernamepasswordemail(String username, String password,String email) {
		// TODO Auto-generated method stub
		if ((template.findByCriteria(DetachedCriteria.forClass(User1.class).add(Restrictions.eq("username", username)).add(Restrictions.eq("password", password)).add(Restrictions.eq("username", username)).add(Restrictions.eq("email", email))).size()!=0)){
			return true;
		}
		return false;
	}
	
	@Override
	public Boolean findByAll(String username, String firstname, String lastname, String email) {
		// TODO Auto-generated method stub
		System.out.println(username);
		if ((template.findByCriteria(DetachedCriteria.forClass(User1.class).add(Restrictions.eq("lastname", lastname)).add(Restrictions.eq("firstname", firstname)).add(Restrictions.eq("username", username)).add(Restrictions.eq("email", email))).size()!=0)){
			return true;
		}
		return false;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<User1> queryAll() {
		// TODO Auto-generated method stub
		String hql = "from User1";
		return template.find(hql);
	}
	
	
	
	
	@Override
	public Rate getRate(int term) {
		// TODO Auto-generated method stub
		return (Rate)template.findByCriteria(DetachedCriteria.forClass(Rate.class).add(Restrictions.eq("term", term))).get(0);
	}


}
