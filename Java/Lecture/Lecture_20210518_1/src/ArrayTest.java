import java.util.Scanner;
public class ArrayTest {

	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//		final int STUDENT = 5;
//		
//		// 1. new ����ϴ� ���
//		int[] scores = new int[STUDENT];
//		
//		
//		// 2. �迭�� �������ڸ��� �����͸� �ʱ�ȭ�ϴ� ��� (new ��� x)
//		// {}�� �̿��ϼż� �����͸� �ʱ�ȭ�� �� ����
//		// �����Ͱ� �������ִ� ��� (�Էº��� x)
//		String[] month = {"jan", "feb", "mar"};
//		month[0] = "Jan";
//		
//		// for-each ����
////		for(String str : month) {
////			System.out.println(str);
////		}
//		
//		Scanner input = new Scanner(System.in);
////		scores[0] = 10;
////		scores[1] = 20;
////		scores[2] = 30;
////		scores[3] = 40;
////		scores[4] = 50;
////		score
//		
//		for(int i = 0; i < scores.length; i++) {
//			System.out.printf("�л� %d�� ������ �Է��Ͻÿ�: ", i);
//			scores[i] = input.nextInt();
//		}
////		System.out.println(scores[0]);
////		System.out.println(scores[3]);
////		System.out.println(scores[5]);
////		System.out.println(scores[10]); // 0 ~ 9
//		for(int i = 0; i < scores.length; i++) {
//			System.out.println(scores[i]);
//		}
//		// scores �������� �հ�, ���
//		int sum = 0;
//		for(int i = 0; i < scores.length; i++) {
//			sum += scores[i];
//		}
//		System.out.println("�հ� : " + sum);
//		System.out.println("��� : " + (double)sum / scores.length);
//	
//		// �迭�� ���� ����
//		// 1  2  3  4  5
//		// 10 20 30 40 50
//		int grade, total = 0;
//		for(int i = 0; i < STUDENT; i++) {
//			System.out.print("�л��� ������ �Է��Ͻÿ� : ");
//			grade = input.nextInt();
//			total += grade;
//		}
//		//System.out.println(grade);
//		
//		System.out.println("�հ� : " + total);
//		System.out.println("��� : " + (double)total / STUDENT);
//	
		// �ζ� �ڵ� ������
		// 6�� 1 ~ 45
//		int[] lotto = new int[6];
//		// lotto[0] ~ lotto[5]
//		// Math.random() 
//		// Math, Random
//		// Ŭ���� = ������ + �Լ�
//		// Ŭ���� �̸�.�Լ� �̸�
//		// ���� 1
//		for(int i = 0; i < lotto.length; i ++) {
//			lotto[i] = (int)(Math.random() * 45) + 1;
//			System.out.println(lotto[i]);
//		}
//		
//		// ���� 2
//		// �����͸� 0 ~ lotto.length-1 �Ҵ����ְ�
//		for(int i = 0; i < lotto.length; i ++) {
//			lotto[i] = (int)(Math.random() * 45) + 1;
//		}
//		// �Ѳ����� ���
//		for(int i = 0; i < lotto.length; i ++) {
//			System.out.println(lotto[i]);
//		}
//		
//		// �� ���ҳ��� ����, ������ ����� �迭�� �����ϰ� �̸� ������ּ���!
//		int[] a = {10, 20, 30};
//		int[] b = {30, 40, 50};
//		int[] add = new int[a.length];
//		int[] sub = new int[a.length];
//		
//		for(int i = 0; i < a.length; i ++) {
//			add[i] = a[i] + b[i];
//			sub[i] = a[i] - b[i];
//		}
//		
//		for(int i = 0; i < a.length; i ++) {
//			System.out.printf("add[%d] = %d\n", i, add[i]);
//		}
//		
//		for(int i = 0; i < a.length; i ++) {
//			System.out.printf("sub[%d] = %d\n", i, sub[i]);
//		}
		
		
		// ������ �迭
//		int[][] scores = new int[3][5];
//		Scanner input = new Scanner(System.in);
//		String[] subject = {"����", "����", "��ȸ", "����", "����"};
//		
//		for(int i = 0; i < scores.length; i++) {
//			System.out.printf("=== �л� %d ���� �Է� ===\n", i);
//			
//			for(int j = 0; j < scores[i].length; j++) {
//				System.out.printf("%s ������ ������ �Է��Ͻÿ� : ", 
//						subject[j]);
//				scores[i][j] = input.nextInt();
//			}
//		}
		
