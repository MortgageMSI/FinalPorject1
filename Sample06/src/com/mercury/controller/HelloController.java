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
			mav.setViewName("registererrorpage");
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
			mav.setViewName("registererrorpage");
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
			mav.setViewName("registererrorpage");
		}
		return mav;
	}

}
