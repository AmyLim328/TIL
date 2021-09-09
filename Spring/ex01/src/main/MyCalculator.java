package main;

import operator.Calculator;

// IoC 컨테이너 역할
public class MyCalculator {
	public int left, right; 
	// 객체
	public Calculator calculator; 
	// 객체 연결하는 작업 (+, -, *, /)
	
	public MyCalculator(int l, int r, Calculator c) {
		// Calculator c = new CalAdd();
		// Calculator c = new CalSub();
		// Calculator c = new CalMul();
		// Calculator c = new CalDiv();....
		this.left = l;
		this.right = r;
		this.calculator = c;	
	}
	
	public void result() {
		int value = calculator.operator(left, right);
		// 어떤 객체 (CalAdd, CalSub, CalMul, CalDiv)가
		// 들어오는지에 따라 불리는 함수가 다름
		// => 다형성 (동적 바인딩, dynamic binding)
		System.out.println("result : " + value);
	}

	public int getLeft() {
		return left;
	}

	public void setLeft(int left) {
		this.left = left;
	}

	public int getRight() {
		return right;
	}

	public void setRight(int right) {
		this.right = right;
	}

	public Calculator getCalculator() {
		return calculator;
	}

	public void setCalculator(Calculator calculator) {
		this.calculator = calculator;
	}
	
	
}
