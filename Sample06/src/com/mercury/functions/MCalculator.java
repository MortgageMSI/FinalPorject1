package com.mercury.functions;

import java.text.DecimalFormat;
import java.util.Random;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

public class MCalculator {
	//in put arm yearly rate say 4.2, return monthly rate between 0.00308 and 0.00392
	public static double getArmRate(double baseRate){ 
		Random r = new Random();
		int x = r.nextInt(10);
		double result;
		DecimalFormat df = new DecimalFormat("#.00000");
		if(x<=5){
			result=(double)x/10; 
			result =(baseRate+result)/1200;
			result= Double.parseDouble(df.format(result));
			return result;
			}
		else {
			result =(double)(x-5)/10;
			result =(baseRate-result)/1200;
			result = Double.parseDouble(df.format(result));
			return result;
			}
	}
	
	public static int getMonthlyPayment (double principal,double monthApr,int term){
		double dmonthly;
		dmonthly =(monthApr*principal)/(1-Math.pow((1+monthApr),-term));
		//System.out.println(dmonthly);
		return (int) Math.round(dmonthly);
	}
	
	//ARMCycle means arm years, negative value means prepaid month with extraMonthly dollars put in
	public JSONArray calculator(int principle,double APR,int term,int ARMCycle,int extraMonthly) throws JSONException{
		//initialize
		int total=0;
		int remaining= principle;
		double baseMonthRate=APR/1200;
		int monthlyPayment=getMonthlyPayment(principle,baseMonthRate,term);
		System.out.println(monthlyPayment);
		int mp1=0,mp2=0;  
		JSONArray json = new JSONArray();
		
		//for prepaid& extra money case
		if(ARMCycle<0 && extraMonthly>0){
			mp1 = monthlyPayment;
			mp2=monthlyPayment+extraMonthly;
		}
		
		//start term for loop 
		for (int i = 1; (i <=term && remaining>0); i++) {
			
			// in prepaid scenario
			if(ARMCycle<0 && i<=-ARMCycle)monthlyPayment =mp2;
			if(ARMCycle<0 && i>-ARMCycle) monthlyPayment =mp1;
			
			if(ARMCycle>0 && i>ARMCycle &&(i%12==1)){
				baseMonthRate = getArmRate(APR);
				monthlyPayment=getMonthlyPayment(principle,baseMonthRate,term);
				System.out.println(baseMonthRate);
			}
			total+=monthlyPayment;
			int interest =(int)Math.round(remaining*baseMonthRate);
			int monthlyPrincipal = monthlyPayment- interest;
			remaining= remaining-monthlyPrincipal;
			JSONObject obj = new JSONObject();
			if(i==term || remaining<=0){
				System.out.println(i+"	"+(monthlyPayment+remaining)+"	"+(monthlyPayment+remaining-interest)+"	"+interest+"	"+0);
				obj.put("month", i);
				obj.put("payment", monthlyPayment+remaining);
				obj.put("principle", monthlyPayment+remaining-interest);
				obj.put("interest", interest);
				obj.put("remaining", 0);
			}
			else{
				System.out.println(i+"	"+monthlyPayment+"	"+monthlyPrincipal+"	"+interest+"	"+remaining);
				obj.put("month", i);
				obj.put("payment", monthlyPayment);
				obj.put("principle", monthlyPrincipal);
				obj.put("interest", interest);
				obj.put("remaining", remaining);
			}	
			json.put(obj);
		}
		System.out.println("principle: "+principle+" years: "+term/12+" ARMyear: "+ARMCycle/12+" total is "+total);
		System.out.println("total interest paid "+(total-principle)+" over "+term/12+" years");
		//Summary sum=new Summary(principle, APR, term, ARMCycle,extraMonthly, total, total-principle);
		System.out.println(json.length());
		return json;
	}
	
}