import java.util.Scanner;
public class LoopTest {

	public static void main(String[] args) {
		/* �ݺ���: � ������ �ݺ��Ǵ� ����
		 * ex) 30�� ������ �Է¹ް� ���� ��
		 * ex) 1 ~ 45 �ζǰ� 5�� 
		 * 
		 * �ݺ����� �� �ʿ��ϳ�?
		 * - ������ ������ �ϴ� ������ ������ �ݺ��ϰ� ���� ��
		 * 
		 * while, do while, for
		 * 
		 * while (���ǽ�) {
		 * 	���� 1;
		 * }
		 * 
		 * : ���ǽ��� ���� �� ���� ���� 1�� ����ȴ�.
		 * : ���ǽ��� �ѹ��̶� �����̵Ǹ� �ݺ����� ����˴ϴ�.
		 * */
		
//		int i = 0;
//		while (i < 5) {
//			System.out.println("����: " + i); // ���� 1
//			i ++; // i = i + 1
//		}
//		System.out.println(); // ����
//		
//		i = 1; // �ʱ�ȭ
//		while (i <= 5) { // ���ǽ�, i < 6
//			System.out.println("����: " + i); // ���� 1
//			i ++; // ������, i = i + 1
//		}
//		
//		System.out.println(); // ����
//		
//		i = 5; // �ʱ�ȭ
//		while (i >= 1) { // ���ǽ�, i < 6
//			System.out.println("����: " + i); // ���� 1
//			//i --; // ������, i = i + 1
//		}
		
		/* while������ �ʿ��� 3����
		 * 
		 * 1. �ʱ�ȭ
		 * 2. ���ǽ�
		 * 3. ������
		 * => �������� ������ �Ǹ� ���� ���� (�ݺ�)�� ������ ��
		 * => ���� ����: �׻� ������ ���̵Ǵ� �ݺ���
		 * */
		
		// ���� ����: while(true)
		// ex) �������� ��� �ް� ���� ��
		// ���� ������ �������� �� �ִ� ����: break
		
		// while���� �̿��ؼ� ������ ��� ���α׷�
//		int n; // ����� �Էº��� (�ܼ�, 2 ~ 9)
//		int i = 1; // �������� �� (1 ~ 9)
//		Scanner input = new Scanner(System.in);
//		System.out.print("������ �ܼ��� �Է��Ͻÿ� : ");
//		n = input.nextInt();
//		
//		while(i <= 9) {
//			System.out.println(n + "*" + i + "=" + n * i);
//			i ++;
//		}
		
		// 5���� ������ �Է¹޾� �հ踦 ���ϴ� ���α׷�
		int score;
		int i; // �ݺ� (iteration) ����
		int sum = 0;
		Scanner input = new Scanner(System.in);
		
		i = 1;
		while (i <= 5) {
			System.out.printf("�л� %d�� ������ �Է��Ͻÿ� : ", i);
			score = input.nextInt();
			
			// �հ踦 ���ϴ� �˰��� (*****)
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


		System.out.println("������ �հ� : " + sum);
		System.out.println("������ ��� : " 
		+ (double)sum / (i - 1));
		
		// ����
		// ����ڿ��� n�� �Է¹޾� n! �����ּ���!
		// n! = 1 x 2 x 3 x .... x n
		
		// 10! = 1 x 2 x 3 x .... x 10
		// 5! = 1 x 2 x 3 x 4 x 5
		
		/* i == 0
		 * 0 < 5 (true)
		 * ���� 1 ����
		 * 
		 * i == 1
		 * 1 < 5  (true)
		 * ���� 1 ����
		 * 
		 * ...
		 * 
		 * i == 4
		 * 4 < 5 (true)
		 * ���� 1 ����
		 * 
		 * */
		
	}

}
