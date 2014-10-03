package com.mercury.controller;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jettison.json.JSONArray;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.Rate;
import com.mercury.beans.User1;
import com.mercury.beans.UserInfo;
import com.mercury.functions.ComplexReturnType;
import com.mercury.functions.MCalculator;
import com.mercury.functions.MortgageCalculator;
import com.mercury.functions.javaMail;
import com.mercury.functions.md5Converter;
import com.mercury.functions.randomGenerator;
import com.mercury.functions.toJson;
import com.mercury.service.HelloService;

@Controller
@SessionAttributes
public class HelloController {
	private HelloService hs;
	private String viewPage;
	private MortgageCalculator mc;
	
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
	
	public MortgageCalculator getMc() {
		return mc;
	}

	public void setMc(MortgageCalculator mc) {
		this.mc = mc;
	}
	
//	@RequestMapping(value="/signup", method = RequestMethod.GET)
//	public ModelAndView mainPage() {	
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("signup");
//		mav.addObject("title", "Sign Up, it's free and always will be");
//
//		return mav;
//	}
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public ModelAndView process(ModelMap model,
			HttpServletRequest request) throws NoSuchAlgorithmException {
		ModelAndView mav = new ModelAndView();
		//System.out.println(user.getUsername());
		
		String email = request.getParameter("j_email3");
		String username = request.getParameter("j_username3");
		String firstname = request.getParameter("j_firstname3");
		String lastname = request.getParameter("j_lastname3");
		String password = request.getParameter("j_password3");
		User1 user = new User1();
		user.setEmail(email);
		user.setUsername(username);
		user.setFirstname(firstname);
		user.setLastname(lastname);
		user.setPassword(password);
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
	
//	@RequestMapping(value="/deactivate", method = RequestMethod.GET)
//	public ModelAndView deactivate() {	
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("deactivate");
//		return mav;
//	}
	
	@RequestMapping(value="/deactivate", method=RequestMethod.POST)
	public ModelAndView deactivate(ModelMap model,
			HttpServletRequest request) throws NoSuchAlgorithmException {
		ModelAndView mav = new ModelAndView();
		String username = request.getParameter("j_dusername");
		String password = request.getParameter("j_dpassword");
		String email = request.getParameter("j_demail");
		User1 user = new User1();
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		//System.out.println(user.getUsername());
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
	
	
	
	///delete user
	@RequestMapping(value="/delete")
	@ResponseBody
	public String delete(HttpServletRequest request) throws NoSuchAlgorithmException {
		String email = request.getParameter("j_demail1");
		System.out.println(email);
		User1 user = new User1();
		user.setEmail(email);
		if(hs.delete(user))
		{
			return "true";
		}
			else
			{
				return "false";
			}
		//System.out.println(user.getUsername());

	}
	
	
	
	
//	@RequestMapping(value="/delete", method=RequestMethod.POST)
//	public ModelAndView delete(ModelMap model,
//			HttpServletRequest request) throws NoSuchAlgorithmException {
//		ModelAndView mav = new ModelAndView();
//		String email = request.getParameter("j_demail");
//		User1 user = new User1();
//		user.setEmail(email);
//		//System.out.println(user.getUsername());
//		if(hs.delete(user))
//		{	
//			//System.out.println("2");
//			//javaMail jm = new javaMail(user.getFirstname(),user.getLastname(),user.getEmail(),user.getUsername());
//			//jm.sendWelcomeEmail();
//			mav.setViewName("main");
//		}
//		else{
//			//System.out.println("3");
//			mav.setViewName("systemmessage");
//			mav.addObject("title", "Not able to find user");
//		}
//		return mav;
//	}
	
//	@RequestMapping(value="/reactivate", method = RequestMethod.GET)
//	public ModelAndView reactivate() {	
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("reactivate");
//		return mav;
//	}
	
	@RequestMapping(value="/reactivate", method=RequestMethod.POST)
	public ModelAndView reactivate(ModelMap model,
			HttpServletRequest request) throws NoSuchAlgorithmException {
		ModelAndView mav = new ModelAndView();
		String username = request.getParameter("j_username2");
		String password = request.getParameter("j_password2");
		String email = request.getParameter("j_email2");
		
		User1 user = new User1();
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		System.out.println(username);
		System.out.println(password);
		System.out.println(email);
		
		if(hs.reactivate(user))
		{	
			//System.out.println("2");
			//javaMail jm = new javaMail(user.getFirstname(),user.getLastname(),user.getEmail(),user.getUsername());
			//jm.sendWelcomeEmail();
			mav.setViewName("systemmessage");
			mav.addObject("title", "Welcome back!");
		}
		else{
			//System.out.println("3");
			mav.setViewName("systemmessage");
			mav.addObject("title", "Sorry, cannot find a match");
		}
		return mav;
	}
	
	
	
	
	//send username if forget
//	@RequestMapping(value="/rusername", method = RequestMethod.GET)
//	public ModelAndView rusername() {	
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("rusername");
//		return mav;
//	}
	
	@RequestMapping(value="/rusername")
	public ModelAndView rusername(
			HttpServletRequest request) throws NoSuchAlgorithmException {
		ModelAndView mav = new ModelAndView();
		String email = request.getParameter("j_email");
		System.out.println("3");
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
//	@RequestMapping(value="/forgetpassword", method = RequestMethod.GET)
//	public ModelAndView forgetpassword() {	
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("forgetpassword");
//		return mav;
//	}
	
	@RequestMapping(value="/forgetpassword")
	public ModelAndView forgetpassword(HttpServletRequest request) throws NoSuchAlgorithmException {
		ModelAndView mav = new ModelAndView();
		String email = request.getParameter("j_email1");
		String username = request.getParameter("j_username1");
		String firstname = request.getParameter("j_firstname1");
		String lastname = request.getParameter("j_lastname1");
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
	
	
	@RequestMapping(value="/cpassword", method=RequestMethod.POST)
	public ModelAndView cpassword(ModelMap model,
			HttpServletRequest request) throws NoSuchAlgorithmException {
		ModelAndView mav = new ModelAndView();
		String opassword = request.getParameter("j_opassword");
		String npassword = request.getParameter("j_npassword");
		opassword =  md5Converter.convert(opassword);
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println(user.getUsername());
		
		if(hs.findUserByUsername(user.getUsername(), opassword))
		{
			
			
			User1 user1 = hs.findByName(user.getUsername());
			String md5 = md5Converter.convert(npassword);
			user1.setPassword(md5);
			hs.update(user1);
			mav.setViewName("systemmessage");
			mav.addObject("title", "New password set");
		}
		else{
			mav.setViewName("systemmessage");
			mav.addObject("title", "We cannot find a match in our database");
		}
		return mav;
	}
	
	
	
//	@RequestMapping(value="/calculate", method=RequestMethod.POST)
//	@ResponseBody
//	public String getInput(HttpServletRequest request){
//		int loan_amount = Integer.parseInt(request.getParameter("loan_amount"));
//		double down_payment = Double.parseDouble(request.getParameter("down_payment"));
//		int loan_term = Integer.parseInt(request.getParameter("loanTerm"));
//		String loan_type = request.getParameter("loanType");
//		if(loan_type==null)
//			loan_type="Fixed";
//		double expected_adjustment = 0;
//			   expected_adjustment = Double.parseDouble(request.getParameter("expected_adjustment"));
//	    double rate_gap = 0;
//	    	   rate_gap = Double.parseDouble(request.getParameter("rate_gap"));
//		ComplexReturnType mb = parseAndCalculate(loan_amount, down_payment, loan_term, loan_type, expected_adjustment, rate_gap);
//		return toJson.convert(mb);
//	}
	
	@RequestMapping(value="/calculate", method=RequestMethod.POST)
	@ResponseBody
	public String getInput1(HttpServletRequest request) throws Exception{
		int loan_amount = Integer.parseInt(request.getParameter("loan_amount"));
		double down_payment = Double.parseDouble(request.getParameter("down_payment"));
		int loan_term = Integer.parseInt(request.getParameter("loanTerm"));
		//String loan_type = request.getParameter("loanType");

		System.out.println(request.getParameter("loan_extra").getClass().getName());
		int loan_extra1;
		if(request.getParameter("loan_extra")==null){
		 loan_extra1=0;
		}
		else{
		loan_extra1=Integer.parseInt(request.getParameter("loan_extra"));
		}
		System.out.println("loan_extra1"+loan_extra1);
		int loan_early=-(Integer.parseInt(request.getParameter("loan_early")));
		System.out.println("loan_early"+loan_early);

//		if(loan_type==null)
//			loan_type="Fixed";
//		double expected_adjustment = 0;
//			   expected_adjustment = Double.parseDouble(request.getParameter("expected_adjustment"));
//	    double rate_gap = 0;
//	    	   rate_gap = Double.parseDouble(request.getParameter("rate_gap"));
//	    	   ComplexReturnType mb = parseAndCalculate(loan_amount, down_payment, loan_term, loan_type, expected_adjustment, rate_gap);
//	    	   System.out.println(toJson.convert(mb));
//	    	   
			int loan =(int) (loan_amount-loan_amount*down_payment);
	    	   //////////////
	    	   MCalculator c = new MCalculator();
	    	   Rate r = hs.getRate(loan_term);
	    	   double apr = r.getRate();
	    	   ////////////////////
	    	   
	    	   //test all variables
	    	   System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	    	   System.out.println(loan+" "+apr+" "+loan_term*12+" "+loan_early+" "+loan_extra1);
	    	   JSONArray json=c.calculator(loan,apr, loan_term*12,loan_early,loan_extra1);
	    	   
	    	   //String abc = "{\"firstone\":"+json.toString()+"}";
	    	   System.out.println(json.toString());
	   		return json.toString();

	}
	
	
	@RequestMapping(value="/checkExist")
	@ResponseBody
	public String checkExist(HttpServletRequest request){
		String username = request.getParameter("username");
		if (hs.checkUsernameValidation(username))
			return "exist";
		else
			return "no";
	}
	
	@RequestMapping(value="/checkEmailExist")
	@ResponseBody
	public String checkEmailExist(HttpServletRequest request){
		String email = request.getParameter("email");
		if (hs.checkEmailValidation(email))
			return "exist";
		else
			return "no";
	}
	
	
	
	
	
	private ComplexReturnType parseAndCalculate(int loan_amount, double down_payment, int loan_term, 
											String loan_type, double expected_adjustment, double rate_gap){
		
		int principle = (int)(loan_amount * (1-down_payment));
		//loan_term;
		int num_of_arms = loan_term;
		if(!loan_type.equals("Fixed"))
			num_of_arms = Integer.parseInt(loan_type.substring(0, 1));
		
		//Rate rate = hs.getRate(loan_term/10);
		Rate rate = hs.getRate(loan_term);
		double start_rate = rate.getRate()/100;
		
//		System.out.println("INPUT PARAMETERS:");
//		System.out.println("start_rate:"+start_rate);
//		System.out.println("principle:"+principle);
//		System.out.println("loan_term:"+loan_term);
//		System.out.println("num_of_arms:"+num_of_arms);
//		System.out.println("expected_adjustment:"+expected_adjustment);
//		System.out.println("rate_gap:"+rate_gap);
		
		ComplexReturnType mb = mc.getPayment(start_rate, principle, loan_term, num_of_arms, expected_adjustment/100, rate_gap/100);
		return mb;
	}

}
