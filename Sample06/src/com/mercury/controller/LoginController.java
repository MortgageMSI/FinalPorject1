package com.mercury.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.User1;
import com.mercury.service.HelloService;

@Controller
public class LoginController {
	private HelloService hs;
	
	public HelloService getHs() {
		return hs;
	}

	public void setHs(HelloService hs) {
		this.hs = hs;
	}

	@RequestMapping(value="/login")
	public String login(ModelMap model) {

		return "login";
	}
	
//	@RequestMapping(value="/main")
//	public ModelAndView mainPage() {	
//		ModelAndView mav = new ModelAndView();
//		System.out.println("1");
//		mav.setViewName("inside");
//		mav.addObject("info", "data");
//		return mav;
//		
//	}
	
	@RequestMapping(value="/main")
	public String mainPage(ModelMap map) {	
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		User1 user1=hs.findByName(username);
		System.out.println(user1.getEmail());
		System.out.println(user1.getAuthority());
		map.addAttribute("username", username);
		map.addAttribute("userrole", user1.getAuthority());
		
		return "index";
	}
}
