package throws_test;

/*
 * Runtime Exception:
 * 
 * ArithmeticException: 0으로 나눌 때 발생
 * NullPointerException: null 객체를 참조할 때 발생
 * ClassCastException: 클래스 형변환을 잘못했을 때 발생
 * NegativeArraySizeException: 배열의 크기가 음수일 경우에 발생
 * OutOfMemoryException: 메모리 부족할 때 발생
 * NoClassDefFoundException: 원하는 클래스를 찾지 못했을 경우에 발생
 * ArrayIndexOutOfBoundsException: 배열 인덱스가 잘못된 경우에 발생
 * */

import java.util.InputMismatchException;
import java.util.Scanner;
public class ExceptionTest {
	static Scanner input = new Scanner(System.in);
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			calculator();
			sumArray(); // static void sumArray(int[] arr)
		}
		catch(InputMismatchException e) {
			System.out.println("MisMatch Exception ..");
			System.out.println(e.getMessage());
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
			System.out.println("프로그램 종료 ...");
		}
		
		
	} // main 함수
	
	// Exception e = new ArithmeticException(); // 다형성
	static void calculator() throws ArithmeticException, InputMismatchException{
		// InputMismatchException
		System.out.print("a 값 입력: ");
		int x = input.nextInt(); // 3.0
		
		System.out.print("b 값 입력: ");
		int y = input.nextInt();
		
//		try {
			System.out.println("결과 = " + x / y);
//		}catch(ArithmeticException e) {
//			System.out.println("예외 발생 !");
//		}
	}
	
	static void sumArray() throws ArrayIndexOutOfBoundsException{
		
		int[] c = {10, 20, 30, 40, 50};
		int sum = 0;
		
		// 
		for(int i = 0; i < c.length; i ++) {
			sum += c[i];
		}
	}
	

}
