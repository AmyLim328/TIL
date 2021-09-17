import java.util.Scanner;

public class Operator {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/* 대입/할당 연산자 (=)
		 * : 왼쪽 변수에 오른쪽 데이터를 저장
		 * : 수학에서의 equals (==)
		 * 
		 * 산술 연산자 (+, -, *, /, %)
		 * : 정수 / (double)정수 == 실수
		 * 
		 * : % : 나머지 연산자 (modulus, mod)
		 * : x % y의 정의: x를 y로 나눌 때의 나머지 값 
		 * : ex) 3 % 5 == 3
		 * : ex) 5 % 3 == 2
		 * 
		 * 
		 * 
		 * */
		
		int x, y;
//		Scanner scan = new Scanner(System.in);
//		
//		System.out.print("X 값을 입력하시오 : ");
//		x = scan.nextInt();
//
//		System.out.print("Y 값을 입력하시오 : ");
//		y = scan.nextInt();
//		
//		System.out.println("덧셈 : " + (x + y));
//		System.out.println("뺄셈 : " + (x - y));
//		System.out.println("곱셈 : " + (x * y));
//		System.out.println("나눗셈 : " + (x / (double)y));
//		System.out.println("나머지 : " + (x % y));
		
		// 2 (숫자) -> "2" (문자열)
		
		
		// + 연산자 : 문자열 + 문자열 => 문자열의 결합
		System.out.println("하이" + "헬로우");
		
		// 이항 연산자
		// x + y, x - y, x * y ...
		
		
		// 단항 연산자 (항이 하나)
		// 1. 부호 연산자 (+, -)
		int a = 3;
		a = -a;
		System.out.println(a);
		
		int b = 3;
		b = +b;
		System.out.println(b);
		
		// 2. 증감 연산자 (증가하거나 감소하거나)
		a = 3;
		System.out.println("전 :" + a);
		++a; // a++, a = a + 1;
		System.out.println("후 :" + a);
		
		System.out.println("전 :" + a);
		--a; // a--, a = a - 1;
		System.out.println("후 :" + a);
		
		// 3. 복합 대입 연산자
		x = 10;
		y = 20;
		x = x + y; // x += y;
		System.out.println("결과 : " + x);
		
		// x: 30, y: 20
		x += y; // x = x + y;
		System.out.println("결과 : " + x);
		
		// x = x - y
		x -= y;
		System.out.println("결과 : " + x);
		
		// x = x * y
		x *= y;
		System.out.println("결과 : " + x);
		
		// x = x / y
		x /= y;
		System.out.println("결과 : " + x);
		
		// x = x % y
		x %= y;
		System.out.println("결과 : " + x);
		
		// 4. 관계 연산자
		/*
		 * ==: 같냐
		 * !=  : 다르냐
		 * > : 크냐
		 * < : 작냐
		 * >= : 크거나 같냐
		 * <= : 작거나 같냐
		 * 
		 * 연산의 결과는 boolean (true or false)
		 * */
		// 연산자에서 =은 항상 뒤에 옴
		
		System.out.println(3 == 3);
		System.out.println(5 != 3);
		System.out.println(3 > 3);
		System.out.println(3 >= 3);
		System.out.println(5 < 5);
		System.out.println(5 <= 5);
		
		// 5. 논리 연산자 (그리고, 또는, 아니다)
		/*
		 * x && y 그리고: x와 y가 모두 참이면 참
		 * x || y 또는: x나 y 중에서 하나만 참이면 참
		 * !x 아니다: x가 참이면 거짓, x가 거짓이면 참
		 * */
		
		x = 3;
		y = 4;
		System.out.println((x == 3) && (y == 4)); // T
		System.out.println((x == 5) && (y == 4)); // F
		System.out.println((x != 3) && (y == 4)); // F
		System.out.println((x != 5) && (y == 4)); // T
		System.out.println((x == 3) || (y == 4)); // T
		System.out.println(!(x != 5)); // F
		
