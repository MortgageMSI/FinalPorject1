package com.mercury.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "login";
	}
	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public ModelAndView mainPage() {	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hello");
		mav.addObject("title", "Sign Up, it's free and always will be");
		return mav;
	}
}