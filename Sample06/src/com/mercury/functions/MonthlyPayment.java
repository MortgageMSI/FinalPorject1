package com.mercury.functions;

public class MonthlyPayment {
	private int payment_number;
	private double payment;
	private double remain_principle;
	
	public MonthlyPayment(){}
	public MonthlyPayment(int payment_number, double payment, double remain_principle){
		this.payment_number = payment_number;
		this.payment = payment;
		this.remain_principle = remain_principle;
	}
	public double getPayment() {
		return payment;
	}
	public void setPayment(double payment) {
		this.payment = payment;
	}
	public double getRemain_principle() {
		return remain_principle;
	}
	public void setRemain_principle(double remain_principle) {
		this.remain_principle = remain_principle;
	}
	public int getPayment_number() {
		return payment_number;
	}
	public void setPayment_number(int payment_number) {
		this.payment_number = payment_number;
	}
	@Override
	public String toString(){
		return " "+payment_number+" "+payment+" "+remain_principle;
	}
	
	
}
