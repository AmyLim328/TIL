package function_exercise;
import java.util.Arrays;
import java.util.Scanner;
public class FunctionExercise {
	static Scanner sc = new Scanner(System.in);
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		while(true) {
			System.out.println();
			System.out.println();
			System.out.println("=================");
			System.out.println("1. ��� ���ϴ� �Լ�");
			System.out.println("2. swap �Լ�");
			System.out.println("3. ���� �Լ�");
			System.out.println("4. �迭 �ε��� ��ȯ");
			System.out.println("5. ����");
			System.out.println("=================");
			System.out.print("�ϳ��� �����Ͻÿ�: ");
			int chooseMenu = sc.nextInt();
			
			if (chooseMenu == 1) {
				int[] grade = new int[5];
				for(int i = 0; i < grade.length; i ++) {
					System.out.print("���� �Է� : ");
					grade[i] = sc.nextInt();
				}
				
				average(grade);
			}
			else if (chooseMenu == 2) {
				int[] swapNum = new int[2];
				for(int i = 0; i < swapNum.length; i ++) {
					System.out.print("���� �Է� : ");
					swapNum[i] = sc.nextInt();
				}
				
				System.out.println("ȣ�� ��: " + Arrays.toString(swapNum));
				swap(swapNum);
				System.out.println("ȣ�� ��: " +Arrays.toString(swapNum));
			}
		}
	}
	
	// 1. ����ڿ��� 5���� ������ �Է¹޾� ����� ���ϴ� �Լ�
	// double average(�Ű�����)
	// �Ű�����: main���� �Է¹��� (�迭)
	public static double average(int[] scores) {
		int sum = 0;
		for(int i = 0; i < scores.length; i ++) {
			sum += scores[i];
		}
		return (double)sum / scores.length;
	}
	
	// 2. �Է¹��� �� �� (����)�� swap �ϴ� �Լ�
	// a = 2, b = 3
	// a = 3, b = 2
	// * �ڹ� �Լ����� ��ȯ���� 1��
	// int[] swap()
	// int... num == int[] num
	// swap(3, 5, 2, 1)
	// swap(3, 5)
	// swap(2)
	// main�� swap�� ���� ������ �� ������ ?
	public static void swap(int[] num) { // call by reference
		int temp; 
		
		temp = num[0];
		num[0] = num[1];
		num[1] = temp;
	}
	
	
	// 3. ����ڿ��� �Է¹޴� 5���� �� (����)�� �����ϴ� �Լ�
	// bubble sort (����)
	
	// 4. �迭 {10, 20, 30, 40, 50} (����) �߿��� ����ڿ���
	// �Է¹��� ���� �ε����� ��ȯ�ϴ� �Լ�
	// (���� ����ڰ� �Է¹��� ���� �迭 �ȿ� ���ٸ� �޽��� ���)
	public static int search(int[] num, int searchNum) {
		int i = 0;
		for(i = 0; i < num.length; i ++) {
			if(num[i] == searchNum) return i;
			//else return -1;
		}
		return -1;
	}

}