		// ������ �迭 ����, ����
		int[][] a = {{10, 20, 30}, {40, 50, 60}, {70, 80, 90}};
		int[][] b = {{10, 20, 30}, {40, 50, 60}, {70, 80, 90}};
		int[][] add = new int[a.length][a[0].length];
		int[][] sub = new int[a.length][a[0].length];
		int[][] mul = new int[a.length][b[0].length];
		
		// a = (i * k)
		// b = (k * j)
		// c = (i * j)
		
		// ������ ���
		for(int i = 0; i < a.length; i ++) { // mul ����� ��
			for(int j = 0; j < b[0].length; j++) { // mul ����� ��
				for(int k = 0; k < a[0].length; k++) {
					mul[i][j] += (a[i][k] * b[k][j]);
				}
				// mul[0][0] = a[0][0] * b[0][0]
				//           + a[0][1] * b[1][0]
				//           + a[0][2] * b[2][0]
				
				// mul[0][1] = a[0][0] * b[0][1]
				//           + a[0][1] * b[1][1]
				//           + a[0][2] * b[2][1]
			}
		}
		
		for(int i = 0; i < mul.length; i++) {
			for(int j = 0; j < mul[i].length; j++) {
				System.out.printf("%5d ", mul[i][j]);
			}
			System.out.println();
		}
		System.out.println();
		
		for(int i = 0; i < a.length; i ++) {
			for(int j = 0; j < a[0].length; j ++) {
				add[i][j] = a[i][j] + b[i][j];
				sub[i][j] = a[i][j] - b[i][j];
			}
		}
		// ������ ���
		for(int i = 0; i < add.length; i ++) {
			for(int j = 0; j < add[0].length; j ++) {
				System.out.println(add[i][j]);
			}
		}
		// ������ ���
		for(int i = 0; i < sub.length; i ++) {
			for(int j = 0; j < sub[0].length; j ++) {
				System.out.println(sub[i][j]);
			}
		}
		
		// �迭�� ����
		// �迭�� �̸����� �������� ������ġ (�ּ�)�� ����
		int[] ma = {10, 20, 30};
		int[] mb = ma; // �ּҰ��� ����
		System.out.println(ma);
		System.out.println(mb);
		
		// ������ ����
		// �� ���Ҹ� ����
		// mc = ma (x, �ּҰ��� ����)
		int[] mc = new int[ma.length];
		System.out.println(mc);
		
		for(int i = 0; i < ma.length; i ++) {
			mc[i] = ma[i];
			System.out.print(mc[i] + " ");
		}
		
		/*
		 * ������������ ==, !=
		 * ma == mc: �ּҰ� ����
		 * ma != mc: �ּҰ� �ٸ���
		 * 
		 * �׷� �ּҰ��� �ƴ϶� ���빰�� ������ Ȯ���Ϸ���?
		 * �׷� �ּҰ��� �ƴ϶� ���빰�� �ٸ��� Ȯ���Ϸ���?
		 * 
		 * */
		System.out.println();
		int[][] matrixA = {{1, 2, 3}, {4, 5, 6}}; // 2 X 3
		int[][] matrixB = {{1, 2, 3}, {4, 5, 6}}; // 2 X 3
		int[][] matrixC = {{1, 2, 4}, {5, 6, 7}}; // 2 X 3
		
		// 1) matrixA�� matrixB�� ���빰�� ������ Ȯ�����ּ���!
		boolean checker = true;
		int i, j;
		for(i = 0; i < matrixA.length; i++) {
			for(j = 0; j < matrixA[0].length; j++) {
				if(matrixA[i][j] != matrixB[i][j]) {
					checker = false;
					break; // ���� for�� ����
				}
				
			} // ���� for
			if (j < matrixA[0].length) {
				break; // �ܺ� for�� ����
			}
		} // �ܺ� for
		
		System.out.println((checker == true)? 
				"�� ����� �����ϴ�." : "�� ����� �ٸ��ϴ�." );
//		if(checker == true) {
//			System.out.println("�� ����� �����ϴ�.");
//		}
//		else {
//			System.out.println("�� ����� �ٸ��ϴ�.");
//		}
		
		
		// 2) matrixA�� matrixC�� ���빰�� �ٸ��� Ȯ�����ּ���!
		
		// 3) matrixA�� matrixB�� �ּҰ��� ������ Ȯ�����ּ���!
		// matrixB = matrixA;
		System.out.println((matrixA == matrixB) ?
				"�ּҰ� �����մϴ�." : "�ּҰ� �������� �ʽ��ϴ�.");
	
	}
}
