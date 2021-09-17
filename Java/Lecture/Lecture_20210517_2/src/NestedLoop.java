import java.util.Scanner;
public class NestedLoop {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/* 중첩 반복문 (이중 반복문, nested loop)
		 * : 반복문 안에 반복문이 들어가 있는 구조
		 * 
		 * */
		/*
		 *  ********
		 *  ********
		 *  ********
		 *  ********
		 *  ********
		 * 
		 * */
		
//		for(int i = 0; i < 5; i ++) {
//			System.out.println("********");
//		}
//		
//		for(int i = 0; i < 5; i ++) { // 행
//			for(int j = 0; j < 8; j ++) { // 열
//				System.out.print("*");
//			}
//			System.out.println();
//		}
//		
//		/*
//		 * i = 0; j = 0 ~ 7 (8번)
//		 * i = 1; j = 0 ~ 7 (8번)
//		 * i = 2; j = 0 ~ 7 (8번)
//		 * ...
//		 * i = 4; j = 0 ~ 7 (8번)
//		 * */
//	
//		
//		for (int i = 1; i < 41; i ++) { // 1 ~ 40
//			System.out.print("*");
//			if (i % 8 == 0) {
//				System.out.println();
//			}
//		}
//		System.out.println();
//		System.out.println();
//		for (int i = 1; i <= 5; i ++) {
//			for (int j = 1; j <= i; j ++) {
//				System.out.print("*");
//			}
//			System.out.println();
//		}
		Scanner input = new Scanner(System.in);
//		System.out.print("학생의 수를 입력하시오 : ");
//		int n = input.nextInt();
//		final int numberofscore = 5;
//		int score;
//		int sum;
//		
//		for(int i = 0; i < n; i ++) {
//			sum = 0;
//			System.out.printf("========= 학생 %d 정보 ==========\n", i + 1);
//			for(int j = 0; j < numberofscore; j ++) {
//				System.out.print("성적을 입력하시오 : ");
//				score = input.nextInt();
//				sum += score;
//			}
//			System.out.println("합계 : " + sum);
//			System.out.println("평균 : " + (double)sum / numberofscore);
//		}
		
//		int n;
//		System.out.print("판별하고자 하는 수를 입력 : ");
//		n = input.nextInt();
//		int i;
//		for(i = 2; i < n; i ++) {
//			if (n % i == 0) {
//				System.out.println("소수 X");
//				break;
//			}
//		}
//		if(i == n) {
//			System.out.println("소수 O");
//		}
		
//		int i, j, cnt = 0;
//		for(i = 2; i <= 100; i ++) {
//			for(j = 2; j < i; j ++) {
//				if (i % j == 0) {
//					break;
//				}
//			}
//			if (j == i) {
//				System.out.print(i + " ");
//				cnt ++;
//			}
//		}
//		System.out.println();
//		System.out.println("소수는 몇 개 인가요? " + cnt + "개");
		// 2 ~ 100
		// 2: 
		// 3: 
		// 4: 2 3
		// 5: 2 3 4
		
		
		// 5: 2 3 4 // 소수 o
		// 6: 2 3 4 5 // 소수 X
		
		// 피타고라스
		System.out.println("======= 피타고라스 문제 =======");
		int cnt = 0;
		// a < b < c
		for(int a = 1; a < 100; a++) {
			for(int b = 1; b < 100; b++) {
				for(int c = 1; c < 100; c++) {
					if ((a * a + b * b == c * c) && (a < b)) {
						System.out.printf("%2d %2d %2d \n", a, b, c);
						cnt ++;
					}
				}
			}
		}
		System.out.println("피타고라스 만족하는 수 = " + cnt);
		System.out.println("===========================");
		
		
		int n, num, min, max;
		/*
		 * 정수값에서 제일 작은 값: Integer.MIN_VALUE // -2147483648 (-2^31)
		 * 정수값에서 제일 큰 값:  Integer.MAX_VALUE // 2147483647 (2^31-1)
		 * */
		System.out.print("n 입력 : ");
		n = input.nextInt();
		max = 0;
		min = 0;
		
		for(int i = 0; i < n; i++) {
			System.out.print("수 입력 : ");
			num = input.nextInt();
			if(i == 0) {
				min = num;
				max = num;
			}
			if (num < min) {
				min = num;
			}
			if (num > max) {
				max = num;
			}
			
		}
		
		System.out.printf("최소 = %d, 최대 = %d", min, max);
	}

}
