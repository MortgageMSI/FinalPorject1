package com.mercury.controller;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.User1;
import com.mercury.beans.UserInfo;
import com.mercury.functions.javaMail;
import com.mercury.functions.md5Converter;
import com.mercury.functions.randomGenerator;
import com.mercury.service.HelloService;

@Controller
@SessionAttributes
public class HelloController {
	private HelloService hs;
	private String viewPage;
	
	public HelloService getHs() {
		return hs;
	}
	public void setHs(HelloService hs) {
		this.hs = hs;
	}
	public String getViewPage() {
		return viewPage;
	}
	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}
	
	@RequestMapping(value="/signup", method = RequestMethod.GET)
	public ModelAndView mainPage() {	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("signup");
		mav.addObject("title", "Sign Up, it's free and always will be");

		return mav;
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public ModelAndView process(ModelMap model, User1 user,
			HttpServletRequest request) throws NoSuchAlgorithmException {
		ModelAndView mav = new ModelAndView();
		//System.out.println(user.getUsername());
		if(hs.register(user))
		{	
			//System.out.println("2");
			UserInfo userInfo = hs.process(user);
			javaMail jm = new javaMail(user.getFirstname(),user.getLastname(),user.getEmail(),user.getUsername());
			jm.sendWelcomeEmail();
			mav.setViewName(viewPage);
			mav.addObject("userInfo", userInfo);
		}
		else{
			//System.out.println("3");
			mav.setViewName("systemmessage");
			mav.addObject("title", "Register failed, user name or email might already exist");
		}
		return mav;
	}
	
	@RequestMapping(value="/registererrorpage")
	public String error() {
		return "registererrorpage";
	}
	
	@RequestMapping(value="/deactivate", method = RequestMethod.GET)
	public ModelAndView deactivate() {	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("deactivate");
		return mav;
	}
	
	@RequestMapping(value="/deactivate", method=RequestMethod.POST)
	public ModelAndView deactivate(ModelMap model,
			HttpServletRequest request) throws NoSuchAlgorithmException {
		ModelAndView mav = new ModelAndView();
		String username = request.getParameter("j_username");
		String password = request.getParameter("j_password");
		User1 user = new User1();
		user.setUsername(username);
		user.setPassword(password);
		System.out.println(user.getUsername());
		if(hs.deactivate(user))
		{	
			//System.out.println("2");
			//javaMail jm = new javaMail(user.getFirstname(),user.getLastname(),user.getEmail(),user.getUsername());
			//jm.sendWelcomeEmail();
			mav.setViewName("login");
		}
		else{
			//System.out.println("3");
			mav.setViewName("systemmessage");
			mav.addObject("title", "Deactivate failed, user name or email might be wrong");
		}
		return mav;
	}
	
	@RequestMapping(value="/reactivate", method = RequestMethod.GET)
	public ModelAndView reactivate() {	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reactivate");
		return mav;
	}
	
	@RequestMapping(value="/reactivate", method=RequestMethod.POST)
	public ModelAndView reactivate(ModelMap model,
			HttpServletRequest request) throws NoSuchAlgorithmException {
		ModelAndView mav = new ModelAndView();
		String username = request.getParameter("j_username");
		String password = request.getParameter("j_password");
		String email = request.getParameter("j_email");
		User1 user = new User1();
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		System.out.println(user.getUsername());
		if(hs.reactivate(user))
		{	
			//System.out.println("2");
			//javaMail jm = new javaMail(user.getFirstname(),user.getLastname(),user.getEmail(),user.getUsername());
			//jm.sendWelcomeEmail();
			mav.setViewName("login");
		}
		else{
			//System.out.println("3");
			mav.setViewName("systemmessage");
			mav.addObject("title", "Welcome back!");
		}
		return mav;
	}
	
	
	
	
	//send username if forget
	@RequestMapping(value="/rusername", method = RequestMethod.GET)
	public ModelAndView rusername() {	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("rusername");
		return mav;
	}
	
	@RequestMapping(value="/rusername", method=RequestMethod.POST)
	public ModelAndView rusername(ModelMap model,
			HttpServletRequest request) throws NoSuchAlgorithmException {
		ModelAndView mav = new ModelAndView();
		String email = request.getParameter("j_email");
		
		User1 user = new User1();
		user.setEmail(email);
		System.out.println(email);
		if(hs.sendUsername(user))
		{	
			User1 u = hs.findUserByEmail(email);
			javaMail jm = new javaMail(u.getFirstname(),u.getLastname(),u.getEmail(),u.getUsername());
			jm.sendUsernameEmail();
			mav.setViewName("systemmessage");
			mav.addObject("title", "Your username has been sent to your email");
		}
		else{
			//System.out.println("3");
			mav.setViewName("systemmessage");
			mav.addObject("title", "Your email address is wrong");
		}
		return mav;
	}
	
	//forget password, send new password
	@RequestMapping(value="/forgetpassword", method = RequestMethod.GET)
	public ModelAndView forgetpassword() {	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("forgetpassword");
		return mav;
	}
	
	@RequestMapping(value="/forgetpassword", method=RequestMethod.POST)
	public ModelAndView forgetpassword(ModelMap model,
			HttpServletRequest request) throws NoSuchAlgorithmException {
		ModelAndView mav = new ModelAndView();
		String email = request.getParameter("j_email");
		String username = request.getParameter("j_username");
		String firstname = request.getParameter("j_firstname");
		String lastname = request.getParameter("j_lastname");
		User1 user = new User1();
		user.setEmail(email);
		user.setUsername(username);
		user.setFirstname(firstname);
		user.setLastname(lastname);
		//System.out.println(email);
		if(hs.hasUser(user))
		{	
			User1 u = hs.findUserByEmail(email);
			String passcode = randomGenerator.randomString(8);
			String md5 = md5Converter.convert(passcode);
			u.setPassword(md5);
			hs.update(u);
			javaMail jm = new javaMail(u.getFirstname(),u.getLastname(),u.getEmail(),u.getUsername());
			jm.sendPasswordEmail(passcode);
			mav.setViewName("systemmessage");
			mav.addObject("title", "Your new temp password  has been sent to your email");
		}
		else{
			//System.out.println("3");
			mav.setViewName("systemmessage");
			mav.addObject("title", "We cannot find a match in our database");
		}
		return mav;
	}
	
	//change new password
	@RequestMapping(value="/cpassword", method = RequestMethod.GET)
	public ModelAndView cpassword() {	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cpassword");
		return mav;
	}
	
	@RequestMapping(value="/cpassword", method=RequestMethod.POST)
	public ModelAndView cpassword(ModelMap model,
			HttpServletRequest request) throws NoSuchAlgorithmException {
		ModelAndView mav = new ModelAndView();
		String email = request.getParameter("j_email");
		String username = request.getParameter("j_name");
		String password = request.getParameter("j_opassword");
		String npassword = request.getParameter("j_npassword");
		User1 user = new User1();
		user.setEmail(email);
		user.setUsername(username);
		user.setPassword(md5Converter.convert(password));
		//System.out.println(username);
		//System.out.println(password);
		if(hs.hasUserpassword(user))
		{	
			User1 u = hs.findUserByEmail(email);
			String md5 = md5Converter.convert(npassword);
			u.setPassword(md5);
			hs.update(u);
			mav.setViewName("systemmessage");
			mav.addObject("title", "New password set");
		}
		else{
			//System.out.println("3");
			mav.setViewName("systemmessage");
			mav.addObject("title", "We cannot find a match in our database");
		}
		return mav;
	}

}
