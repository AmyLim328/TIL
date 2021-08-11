import java.util.Scanner;

public class ConditionTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		
//		// 조건문: 성적이 70점 이상이면 Pass하는 프로그램
//		int score;
//		Scanner input = new Scanner(System.in);
//		
//		System.out.print("너의 성적은 ..? ");
//		score = input.nextInt();
//		
//		// 조건이 참이면
//		if (score >= 70) { // 블록 (block)
//			System.out.println("합격입니다 !");
//			System.out.println("축하합니다 !");
//		}
//		
//		// 조건이 거짓이면
//		else {
//			System.out.println("불합격입니다 !");
//		}
//		
//		// 산술 연산 (/)
//		// 3 / 0 => 무한대
//		
//		int x, y;
//		System.out.print("x를 입력하시오 : ");
//		x = input.nextInt();
//		
//		System.out.printf("y를 입력하시오 : ");
//		y = input.nextInt();
//		
//		// 0 / 0 == 
//		// 3 / 0 == 
//		// 0 / 3 == 0
//		
//		if (y == 0) {
//			System.out.println("[경고] 나눌 수 없음 !!");
//		}
//		// y != 0
//		else {
//			System.out.println("x / y = " + x / (double)y);
//			System.out.printf("x / y = %-10.2f", x / (double)y);
//			// printf: 형식 그대로 출력해라
//			// 10: 공간
//			// .2: 소수점 뒤에 2개만 보여달라
//			// -: 왼쪽 정렬
//			// +: 오른쪽 정렬 (생략 가능)
//		}
//		
//		// if문, if-else문, if, else if, else문
//		
//		// 90 ~ 100: A학점
//		// 80 ~ 89: B학점
//		// 70 ~ 79: C학점
//		// 60 ~ 69: D학점
//		// 60 미만: F학점
//		
//		int grade;
//		Scanner input = new Scanner(System.in);
//
//		// 0 ~ 100
//		// 0 ~ 100 이외의 숫자는 성적으로 유효하지 않은 데이터
//		System.out.print("당신의 성적을 입력하시오 : ");
//		grade = input.nextInt();
//
//		// if문을 중첩
//		/*
//		 * if () { if ()
//		 * 
//		 * }
//		 * 
//		 */
//
//		// 0 <= grade <= 100
//		if (grade >= 0 && grade <= 100) {
//			if (grade >= 90) {
//				System.out.println("A 학점");
//			}
//			// System.out.println("평서문입니다 ..!");
//			// 조건문 중간에 평서문을 넣을 수 없음
//
//			// grade < 90
//			else if (grade >= 80) {
//				System.out.println("B 학점");
//			}
//			// grade < 80
//			else if (grade >= 70) {
//				System.out.println("C 학점");
//			}
//			// grade < 70
//			else if (grade >= 60) {
//				System.out.println("D 학점");
//			}
//			// grade < 60
//			else {
//				System.out.println("F 학점");
//			}
//		}
//		// System.out.println("평서문입니다 ..!");
//		// 조건문 중간에 평서문을 넣을 수 없음
//
//		// grade < 0 || grade > 100
//		else {
//			System.out.println("[경고] 유효하지 않은 성적입니다.");
//		}

		// 성적 0 ~ 100점 사이..

		// 1. 소득세 계산 프로그램
		/*
		 * 1000: 9% => 9/100 
		 * 1001 ~ 4000: 18% => 18/100 
		 * 4001 ~ 8000: 27% => 27/100 
		 * 8000 초과: 36% => 36/100
		 * 
		 * 소득세를 계산하시오.
		 * 
		 */
//		int income; // 수입
//		double tax; // 세금
//		Scanner input = new Scanner(System.in);
//		
//		System.out.print("수입을 입력하시오 (만원) : ");
//		income = input.nextInt();
//		
//		if (income <= 1000) {
//			tax = 0.09;
//		}
//		// income > 1000
//		else if(income <= 4000) {
//			tax = 0.18;
//		}
//		// income > 4000
//		else if(income <= 8000) {
//			tax = 0.27;
//		}
//		else {
//			tax = 0.36;
//		}
//		
//		System.out.println("소득세는 " + (income * tax) + "만원 입니다.");

		// 2. 정수 x를 입력받아 함수값 f(x)을 구해보시오. (if-else)
		// f(x) = 0 if x <= 0
		// f(x) = x * x + 4 * x + 5 else
		
//		int x, fx;
//		Scanner input = new Scanner(System.in);
//		
//		System.out.print("x의 값을 입력하시오 : ");
//		x = input.nextInt();
//		
//		if (x <= 0) {
//			fx = 0;
//		}
//		else {
//			fx = x * x + 4 * x + 5;
//		}
//		System.out.printf("f(%d) = %d \n", x, fx);

		// 3. 홀짝 판별기
		// 어떤 정수를 입력받아 해당 수가 홀수인지 짝수인지 
		// 판단하는 프로그램을 작성
		
		// 짝수: 2로 나누었을 때 나머지가 0
		// 홀수: 짝수 이외의 수
		
