package lab5;

import java.util.Scanner;

public class LAB5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);

		System.out.print("몇 개의 수 ? ");
		int cnt = input.nextInt();
		int[] num = new int[cnt];
		int[] rank = new int[cnt];

		for (int i = 0; i < cnt; i++) {
			System.out.print("수를 입력하시오 : ");
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
		System.out.println("========= 순서 매기기 =========");
		for (int i = 0; i < cnt; i++) {
			System.out.printf("num :  %d   =>   order :  %d \n", num[i], rank[i]);
		}

		System.out.println("============================");

	}

}
