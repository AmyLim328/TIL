package function_review;

import java.util.Scanner;

public class FunctionTest {
	// 객체 지향의 3대 특징
	// 1. 캡슐화 (정보 은닉, 접근 제어자 (public, protected, private), getter && setter)
	// 2, 상속 (부모 - 자식)
	// 3. 다형성 (데이터 타입 (형)을 다양하게 하는 성질)
	
	// 자체 필드를 가질 수 있음
	
	// 자체 함수를 가질 수 있음
	/* - 함수 정의법
	 * 
	 * 반환형 메소드이름 (매개 변수){
	 * 	// 메소드 코드
	 * }
	 * 
	 * - 함수의 장점?
	 * 1) 가독성 높음 (함수 이름을 잘 작성, 기능별로)
	 * 	- 이름 작성법:
	 * 	1) 소문자 시작, 복합어 시작은 대문자 (카멜 표기법)
	 * 	2) 동사부터 작성 (selectNumber(), chooseNum(), addTwoNum())
	 * 
	 * 2) 중복을 피함 !!!!!!!!!!! 
	 * 
	 * */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int x, y;
		Scanner sc = new Scanner(System.in);
		
		System.out.print("x를 입력 : ");
		x = sc.nextInt(); 
		
		System.out.print("y를 입력 : ");
		y = sc.nextInt(); 
		
		// 두 수 (정수)를 더하는 함수
		// 반환형이 있는 함수
		int res = add(x, y);
		System.out.println(res);
		
		//System.out.println(add(x, y));
		System.out.println(add(res, 3));
			
		// 반환형이 없는 함수 (add2 함수의 결과값의 재사용이 불가능)
		add2(x, y);	
		
		double z = 3.5;
		double h = 4.5;
		double res2 = add(z, h); // double 두 값의 덧셈 => double 반환 (add)
	
		double res3 = add(z, h);
		
		
		// 배열의 데이터를 바로 초기화하는 경우
		int[] arr1 = {1};
		print(arr1);
		
		// 배열의 공간을 먼저 할당한 후에 나중에 데이터를 초기화하는 경우
		int[] arr2 = new int[3];
		arr2[0] = 1;
		arr2[1] = 2;
		arr2[2] = 3;
		print(arr2);
		
		// 배열의 데이터를 바로 초기화하는 경우 (변수 없이)
		print(new int[] {1});
		print(new int[] {1, 2, 3});
		
		// 배열의 공간을 먼저 할당
		print(new int[2]); // {0, 0}
		
		print(1);
		print(); // 인자가 없는 것도 가능!!!
		print(1, 2, 3);
		print(1, 2, 3, 4, 5, 6);
		print(new int[] {1, 2, 3, 4, 5, 6, 7});

		

	
	}
	
	/*
	 * 함수 중복 정의 (overload) vs 함수 재정의 (override)
	 * 
	 * 중복 정의 조건
	 * 1) 함수이름이 동일
	 * 2) 매개변수의 타입, 개수, 순서가 다름
	 * 3) 반환형은 영향을 미치지 않음 (상관없음)
	 * 
	 * * 함수 재정의 (override)
	 * : 상속 관계 (**)에서 부모가 가지고 있는 함수를 자식이 재정의
	 * : Object - toString
	 * : Customer - toString (재정의)
	 * 
	 * why? toString 왜 재정의해야할까요?
	 * >> 참조형 (배열, String, 클래스)
	 * : 데이터가 저장된 주소값
	 * >> 기초형 (int, double, float, char, boolean)
	 * 
	 * sysout() 함수에서 호출되는 함수
	 * */
	
	/* 가변 매개변수
	 * print(3), print(3, 5), print(3, 5, 3) ....
	 * */
	
//	public static void print(int[] arr) {
//		// for-each문 (향상된 for)
//		for(int i : arr) {
//			System.out.println(i);
//		}
//	}
	public static void print(int a) {
		System.out.println(a);
	}
	public static void print(int a, int b) {
		System.out.println(a);
		System.out.println(b);
	}
	public static void print(int... a) {
		for(int i : a) {
			System.out.println(i);
		}
	}
	
	
	
	// 타입이 다른 경우
	public static double add(double a, double b) {
		System.out.println("no generic");
		return a + b;
	}
	public static int add(int a, int b) {
		return a + b;
	}
	// add 함수의 매개변수를 제너릭형으로 바꾸기 (타입 파라미터)
	// 타입 파라미터 반환형 함수이름 (매개변수)
	// Number: Integer, Float, Double, Byte, Short, Long ..
	// a: 3, b: 4 ==> 7.0
	public static <T extends Number> double add(T a, T b) {
		System.out.println("generic");
		double x = (double)a; 
		double y = (double)b;
		return x + y;
	}
	
//	public static <T extends Number> void add(T a, T b) {
//		double x = (double)a; 
//		double y = (double)b;
//		System.out.println(x + y);
//	}
	
	
	// 개수가 다른 경우
	public static int add(int a, int b, int c) {
		return a + b + c;
	}
	// 순서가 다른 경우
	public static double add(double a, int b) {
		return a + b;
	}
	public static double add(int a, double b) {
		return a + b;
	}
	
	
	
	public static void add2(int a, int b) {
		System.out.println(a + b);
	}



}