//		int num;
//		System.out.print("숫자를 입력하시오 : ");
//		num = input.nextInt();
//		
//		if (num != 0) {
//			if (num % 2 == 0) {
//				System.out.println("짝수");
//			}
//			else {
//				System.out.println("홀수");
//			}
//		}
//		else {
//			System.out.println("숫자 0 입니다.");
//		}
		
		// 간단한 계산기 실습
		// x, y, 연산자 (+, -, *, /)
		
//		int x, y;
//		char op;
//		int res;
//		double res_div;
//		Scanner input = new Scanner(System.in);
//		
//		System.out.print("x의 값을 입력하시오 : ");
//		x = input.nextInt();
//		
//		System.out.print("y의 값을 입력하시오 : ");
//		y = input.nextInt();
//		
//		System.out.print("연산자 (+, -, *, /) 입력하시오 : "); // +
//		op = input.next().charAt(0);
//		// charAt(0): 문자열 중에서 첫번째 문자 하나를 들고 옴
//		// "+" -> '+'
//		
//		System.out.println(op);
//		
//		if (op == '+') {
//			res = x + y;
//			System.out.printf("%d %c %d == %d", x, op, y, res);
//		}
//		else if (op == '-') {
//			res = x - y;
//			System.out.printf("%d %c %d == %d", x, op, y, res);
//		}
//		else if (op == '*') {
//			res = x * y;
//			System.out.printf("%d %c %d == %d", x, op, y, res);
//		}
//		else if (op == '/') { // x / y
//			if (y == 0) {
//				System.out.println("y == 0이라 나눌 수 없습니다 !!");
//			}
//			else {
//				res_div = x / (double)y;
//				System.out.printf("%d %c %d == %f", x, op, y, res_div);
//			}
//		}
//		else { // ^
//			System.out.println("연산자가 없습니다 !");
//		}
//		
		//System.out.printf("%d %c %d == %d", x, op, y, res);
		
		
		
		// 하나의 문자를 입력받아 모음과 자음을 구분하는 프로그램을 작성
		// char ch = input.next().charAt(0)
		// * 소문자, 대문자 모두 가능하게 만들어주세요 !
		
		// 모음: a(A), e(E), i(I), o(O), u(U)
		// 자음: 모음 제외한 모든 문자
		
//		char ch;
//		Scanner input = new Scanner(System.in);
//		System.out.print("하나의 문자를 입력하시오 : ");
//		ch = input.next().charAt(0);
//		// 아스키코드 (ascii code)
//		// 'a' : 97
//		// 'A' : 65
//		
//		// 자바 (개발자) --> 컴파일러 --> 컴퓨터 언어 (기계어, 2진법, 010101)
//		// 'a', 'b'
//		
//		// 영어 --> 번역기 --> 한국어
//		// ch : A (65) ~ Z (90) (대문자)
//		// ch : a (97) ~ z (122) (소문자)
//		
//	
//		// 대문자를 소문자로 바꿔주는 부분
//		if (ch >= 'A' && ch <= 'Z') {
//			ch = (char)(ch + ('a' - 'A'));
//			// ch: 'C': 67
//			//     'c': 67 + 32
//		}
//		
//		if (ch == 'a' || ch == 'e' || ch == 'i' ||
//				ch == 'o' || ch == 'u') {
//			System.out.println("모음");
//		}
//		
//		else {
//			System.out.println("자음");
//		}
//		
		
		// 하나의 문자를 입력받아 소문자인지 대문자인지 구분하는 프로그램을 작성
		// char ch = input.next().charAt(0)
		// ch >= 'a' && ch <= 'z'
		// ch >= 'A' && ch <= 'Z'
		// 소문자, 대문자 (영어), 숫자
		
		char ch;
		
		System.out.print("문자를 입력하시오 : ");
		Scanner input = new Scanner(System.in);
		
		ch = input.next().charAt(0);
		
		if (ch >= 'a' && ch <= 'z') {
			System.out.println("소문자");
		}
		else if (ch >= 'A' && ch <= 'Z') {
			System.out.println("대문자");
		}
		else if (ch >= '0' && ch <= '9') {
			System.out.println("숫자");
		}
//		else {
//			System.out.println("알파벳이 아님");
//		}
		
		
		// 3개의 숫자를 받아서 크기 순으로 정렬하는 프로그램을 작성
		// (if, if-else, if, else if, else 사용)
		
		
		
		
	}

}
