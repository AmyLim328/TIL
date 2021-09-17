import java.util.Scanner;

public class Loop {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner scan = new Scanner(System.in);
		
		
		
		// 김밥천국
		
		/*
		 * 영수증 출력
		 * 
		 * 받은 돈 : (사용자에게 입력받음)
		 * 
		 * 김밥천국 메뉴판
		 * 
		 * 1. 김밥 (2500) 
		 * 2. 라면 (3000 
		 * 3. 떡볶이 (4000) 
		 * 4. 돈까스 (5000) 
		 * 5. 종료
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
		 **/

		int money, menu, price = 0;

		System.out.print("받은 돈 : ");
		money = scan.nextInt();

		while (true) {
			if (money <= 0) {
				break;
			}
			System.out.println("=====================");
			System.out.println("**** 김밥천구 메뉴판 ****");
			System.out.println("1. 김밥 (2500)");
			System.out.println("2. 라면 (3000)");
			System.out.println("3. 떡볶이 (4000)");
			System.out.println("4. 돈까스 (5000)");
			System.out.println("5. 종료");
			System.out.println("=====================");
			System.out.println();

			System.out.print("먹고 싶은 메뉴는? : ");
			menu = scan.nextInt();

			if (menu == 5) {
				break;
			}

			switch (menu) {
			case 1:
				price = 2500;
				break;
			case 2:
				price = 3000;
				break;
			case 3:
				price = 4000;
				break;
			case 4:
				price = 5000;
				break;
			default:
				price = -1;
			}


			if (price == -1) {
				System.out.println("잘못된 선택입니다!");
				continue;
			}
			if (money < price) {
				System.out.println("돈이 부족합니다!");
				continue;
			}
			else {
				money = money - price;
				System.out.println("잔돈은 " + money + "원입니다.");
			}
		} 
		
		
		// 1.
		// *
		// **
		// ***
		// ****
		// *****

//			for (int i = 1; i <= 5; i ++ ) {
//				for (int j = 1; j <= i  ; j ++) {
//					System.out.print("*");
//				}
//				System.out.println();
//			}
		
		

		// 2. 사용자에게 학생의 수를 입력받아
		// 행: 학생의 번호
		// 열: 5과목 (국어, 수학, 영어, 사회, 과학)
		// 각 학생의 과목 성적을 입력받아
		// 각 학생의 합계, 평균

//			int student;
//			int score = 0;
//			final int subject = 5;
//			
//			System.out.print("학생의 수를 입력하시오 : ");
//			student = scan.nextInt();
//			
//			for (int x = 1; x <= student; x ++) {
//				int sum = 0;
//				System.out.printf("====== 학생 %d의 정보 ====== \n", x);
//				
//				for (int y = 1; y <= subject; y ++) {
//					System.out.print("성적을 입력하시오 : ");
//					score = scan.nextInt();
//					sum += score;
//				}
//				System.out.printf("합계 : %d \n", sum);
//				System.out.printf("평균 : %.1f \n", (sum / (double)subject));
//			}
//			System.out.println("====== 완료 ======");

		
		
		// 3. 1 ~ 100 사이의 소수 구하기
		// 1 ~ 100 사이의 소수를 출력하고 총 몇 개인지 출력해주세요.
		// ex)
		// 2 : 1 2
		// 3 : 1 2 3
		// 5 : 1 2 3 4 5

//			int x, y;
//			int cnt = 0;
//			
//			System.out.println("1 ~ 100 사이의 소수 : ");
//			
//			for (x = 2; x <= 100; x ++) {
//				for (y = 2; y <= x; y ++) {
//					if (x % y == 0) {
//						break;
//					}
//				}
//				if (x == y) {
//					cnt ++;
//					System.out.printf("%d ", x);
//				}
//			}		
//			System.out.println();
//			System.out.println("소수의 총 개수 : " + cnt);

		
		
		// 4. 피타고라스 만족하는 삼각형 구하기
		// 100보다 작은 변의 길이를 갖는 삼각형 중에
		// 피타고라스를 만족하는 삼각형의 변의 길이를 출력하고 총 몇 개인지 출력해주세요.
		// 피타고라스 : a * a + b * b == c * c

//			int a, b, c;
//			int cnt = 0;
//			for (a = 1; a < 100; a ++) {
//				for (b = 1; b < 100; b ++) {
//					for (c = 1; c < 100; c ++) {
//						if ((a < b) && (a * a + b * b == c * c)) {
//							System.out.println(a + " " + b + " " + c);
//							cnt ++;
//						}
//					}
//				}
//			}
//			System.out.println("피타고라스 만족하는 삼각형 수 : " + cnt);

		
		
		// 5. 최솟값, 최댓값
		// 사용자에게 n을 입력받아
		// n개의 수 중에
		// 가장 큰 값과 가장 작은 값을 판별해주세요!
		// 실행결과 :
		// 3
		// 10 20 30
		// 큰 값 : 30
		// 작은 값 10
		// 정수값에서 가장 작은 값 : Integer.MIN_VALUE // -2^32
		// 정수값에서 가장 큰 값 : Integer.MAX_VALUE // 2^32

//			int n, num, min = 0, max = 0;
//			
//			System.out.print("수를 입력하시오 : ");
//			n = scan.nextInt();
//			
//			for (int i = 1; i <= n; i ++) {
//				System.out.print("숫자를 입력하시오 : ");
//				num = scan.nextInt();
//				if(i == 1) {
//					min = num;
//					max = num;
//				}
//				else {
//					if(min > num) min = num;
//					if(max < num) max = num;
//				}
//			}
//			
//			System.out.println("정수값에서 가장 작은 값 : " + min);
//			System.out.println("정수값에서 가장 큰 값 : " + max);
			
		
		
		
		
		
		

	}

}
