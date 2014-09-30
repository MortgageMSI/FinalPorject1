package com.mercury.functions;

import java.text.DecimalFormat;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.mercury.functions.AnnualPayment;
import com.mercury.functions.MonthlyPayment;
import com.mercury.functions.ComplexReturnType;
import com.mercury.functions.MortgageCalculator;



public class toJson {
	@SuppressWarnings("unchecked")
	public static String convert(ComplexReturnType target){
		DecimalFormat df = new DecimalFormat("####0.00");
		//df.format(value)
		Map<String, Object> result = new LinkedHashMap<String, Object>();
		result.put("total", df.format(target.getTotalPayment()));
		
		List<AnnualPayment> yearSchedule = target.getYearSchedule();
		List<Map.Entry<String, MonthlyPayment>> monthlySchedule = target.getMonthlySchedule();
		
		JSONArray year = new JSONArray();
		for(AnnualPayment ap: yearSchedule){
			JSONObject tmp = new JSONObject();
			tmp.put("year_monthly", df.format(ap.getMonthlyPayment()));
			tmp.put("year_total", df.format(ap.getAnnualPayment()));
			year.add(tmp);
		}
		year.add(null);
		result.put("yearSchedule", year);
		
		JSONArray month = new JSONArray();
		for(Map.Entry<String, MonthlyPayment> entry: monthlySchedule){
			String month_year = entry.getKey();
			MonthlyPayment mp = entry.getValue();
			
			// create mp_object
			JSONObject mp_object = new JSONObject();
			mp_object.put("payment", df.format(mp.getPayment()));
			mp_object.put("remain" , df.format(mp.getRemain_principle()));
			
			// create the payment for this month
			JSONObject payment = new JSONObject();
			payment.put("id", mp.getPayment_number());
			payment.put("time", month_year);
			payment.put("payment", mp_object);
			
			month.add(payment);
			
		}
		month.add(null);
		result.put("monthlySchedule", month);
		return JSONValue.toJSONString(result);
	}
}
