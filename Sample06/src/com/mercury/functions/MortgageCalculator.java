package com.mercury.functions;

import java.util.*;
import java.util.Map.Entry;

import org.springframework.cache.annotation.Cacheable;

public class MortgageCalculator {
	
	// rate should divide by 100 before use
	//@Cacheable(value="getPayment")
	public ComplexReturnType getPayment(double rate, int principle, int years, int arm_year, double expected_rate, double gap){
		// start initialization
		System.out.println("Start Calculation. Not using cache.");
		ComplexReturnType result = new ComplexReturnType();
		List<Double> rates = new ArrayList<Double>();
		double rate_gap = 0;
		boolean isValid = true;
		if(gap<rate){
			rate_gap = rate;
			isValid = false;
		} else {
			rate_gap = gap;
			isValid = true;
		}
		//System.out.println(rate_gap);
		int i=0;
		for(; i<arm_year; i++){
			rates.add(rate);
		}
		
		if(isValid){
			double tempRate = rate;
			double temp;
			Random generator = new Random(100);
			for(; i<=years; i++){
				temp = (Math.random()*expected_rate); // [0,x]/100,  [0, x%]
				//System.out.println(temp);
				int r = generator.nextInt(100)%3;
				if(r==0)
					temp = temp*(-1);
				tempRate += temp;
				if (tempRate>rate_gap)
					tempRate = rate_gap;
				rates.add(tempRate);
			}
		}
		else{
			for(; i<=years; i++){
				rates.add(rate);
			}
		}
		// finish initialization
		/*
		int k=30;
		for(double s: rates){
			System.out.println( (30-k--)+" "+s );
		}*/
		
		double remainPrinciple = principle;
		Calendar cal = Calendar.getInstance();
		int start_month = cal.get(Calendar.MONTH);
		int start_year = cal.get(Calendar.YEAR);
		
		// Calculate yearSchedule
		List<AnnualPayment> yearSchedule = new ArrayList<AnnualPayment>();
		for(int year=0; year<years; year++){
			remainPrinciple = getRemain(year*12, rates.get(year), principle, years);
			double monthly_payment = equation(remainPrinciple, (years-year)*12, rates.get(year));
			AnnualPayment ap = new AnnualPayment();
			ap.setMonthlyPayment(monthly_payment);
			double annual_payment = 0;
			if(year==0)
				annual_payment = monthly_payment * (11-start_month);
			else if(year==years-1)
				annual_payment = monthly_payment * (start_month+1);
			else if(year==arm_year)
				annual_payment = monthly_payment * (12-start_month) + equation(getRemain((year-1)*12, rates.get(year-1), principle, years), (years-year+1)*12, rates.get(year-1))*(start_month);
			else
				annual_payment = monthly_payment *12;
			ap.setAnnualPayment(annual_payment);
			yearSchedule.add(ap);
		}
		// Finish Calculating yearSchedule
		
		// Print yearSchedule
//		System.out.println("Year schdule");
//		int m = years;
//		for(double s: yearSchedule){
//			System.out.println((years-m--)+" "+s);
//		}
		// Finish printing yearSchedule
		
		// Calculate monthlySchedule
		double total = 0;
		Map<String, MonthlyPayment> monthlySchedule = new HashMap<String, MonthlyPayment>();
		double month_remain = 0;
		int month;
		for(month=0; month<years*12;month++){
			int year_num = month/12;
			//System.out.println("year_num:"+year_num);
			month_remain = getRemain(month, rates.get(year_num), principle, years);
			double payment = equation(month_remain, years*12-month, rates.get(year_num));
			MonthlyPayment mp = new MonthlyPayment(month, payment, month_remain);//yearSchedule.get(year_num)
			total += payment;
			String this_month = String.format("%02d", ((month+start_month)%12+1));
			String this_full = this_month+"/"+(start_year+((month+start_month)/12))+"";
			monthlySchedule.put(this_full, mp);
		}
		String this_month = String.format("%02d", ((month+start_month)%12+1));
		String this_full = this_month+"/"+(start_year+((month+start_month)/12))+"";
		monthlySchedule.put(this_full, new MonthlyPayment(month, month_remain, 0));
		// Finish Calculating monthlySchedule
		
		// Sort monthlySchedule
		List<Map.Entry<String, MonthlyPayment>> sorted_monthlySchedule = new ArrayList<Map.Entry<String,MonthlyPayment>>(monthlySchedule.entrySet());
		Collections.sort(sorted_monthlySchedule, new Comparator<Map.Entry<String, MonthlyPayment>>(){

			@Override
			public int compare(Entry<String, MonthlyPayment> o1,
					Entry<String, MonthlyPayment> o2) {
				// TODO Auto-generated method stub
				return (int)(o1.getValue().getPayment_number()-o2.getValue().getPayment_number());
			}

			
		});
		// Finish sorting monthlySchedule
		
		// Print monthlySchedule
//		Iterator<Map.Entry<String, MonthlyPayment>> it = sorted_monthlySchedule.iterator();
//		while(it.hasNext()){
//			Map.Entry<String, MonthlyPayment> a = it.next();
//			System.out.println(a.getKey()+" "+a.getValue());
//		}
		// Finish printing monthlySchedule
		
		result.setMonthlySchedule(sorted_monthlySchedule);
		result.setYearSchedule(yearSchedule);
		result.setTotalPayment(total);
		return result;
	}
	
	//@Cacheable(value="equation")
	public double equation(double currentPrinciple, int remain_period, double next_rate){
		//System.out.println("Doing equation, no cache found");
		double monthly_payment = 0;
		double num = Math.pow(1+next_rate/12, remain_period);
		monthly_payment = currentPrinciple * num * next_rate/12 / (num - 1);
		return monthly_payment;
	}
	
	// get remain balance after passed_month
	//@Cacheable(value="getRemain")
	public double getRemain(int passed_month, double curRate, double principle, int years){
		//System.out.println("Doing getRemain, no cache found");
		double num1 = Math.pow(1+curRate/12, years*12);  // total
		double num2 = Math.pow(1+curRate/12, passed_month);		// passed
		return principle * (num1-num2)/(num1-1);
	}
	
}
