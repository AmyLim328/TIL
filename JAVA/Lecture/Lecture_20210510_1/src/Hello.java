
public class Hello {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		
//		System.out.println("Hello Java!1");
//		System.out.println("Hello Java!2");
//		System.out.println("Hello Java!3");
		// 문장의 끝은 항상 세미콜론 (;)
		// 문장의 실행은 순차적으로 실행됨
		
		// sysout + (ctrl + space)
		// 실행 : 초록색 재생 버튼 (ctrl + F11)
		// println(): 콘솔 (실행화면) 출력하는 함수
		
		// 코드 : 개발자
		// 실행화면 : 사용자, 테스터 개발자
		
		// 어떻게 실행될까?
		// 코드 -> 컴퓨터 -> 실행화면
		
		// 코드 (java) -> (번역기) -> 컴퓨터
		// (번역기): 컴파일러 (compiler)
		
		// 컴퓨터 -> 실행화면
		// 컴퓨터 : 001011.. (이진법)
		
		// 주석 (comment): 코드가 아님
		// 개발자들끼리 의사소통 (설명, 협업 소통)
	
		
		/*
		 * ㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴ
		 * ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴ
		 * ㅁㄴㅇㅁㄴㅇㅁㄴㅇ
		 * 
		 * 
		 * 
		 * */
		
		
		 /*
		  * 본인의 이름을 출력해보세요.
		  * 
//		  * */
//		System.out.println("최은빈입니다.");
//		System.out.println("저는 예능보는 것을 좋아합니다.");
//		System.out.println("");
		
		// 콘솔에 출력하는 함수
		// println(): 문장 + 개행 o (enter, '\n')
		// print(): 문장 + 개행 x
		// printf(): print format (형식대로 출력해라)
		
//		System.out.print("Java 1");
//		System.out.print("Java 2");
//		System.out.print("Java 3");
//		
		
		/*
		 * 변수 (variables, 변할 수 있는 수)
		 * : 변할 수 있는 수 (데이터)를 저장하는 공간 (상자)
		 * : 이름, 타입
		 * 
		 * 1) 이름 작성법
		 * a = 1;
		 * 
		 * 1) 이름은 영어 작성 (띄어쓰기 X ->  _) ex) sum_height
		 * 2) 특수문자는 _ 제외하고 불가능
		 * 3) 숫자는 첫글자로 올 수 없음 1sum, 2sum, -> sum1, sum2 
		 * 4) 이름은 저장되는 데이터에 맞게 명명
		 * ex) height, count, x, y, num, ch (o)
		 * ex) a, b, c, d (x)
		 * 
		 * 
		 * 2) 데이터 타입
		 * int (정수, 4byte) ex) int count = 0;
		 * 참고) 1byte = 8bit
		 *
		 * float (실수, 4byte)
		 * double (실수, 8byte)
		 * ex) float height = 3.141231234564561234564564
		 * 
		 * char (character, 문자)
		 * ex) char ch = 'a';
		 * ex) "Hello Java" : 문자 집합 (문자열)
		 * ex) a (변수) vs 'a' (문자)
		 * 
		 * boolean (참과 거짓, true, false)
		 * = (대입 연산자), == (같다)
		 * 1 == 1 => true
		 * 1 == 2 => false
		 * 
		 * String (문자열)
		 * ex) "Hello Java" "a" 
		 * 
		 * */
//		boolean a = (1 == 1);
//		System.out.println(a);
		
		
		
		int x = 10;
		int y = 20;
		int sum = x + y;
		int sub = x - y;
		int mul = x * y;
		int div = x / y;
//		int x, y, sum, sub, mul, div;
		
//		x = 10;
//		y = 20;
//		sum = x + y;
//		sub = x - y;
//		mul = x * y;
//		div = x / y;
//		
		
		System.out.println("sum"); // "sum" 문자열
		System.out.println(sum); // sum 변수
		System.out.println(sub);
		System.out.println(mul);
		System.out.println(div); // 0.5
		// 정수 / 정수 = 정수
		// 정수 / 실수 = 실수
		// 실수 / 정수 = 실수
		// 실수 / 실수 = 실수
		
		System.out.println(3 / 5);
		System.out.println(3.0 / 5);
		System.out.println(3 / 5.0);
		System.out.println(3.0 / 5.0);
		
		x = 10;
		y = 20;
		
		// 형 변환 (type casting)
		// 10 -> 10.0
		System.out.println(x / y);
		System.out.println((double)x / y);
		System.out.println(x / (double)y);
		System.out.println((double)x / (double)y);
		
		// 포함관계
		// 정수 < 실수 < 유리수
		
		/* 두 수의 뺄셈, 곱셈, 나눗셈 프로그램 작성 (실습시간)
		 * 
		 * 뺄셈 : -
		 * 곱셈 : *
		 * 나눗셈 : /
		 * 
		 * */
		
		// 출력 함수
		// println(), print(), printf()
		
		// int sum
		System.out.printf("hello hi java %d \n", sum);
		System.out.printf("hello hi java %d \n", sum);
		System.out.printf("sum = %d, sub = %d \n", sum, sub);
		
		// 캘린더
		int month = 2; // 1 ~ 12
		int day = 1; // 1 ~ 31
		
		System.out.printf("%-2d월 %-2d일 \n", month, day);
		
		month = 12;
		day = 31;
		
		System.out.printf("%-2d월 %-2d일 \n", month, day);
	
		// printf 왜 쓰냐? --> 다음 시간
		// 형식 그대로 출력해주기 위함 (예쁘고 간결하게 출력)
		
		/*
		 * printf() 
		 * " " 형식 지정자
		 * 
		 * 정수 (int, integer): %d (decimal, 10진수)
		 * 실수 (float, double): %f, %lf
		 * 문자 (char): %c
		 * 문자열 (String): %s
		 * 
		 * */
		
		
		
		
	}
}
