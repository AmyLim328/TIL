package lab5;

import java.util.Scanner;

public class LAB5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);

		System.out.print("�� ���� �� ? ");
		int cnt = input.nextInt();
		int[] num = new int[cnt];
		int[] rank = new int[cnt];

		for (int i = 0; i < cnt; i++) {
			System.out.print("���� �Է��Ͻÿ� : ");
			num[i] = input.nextInt();
		}

		for (int i = 0; i < cnt; i++) {
			int order = 1;
			for (int j = 0; j < cnt; j++) {
				if (num[i] > num[j]) {
					order++;
				}

			}
			rank[i] = order;
		}

		System.out.println();
		System.out.println("========= ���� �ű�� =========");
		for (int i = 0; i < cnt; i++) {
			System.out.printf("num :  %d   =>   order :  %d \n", num[i], rank[i]);
		}

		System.out.println("============================");

	}

}
