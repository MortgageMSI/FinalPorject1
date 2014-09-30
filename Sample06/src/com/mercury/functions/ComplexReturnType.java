package com.mercury.functions;

import java.util.List;
import java.util.Map;

public class ComplexReturnType {
	private List<Map.Entry<String, MonthlyPayment>> monthlySchedule;
	private List<AnnualPayment> yearSchedule;
	private double totalPayment;
	
	public ComplexReturnType(){}
	// no constrcutor with parameters!

	public List<Map.Entry<String, MonthlyPayment>> getMonthlySchedule() {
		return monthlySchedule;
	}

	public void setMonthlySchedule(
			List<Map.Entry<String, MonthlyPayment>> monthlySchedule) {
		this.monthlySchedule = monthlySchedule;
	}

	public List<AnnualPayment> getYearSchedule() {
		return yearSchedule;
	}

	public void setYearSchedule(List<AnnualPayment> yearSchedule) {
		this.yearSchedule = yearSchedule;
	}

	public double getTotalPayment() {
		return totalPayment;
	}

	public void setTotalPayment(double totalPayment) {
		this.totalPayment = totalPayment;
	}
	
	
}
