package main;

import operator.*;

public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyCalculator cal;
		
		cal = new MyCalculator(10, 5, new CalAdd());
		cal.result();
		
		cal = new MyCalculator(10, 5, new CalSub());
		cal.result();
		
		cal = new MyCalculator(10, 5, new CalMul());
		cal.result();
		
		cal = new MyCalculator(10, 5, new CalDiv());
		cal.result();
		
	}

}