		// 6. 삼항 연산자
		// (조건식) ? 참일 때 결과 : 거짓일 때 결과
		// ex) max_value = (x > y) ? x : y
		// 참이면   x > y  => z = x
		// 거짓이면 x <= y => z = y
		
		// 어떤 조건에 대한 결과를 간단히 수행하고 싶을 때 좋음
		// 나중에 공부할 조건문보다 길이가 짧음
		
		// 그러나 잘못쓰면 가독성이 떨어짐
		
		// 가독성을 떨어뜨리지 않을 선에서 
		// 즉, 간단한 조건에 대해서는 사용해도 좋음
		
		System.out.println((3 > 5) ? 3 : 5);
		System.out.println((5 > 3) ? 5 : 3);
		
		x = 3;
		y = 5;
		int max_value = (x > y)? x : y;
		System.out.println(max_value);
		
		// 두 수중 최소값을 뽑아내는 삼항 연산자를 만들어보세요.
		int min_value = (x < y)? x : y;
		
		
		/* - 숫자 표현법
		 * 
		 * 사람의 언어 (10진수, 0 ~ 9)
		 * 기계어 (2진수 (0, 1), 8진수 (0 ~ 7), 16진수 (0 ~ 15)
		 * 
		 * */
		
		// 7. 비트 연산자 (하드웨어)
		
		/* ~: 비트별 NOT
		 * &: 비트별 AND
		 * ^: 비트별 XOR
		 * |: 비트별 OR
		 * <<: 비트 왼쪽 이동
		 * >>: 비트 오른쪽 이동
		
		 * a *2 a *4 a *8
		 * a<<1 a<<2 a<<3
		 * 	  
		 * 
		 * */
		
		// 프로그래밍 언어: 10, 8, 16
		// 8 진수: 0o (oct)
		// 16 진수 : 0x (hex)
		
		x = 0x0fff;
		y = 0xfff0;
		
		// 정수
		// %d (decimal, 10진법)
		// %x (hex, 16진법)
		// %o (oct, 8진법)
		System.out.printf("%x \n", x & y);
		//   0000 1111 1111 1111
		// & 1111 1111 1111 0000
		// -------------------
		//   0000 1111 1111 0000
		
		System.out.printf("%x \n", x | y);
		//   0000 1111 1111 1111
		// | 1111 1111 1111 0000
		// -------------------
		//   1111 1111 1111 1111
		
		System.out.printf("%x \n", x ^ y);
		//   0000 1111 1111 1111
		// ^ 1111 1111 1111 0000
		// -------------------
		//   1111 0000 0000 1111
	
		System.out.printf("%x \n", ~x);
		// ~ 0000 1111 1111 1111
		// ---------------------
		//   1111 0000 0000 0000
		
		System.out.printf("%x \n", x << 2);
		// 0000 1111 1111 1111 << 2
		// 0011 1111 1111 1100
		
		System.out.printf("%x \n", x >> 2);
		// 0000 1111 1111 1111 >> 2
		// 0000 0011 1111 1111
		
		
		/*
		 * println() => 개행 (엔터)
		 * print, printf => 개행 x (엔터 x)
		 * => '\n'
		 * 
		 * */
		
		
		// 형변환 (type casting)
		// (새로운 자료형) 변수 이름
		
		// int i = (int)12.5;
		// double d = (double)100;
		
		
		// 연산자 우선순위
		// (2 + 3) * 5
		
		// x = y = z = 5
		
		/*
		 * 개발, 이직
		 * 
		 * 40대
		 * 
		 * 개발자: 웹/앱: java, css, html, spring...
		 *       로봇, 하드웨어 (반도체): c, c++
		 *       
		 *       웹/앱 (스타트업): django
		 *       
		 * 
		 * 연구자: 데이터분석가, 알고리즘 개발 (최적화)
		 * 
		 * 스타트업
		 * - 서비스 => 수입 있음, 투자
		 * - 기술 => 적자 j curve, 투자
		 * 
		 * 해외취업
		 * - 대학, 대학원을 해외로 다시 가시거나
		 * - 국내 대기업 3년
		 * 
		 * 
		 * 		
		 * 
		 * */

	}

}
