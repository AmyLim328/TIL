package arithmetic_exception;


/* 프로그램 오류
 * 
 * 컴파일 에러 (compile-time error)
 * : 컴파일할 때 발생하는 에러 (eclipse에서 잡아줌)
 * 
 * 런타임 에러 (runtime error)
 * : 실행할 때 발생하는 에러
 * : 에러 (error): 심각한 오류
 * : 예외 (exception): 다소 미약한 오류 (수습 가능)
 * 
 * 논리적 에러
 * : 의도와 다르게 동작하는 것 (실행 시)
 * : 개발자들이 잘못 했을 확률 높음
 *  
 *  
 * 예외 처리 (exception handling)
 * 정의 - 프로그램 실행 시 발생할 수 있는 예외 발생에 대비한 코드를 작성
 * 목적 - 프로그램의 중단을 막음
 * 구문 - try-catch문
 *  
 * 자바 코드 --> 컴파일 (ctrl + s) --> 기계어 --> 실행 (f11)
 * 
 * RuntimeException: 개발자 실수로 발생하는 예외 (예외처리 선택)
 * Exception: 사용자가 할 수 있는 실수 (외적인 요인)로 발생하는 예외
 * (예외처리 필수)
 * 
 * ex)
 * 3/0
 * 
 * int[] arr = new int[3]; arr[0] ~ arr[2] 
 * print(arr[3])
 * 
 * */
import java.util.Scanner;
public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int x, y;
		Scanner sc = new Scanner(System.in);
		System.out.print("x의 값: ");
		x = sc.nextInt();
		
		System.out.print("y의 값: ");
		y = sc.nextInt();
		
		try {
			int res = x / y; // 예외가 발생할 수 있는 문장
			System.out.println("나눗셈 결과: " + res);
		} 
		catch(ArithmeticException e) {
			System.out.println("0으로 나눌 수 없습니다 !");
		}
		finally {
			// 예외 발생 유무와 관계없이 무조건 실행
			System.out.println("finally 구문");
		}
		// 예외처리기 (try-catch)가 없으면 프로그램 중간에 예외가 발생하면 프로그램 중단
		// 예외처리기 (try-catch)가 있으면 프로그램 중단 X
		
		
		
		System.out.println("프로그램 끝 ...");
	}

}
