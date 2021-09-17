import java.util.Scanner;
public class LoopTest {

	public static void main(String[] args) {
		/* 반복문: 어떤 문장이 반복되는 구조
		 * ex) 30명 성적을 입력받고 싶을 때
		 * ex) 1 ~ 45 로또값 5번 
		 * 
		 * 반복문이 왜 필요하냐?
		 * - 동일한 수행을 하는 문장을 여러번 반복하고 싶을 때
		 * 
		 * while, do while, for
		 * 
		 * while (조건식) {
		 * 	문장 1;
		 * }
		 * 
		 * : 조건식이 참일 때 동안 문장 1이 실행된다.
		 * : 조건식이 한번이라도 거짓이되면 반복문은 종료됩니다.
		 * */
		
//		int i = 0;
//		while (i < 5) {
//			System.out.println("정수: " + i); // 문장 1
//			i ++; // i = i + 1
//		}
//		System.out.println(); // 엔터
//		
//		i = 1; // 초기화
//		while (i <= 5) { // 조건식, i < 6
//			System.out.println("정수: " + i); // 문장 1
//			i ++; // 증감식, i = i + 1
//		}
//		
//		System.out.println(); // 엔터
//		
//		i = 5; // 초기화
//		while (i >= 1) { // 조건식, i < 6
//			System.out.println("정수: " + i); // 문장 1
//			//i --; // 증감식, i = i + 1
//		}
		
		/* while문에서 필요한 3가지
		 * 
		 * 1. 초기화
		 * 2. 조건식
		 * 3. 증감식
		 * => 증감식이 빠지게 되면 무한 루프 (반복)에 빠지게 됨
		 * => 무한 루프: 항상 조건이 참이되는 반복문
		 * */
		
		// 무한 루프: while(true)
		// ex) 센서값을 계속 받고 싶을 때
		// 무한 루프를 빠져나올 수 있는 구문: break
		
		// while문을 이용해서 구구단 출력 프로그램
//		int n; // 사용자 입력변수 (단수, 2 ~ 9)
//		int i = 1; // 곱해지는 수 (1 ~ 9)
//		Scanner input = new Scanner(System.in);
//		System.out.print("구구단 단수를 입력하시오 : ");
//		n = input.nextInt();
//		
//		while(i <= 9) {
//			System.out.println(n + "*" + i + "=" + n * i);
//			i ++;
//		}
		
		// 5명의 성적을 입력받아 합계를 구하는 프로그램
		int score;
		int i; // 반복 (iteration) 변수
		int sum = 0;
		Scanner input = new Scanner(System.in);
		
		i = 1;
		while (i <= 5) {
			System.out.printf("학생 %d번 성적을 입력하시오 : ", i);
			score = input.nextInt();
			
			// 합계를 구하는 알고리즘 (*****)
			//sum = sum + score;
			sum += score;
			
			i ++;
		}
		
		/* i == 1
		 * sum = 0 + 10
		 * 
		 * i == 2
		 * sum = (0 + 10) + 20
		 * 
		 * i == 3
		 * sum = ((0 + 10) + 20) + 30
		 * 
		 * i == 4
		 * sum = (((0 + 10) + 20) + 30) + 40
		 * 
		 * i == 5
		 * sum = ((((0 + 10) + 20) + 30) + 40) + 50
		 * 
		 * */


		System.out.println("성적의 합계 : " + sum);
		System.out.println("성적의 평균 : " 
		+ (double)sum / (i - 1));
		
		// 문제
		// 사용자에게 n을 입력받아 n! 구해주세요!
		// n! = 1 x 2 x 3 x .... x n
		
		// 10! = 1 x 2 x 3 x .... x 10
		// 5! = 1 x 2 x 3 x 4 x 5
		
		/* i == 0
		 * 0 < 5 (true)
		 * 문장 1 실행
		 * 
		 * i == 1
		 * 1 < 5  (true)
		 * 문장 1 실행
		 * 
		 * ...
		 * 
		 * i == 4
		 * 4 < 5 (true)
		 * 문장 1 실행
		 * 
		 * */
		
	}

}
