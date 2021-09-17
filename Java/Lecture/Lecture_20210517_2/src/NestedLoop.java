import java.util.Scanner;
public class NestedLoop {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/* ��ø �ݺ��� (���� �ݺ���, nested loop)
		 * : �ݺ��� �ȿ� �ݺ����� �� �ִ� ����
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
//		for(int i = 0; i < 5; i ++) { // ��
//			for(int j = 0; j < 8; j ++) { // ��
//				System.out.print("*");
//			}
//			System.out.println();
//		}
//		
//		/*
//		 * i = 0; j = 0 ~ 7 (8��)
//		 * i = 1; j = 0 ~ 7 (8��)
//		 * i = 2; j = 0 ~ 7 (8��)
//		 * ...
//		 * i = 4; j = 0 ~ 7 (8��)
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
//		System.out.print("�л��� ���� �Է��Ͻÿ� : ");
//		int n = input.nextInt();
//		final int numberofscore = 5;
//		int score;
//		int sum;
//		
//		for(int i = 0; i < n; i ++) {
//			sum = 0;
//			System.out.printf("========= �л� %d ���� ==========\n", i + 1);
//			for(int j = 0; j < numberofscore; j ++) {
//				System.out.print("������ �Է��Ͻÿ� : ");
//				score = input.nextInt();
//				sum += score;
//			}
//			System.out.println("�հ� : " + sum);
//			System.out.println("��� : " + (double)sum / numberofscore);
//		}
		
//		int n;
//		System.out.print("�Ǻ��ϰ��� �ϴ� ���� �Է� : ");
//		n = input.nextInt();
//		int i;
//		for(i = 2; i < n; i ++) {
//			if (n % i == 0) {
//				System.out.println("�Ҽ� X");
//				break;
//			}
//		}
//		if(i == n) {
//			System.out.println("�Ҽ� O");
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
//		System.out.println("�Ҽ��� �� �� �ΰ���? " + cnt + "��");
		// 2 ~ 100
		// 2: 
		// 3: 
		// 4: 2 3
		// 5: 2 3 4
		
		
		// 5: 2 3 4 // �Ҽ� o
		// 6: 2 3 4 5 // �Ҽ� X
		
		// ��Ÿ���
		System.out.println("======= ��Ÿ��� ���� =======");
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
		System.out.println("��Ÿ��� �����ϴ� �� = " + cnt);
		System.out.println("===========================");
		
		
		int n, num, min, max;
		/*
		 * ���������� ���� ���� ��: Integer.MIN_VALUE // -2147483648 (-2^31)
		 * ���������� ���� ū ��:  Integer.MAX_VALUE // 2147483647 (2^31-1)
		 * */
		System.out.print("n �Է� : ");
		n = input.nextInt();
		max = 0;
		min = 0;
		
		for(int i = 0; i < n; i++) {
			System.out.print("�� �Է� : ");
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
		
		System.out.printf("�ּ� = %d, �ִ� = %d", min, max);
	}

}
