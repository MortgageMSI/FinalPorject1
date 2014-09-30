package com.mercury.beans;

public class MortgageBean {
	private int principle;
	private int num_of_years;
	private int num_of_arms;
	private double expected_adjustment;
	private double rate_gap;
	private double start_rate;
	
	public MortgageBean(){}
	public MortgageBean(int principle, int num_of_years, int num_of_arms, double expected_adjustment, double rate_gap){
		
	}
	
	public int getPrinciple() {
		return principle;
	}
	public void setPrinciple(int principle) {
		this.principle = principle;
	}
	public int getNum_of_years() {
		return num_of_years;
	}
	public void setNum_of_years(int num_of_years) {
		this.num_of_years = num_of_years;
	}
	public int getNum_of_arms() {
		return num_of_arms;
	}
	public void setNum_of_arms(int num_of_arms) {
		this.num_of_arms = num_of_arms;
	}
	public double getExpected_adjustment() {
		return expected_adjustment;
	}
	public void setExpected_adjustment(double expected_adjustment) {
		this.expected_adjustment = expected_adjustment;
	}
	public double getRate_gap() {
		return rate_gap;
	}
	public void setRate_gap(double rate_gap) {
		this.rate_gap = rate_gap;
	}
	public double getStart_rate() {
		return start_rate;
	}
	public void setStart_rate(double start_rate) {
		this.start_rate = start_rate;
	}
	
	@Override
	public String toString(){
		return principle+" "+num_of_years+" "+num_of_arms+" "+expected_adjustment+" "+rate_gap+" "+start_rate;
	}
}
