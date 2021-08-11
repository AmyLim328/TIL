
// 콘솔 (실행화면)을 통해 사용자에게 입력받는 방법
import java.util.Scanner; // 사용자에게 입력받는 클래스

public class InputTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner input = new Scanner(System.in);
		// 객체 (object): 실제 사용되는 단위 (붕어빵 하나)
		// 클래스: 붕어빵틀
		// 클래스: 변수 + 함수
		
		// int a = 10;
//		
//		int x, y, sum;
//		
////		// 입력 유도 메시지
//		System.out.print("첫번째 숫자를 입력하시오 : ");
//		x = input.nextInt(); // Scanner 클래스의 함수
//		
//		System.out.print("두번째 숫자를 입력하시오 : ");
//		y = input.nextInt(); // Scanner 클래스의 함수
//	
////		x = 100;
////		y = 200;
//		sum = x + y;
//		System.out.printf("두 수의 합 : %d \n", sum);
//		System.out.println("두 수의 합 :" + sum);
//		// 문자열 + 숫자 결합 
//	
//		
//		
//		
//		// 1.
//		// 원의 면적을 구하는 프로그램
//		// 원의 반지름은 사용자에게 입력받음 (정수, 실수)
//		
//		// 원의 면적 = pi * r * r
//		// 원의 둘레 = 2 * r * pi
//		
//		int radius;
//		double area, perimeter;
//		final double pi = 3.141592; // 나중에 변하지 않는 상수
//		
//		//pi = 3.14;
//		
//		System.out.print("반지름을 입력하시오 : ");
//		radius = input.nextInt();
//		
//		area = pi * radius * radius;
//		System.out.println("면적 : " + area);	
//		
//		perimeter = 2 * pi * radius;
//		System.out.println("둘레 : " + perimeter);
//		
//		// pi = 무한수 (3.141592 ....)
//		
//		
//		
//		
//		
//		
//		// 2. 밑변과 높이를 입력받아 삼각형의 넓이 구하는 프로그램
//		
//		int base, height;
//		double triArea;
//		
//		System.out.print("밑변을 입력하시오 : ");
//		base = input.nextInt();
//		System.out.print("높이을 입력하시오 : ");
//		height = input.nextInt();
//		
//		triArea = (base * height) / 2.0;
//		System.out.println("삼각형의 넓이: " + triArea);
		
//		// 3. 사용자에게 두 수를 입력받아 덧셈, 뺄셈, 곱셈, 나눗셈
//		int x, y;
//		
//		System.out.print("첫번째 수를 입력하시오 : ");
//		x = input.nextInt();
//
//		System.out.print("두번째 수를 입력하시오 : ");
//		y = input.nextInt();
//		
//		System.out.println("덧셈 : " + (x + y));
//		System.out.println("뺄셈 : " + (x - y));
//		System.out.println("곱셈 : " + (x * y));
//		System.out.println("나눗셈 : " + ((double)x / y));
//		
		// 4. 월급의 10% 저축하고자 한다. 10년동안 저축금액은?
		// 월급은 사용자에게 입력받음
		
		int salary; // 월급 (입력변수)
		double deposit; // 저축액
		final double rate = 0.1;
		
		// 입력 유도 메시지
		System.out.print("당신의 월급을 입력하시오 (만원) : ");
		salary = input.nextInt();
		
		deposit = salary * rate * 10 * 12;
		System.out.println("저축액은 : " + deposit + "만원");
		
		
//		int x = 10;
//		int y = 20;
//		
//		System.out.println(x);
//		System.out.println(y);
	}

}
