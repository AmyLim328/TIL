import java.util.Scanner;

public class Loop {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner scan = new Scanner(System.in);
		
		
		
		// ���õ��
		
		/*
		 * ������ ���
		 * 
		 * ���� �� : (����ڿ��� �Է¹���)
		 * 
		 * ���õ�� �޴���
		 * 
		 * 1. ��� (2500) 
		 * 2. ��� (3000 
		 * 3. ������ (4000) 
		 * 4. ��� (5000) 
		 * 5. ����
		 * 
		 * �԰� ���� �޴���? 2 
		 * ����� �����ϼ̽��ϴ�. 
		 * �ܵ��� 4500���Դϴ�.
		 * 
		 * �԰� ���� �޴���? 5
		 * ����! 
		 * �ܵ��� 4500���Դϴ�.
		 * 
		 * ����: 
		 * 1. ���� ������ ���� ������ ��� �޴��� ����� ��� 
		 * ���� �����մϴ�! ��� �޽��� ���! 
		 * �ٽ� �޴� ���� (continue)
		 *
		 * 2. �ܵ��� 0���̸� ���� (break)
		 *
		 **/

		int money, menu, price = 0;

		System.out.print("���� �� : ");
		money = scan.nextInt();

		while (true) {
			if (money <= 0) {
				break;
			}
			System.out.println("=====================");
			System.out.println("**** ���õ�� �޴��� ****");
			System.out.println("1. ��� (2500)");
			System.out.println("2. ��� (3000)");
			System.out.println("3. ������ (4000)");
			System.out.println("4. ��� (5000)");
			System.out.println("5. ����");
			System.out.println("=====================");
			System.out.println();

			System.out.print("�԰� ���� �޴���? : ");
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
				System.out.println("�߸��� �����Դϴ�!");
				continue;
			}
			if (money < price) {
				System.out.println("���� �����մϴ�!");
				continue;
			}
			else {
				money = money - price;
				System.out.println("�ܵ��� " + money + "���Դϴ�.");
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
		
		

		// 2. ����ڿ��� �л��� ���� �Է¹޾�
		// ��: �л��� ��ȣ
		// ��: 5���� (����, ����, ����, ��ȸ, ����)
		// �� �л��� ���� ������ �Է¹޾�
		// �� �л��� �հ�, ���

//			int student;
//			int score = 0;
//			final int subject = 5;
//			
//			System.out.print("�л��� ���� �Է��Ͻÿ� : ");
//			student = scan.nextInt();
//			
//			for (int x = 1; x <= student; x ++) {
//				int sum = 0;
//				System.out.printf("====== �л� %d�� ���� ====== \n", x);
//				
//				for (int y = 1; y <= subject; y ++) {
//					System.out.print("������ �Է��Ͻÿ� : ");
//					score = scan.nextInt();
//					sum += score;
//				}
//				System.out.printf("�հ� : %d \n", sum);
//				System.out.printf("��� : %.1f \n", (sum / (double)subject));
//			}
//			System.out.println("====== �Ϸ� ======");

		
		
		// 3. 1 ~ 100 ������ �Ҽ� ���ϱ�
		// 1 ~ 100 ������ �Ҽ��� ����ϰ� �� �� ������ ������ּ���.
		// ex)
		// 2 : 1 2
		// 3 : 1 2 3
		// 5 : 1 2 3 4 5

//			int x, y;
//			int cnt = 0;
//			
//			System.out.println("1 ~ 100 ������ �Ҽ� : ");
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
//			System.out.println("�Ҽ��� �� ���� : " + cnt);

		
		
		// 4. ��Ÿ��� �����ϴ� �ﰢ�� ���ϱ�
		// 100���� ���� ���� ���̸� ���� �ﰢ�� �߿�
		// ��Ÿ��󽺸� �����ϴ� �ﰢ���� ���� ���̸� ����ϰ� �� �� ������ ������ּ���.
		// ��Ÿ��� : a * a + b * b == c * c

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
//			System.out.println("��Ÿ��� �����ϴ� �ﰢ�� �� : " + cnt);

		
		
		// 5. �ּڰ�, �ִ�
		// ����ڿ��� n�� �Է¹޾�
		// n���� �� �߿�
		// ���� ū ���� ���� ���� ���� �Ǻ����ּ���!
		// ������ :
		// 3
		// 10 20 30
		// ū �� : 30
		// ���� �� 10
		// ���������� ���� ���� �� : Integer.MIN_VALUE // -2^32
		// ���������� ���� ū �� : Integer.MAX_VALUE // 2^32

//			int n, num, min = 0, max = 0;
//			
//			System.out.print("���� �Է��Ͻÿ� : ");
//			n = scan.nextInt();
//			
//			for (int i = 1; i <= n; i ++) {
//				System.out.print("���ڸ� �Է��Ͻÿ� : ");
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
//			System.out.println("���������� ���� ���� �� : " + min);
//			System.out.println("���������� ���� ū �� : " + max);
			
		
		
		
		
		
		

	}

}
