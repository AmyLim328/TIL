package lab2;

import java.util.Scanner;

public class LAB2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);

		System.out.print("�� ���� �ĺ��ڰ� �ֽ��ϱ�? ");
		int total = input.nextInt();
		int[] cdd = new int[total];

		System.out.println("** -1�� ������ ����˴ϴ� . . . **");
		System.out.printf("1 ~ %d �ĺ��ڰ� �ֽ��ϴ� . . . !", total);
		System.out.println();
		System.out.println();

		while (true) {
			System.out.print("�� �� �ĺ��ڸ� �����Ͻðڽ��ϱ�? ");
			int pick = input.nextInt();

			if (pick == -1) {
				System.out.println("���α׷��� ����˴ϴ� . .");
				break;
			}
			if (pick > total || pick < -1) {
				System.out.println("��ȿ�� ��ȣ�� �ƴմϴ�!");
				System.out.printf("1 ~ %d ������ ��ȣ�� �����ּ���!\n", total);
				System.out.println();
				continue;
			}

			cdd[pick - 1]++;

		}
		System.out.println();
		System.out.println("========== Voting Result ==========");
		for (int i = 0; i < total; i++) {
			System.out.print("           " + (i + 1) + "           " + cdd[i] + "\n");

		}
		System.out.println("===================================");

	}

}
