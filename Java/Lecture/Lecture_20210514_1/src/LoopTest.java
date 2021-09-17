import java.util.Scanner;

public class LoopTest {

	public static void main(String[] args) {

		/*
		 * 반복문: while (**), do while, for (*****)
		 * 
		 * while: 초기값, 조건식, 증감문
		 * 
		 * 무한 반복: 항상 조건이 참이 되는 반복문 while(true) {
		 * 
		 * 
		 * } => 반복문을 빠져나오는 방법: break;
		 * 
		 * do { 문장 } while(조건);
		 * 
		 * 1) 반복 조건을 반복문 끝에서 검사 2) 무조건 문장이 한번은 실행됨 (조건 참 거짓 관계없이)
		 * 
		 */

//		int i = 10;
//		
//		do {
//			System.out.println("i의 값 : " + i);
//			i ++;
//			
//		} while (i < 3);
//		System.out.println(i);
//		
//		System.out.println();
//		
//		i = 10;	
//		do {
//			System.out.println("i의 값 : " + i);
//			i ++;
//			
//		} while (i <= 20);
//		System.out.println(i); // 21

		/*
		 * for 루프
		 * 
		 * for(초기화 ; 조건식 ; 증감식){ 문장; }
		 * 
		 * while 1. 초기화 2. 조건식 3. 증감문
		 * 
		 */

//		int i; // 메인 함수 안에서 생성되서 메인 함수가 끝나면 소멸
//		
//		for(i = 0; i < 5; i ++) {
//			System.out.println("i의 값 : " + i);
//		}
//		System.out.println("종료시 i의 값 :" + i); // i == 5
//		System.out.println();
//		
//		for(i = 1; i <= 5; i ++) {
//			System.out.println("i의 값 : " + i);
//		}
//		System.out.println("종료시 i의 값 :" + i); // i == 6
//		System.out.println();
//		
//		
//		for(i = 5; i > 0; i --) {
//			System.out.println("i의 값 : " + i);
//		}
//		System.out.println("종료시 i의 값 :" + i); // i == 0
//		System.out.println();
//		
//		for(i = 5; i >= 1; i --) {
//			System.out.println("i의 값 : " + i);
//		}
//		System.out.println("종료시 i의 값 :" + i); // i == 0
//		System.out.println();

		// 1. 사용자에게 n을 입력받아
		// 1 + 2 + ... + n 결과값을 출력하는 프로그램을 작성하시오.
		// (sigma)
//		int sum = 0;
//		int n;
		Scanner input = new Scanner(System.in);
//		
//		System.out.print("n을 입력하시오 : ");
//		n = input.nextInt();
//		
//		for (int i = 1; i <= n; i ++) {
//			sum = sum + i;
//		}	
//		System.out.println("결과값 : " + sum);
		// 0 + 1
		// 0 + 1 + 2
		// 0 + 1 + 2 + 3
		// 0 + 1 + 2 + 3 + 4
		// 0 + 1 + 2 + 3 + 4 + 5

		// 2. 사용자에게 n을 입력받아
		// 1 x 2 x .... x n 결과값을 출력하는 프로그램을 작성하시오.
		// (factorial)
//		
//		int fact = 1; // 결과값 저장
//		int n;
//		
//		System.out.print("n을 입력하시오 : ");
//		n = input.nextInt();
//		
//		for (int i = 1; i <= n; i ++) {
//			fact = fact * i;
//			// fact *= i;
//		}
//		System.out.printf("%d! = %d \n", n, fact);
		// format

		// fact = 1 x 1
		// fact = 1 x 1 x 2
		// fact = 1 x 1 x 2 x 3
		// fact = 1 x 1 x 2 x 3 x 4
		// fact = 1 x 1 x 2 x 3 x 4 x 5

		// 3. 1 ~ 10 사이의 3의 배수만 출력하는 프로그램을 작성하시오.
		// ※ for문 안에 if문

		// %: 나머지 연산자
		// 3 % 5 == 3
		// 5 % 2 == 1
//		System.out.print("3의 배수 : ");
//		for (int i = 1; i <= 10; i++) {
//			if (i % 3 == 0) {
//				System.out.printf("%d, ", i);
//			}
//		}

		// 4. 사용자에게 n을 입력받아
		// 해당 수가 소수인지 아닌지 판별하는 프로그램을 작성하시오.
		// ※ 소수 (prime number): 1과 자기자신으로만 나누어지는 수
//		int n;
//		int cnt = 0; // 카운트 변수는 초기값 설정 !!!
//		System.out.print("수를 입력하시오 : ");
//		n = input.nextInt();

//		for (int i = 1; i <= n; i ++) {
//			if (n % i == 0) {
//				cnt ++; // cnt = cnt + 1
//				System.out.println("나누어떨어지는 수 : " + i);
//			}
//		}
//		if (cnt == 2) {
//			System.out.println("소수");
//		}
//		else {
//			System.out.println("소수 아님");
//		}
//		
//		int i;
//		for (i = 2; i < n; i++) {
//			if (n % i == 0) {
//				System.out.println("소수가 아닙니다.");
//				break;
//			}
//
//		}
//		System.out.println(i);
//
//		// 정상적으로 for문이 종료 (한번이라도 break문을 만나지 않음)
//		if (i == n) {
//			System.out.println("소수입니다.");
//		}

		// 5 => 1 2 3 4 5
		// 1, 5 ==> 소수
		// 1, 5 이외의 다른 수를 포함 => 소수 X

		// 4 => 1 2 3 4
		// 1, 2, 4 => 소수 X

		// 7 => 1 2 3 4 5 6 7
		// 1, 7 => 소수

		// 8 => 1 2 3 4 5 6 7 8
		// 1, 2, 4, 8 => 소수 X

		// 10 => 1 2 3 4 5 6 7 8 9 10

		// 16 => 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16

		// 25 => 1 2 3 4 5 ...23 24 25

//		for(int i = 1; i <= 10 ; i ++) {
//			if (i % 3 == 0) {
//				break;
//			}
//		
//			System.out.println(i);
//		}
//		System.out.println("반복문 끝");

		// break: 반복문 종료
		// continue: 반복문 다시 시작
		// 1 2 3 4 5 6 7 8 9 10
//		for (int i = 1; i <= 10; i++) {
//			if (i % 3 == 0) {
//				continue; // 3, 6, 9 제외
//			}
//
//			System.out.println(i);
//		}
//		System.out.println("반복문 끝");
		
		
		// 업다운 게임
		// answer => 1 <= answer  <= 100 사이 Random 값으로 지정 (Math.random())
		// guess 
		// if (answer > guess) -> "추측한 수가 너무 작습니다"
		// else if (answer < guess) -> "추측한 수가 너무 큽니다"
		
		// answer = 59
		// guess: 50
		// "추측한 수가 너무 작습니다 (up)"
		// guess: 60
		// "추측한 수가 너무 큽니다 (down)"
		// guess: 53
		// "추측한 수가 너무 작습니다 (up)"
		// guess: 56
		// "추측한 수가 너무 작습니다 (up)"
		// guess: 59 
		// 만약 guess == answer -> "축하합니다!", 시도횟수 = 5
		

		// 무한 루프
//		while(true) {
//			
//		}
//		
//		for (;;)
		
		int guess;
		int answer = (int)(Math.random() * 100) + 1;
		int tries = 0; // 시도횟수 저장
		
//		while(true) {
//			System.out.print("guess? ");
//			guess = input.nextInt();
//			tries ++;
//			
//			if (guess == answer) {
//				System.out.println("축하합니다!");
//				System.out.println("시도 횟수 " + tries);
//				break;
//			}	
//			else if (guess > answer) {
//				System.out.println("Down!");
//				continue;
//			}
//			else {
//				System.out.println("Up!");
//				continue;
//			}
//		}
		
//		do {
//			System.out.print("guess? ");
//			guess = input.nextInt();
//			tries ++;
//			
//			if (guess > answer) {
//				System.out.println("Down!");
//				continue;
//			}
//			else {
//				System.out.println("Up!");
//				continue;
//			}
//			
//		} while(guess != answer);
//		
//		System.out.println("축하합니다!");
//		System.out.println("시도 횟수 " + tries);
		
		
//		
//		while (guess != answer) {
//			System.out.print("guess? ");
//			guess = input.nextInt();
//			tries ++;
//			
//			if (guess > answer) {
//				System.out.println("Down!");
//				continue;
//			}
//			else {
//				System.out.println("Up!");
//				continue;
//			}
//		}
//		System.out.println("축하합니다!");
//		System.out.println("시도 횟수 " + tries);
		
		int i ;
		System.out.print("guess? ");
		guess = input.nextInt();
		
		for (i = 1; guess != answer; i ++) {
			if (guess > answer) {
				System.out.println("Down!");
				continue;
			}
			else if (guess < answer){
				System.out.println("Up!");
				continue;
			}
			
			System.out.print("guess? ");
			guess = input.nextInt();
			tries ++;
		}
		System.out.println("축하합니다!");
		System.out.println("시도 횟수 " + (i - 1));
		
		
		/* 
		 * 영수증 출력
		 * 
		 * 얼마 가지고 있니? 10000원
		 * 
		 * 김밥 ** 메뉴판
		 * 1. 김밥 (2500)
		 * 2. 라면 (3000)
		 * 3. 떡볶이 (4000)
		 * 4. 돈까스 (5000)
		 * 5. 종료
		 * 
		 * 먹고 싶은 메뉴는? 1
		 * 김밥을 선택하셨습니다.
		 * 잔돈은 7500원입니다.
		 * 
		 * 먹고 싶은 메뉴는? 2
		 * 라면을 선택하셨습니다.
		 * 잔돈은 4500원입니다.
		 * 
		 * 먹고 싶은 메뉴는? 5
		 * 종료!
		 * 잔돈은 4500원입니다.
		 * 
		 * 조건:
		 * 1. 만약 본인이 가진 돈보다 비싼 메뉴를 골랐을 경우
		 * 돈이 부족합니다! 라는 메시지 출력!
		 * 다시 메뉴 선택 (continue)
		 * 
		 * 2. 잔돈이 0원이면 종료 (break)
		 * 
		 * */

	} // main 함수의 끝

} // class의 끝
