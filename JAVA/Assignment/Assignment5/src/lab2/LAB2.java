package lab2;

import java.util.Scanner;

public class LAB2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);

		System.out.print("몇 명의 후보자가 있습니까? ");
		int total = input.nextInt();
		int[] cdd = new int[total];

		System.out.println("** -1을 누르면 종료됩니다 . . . **");
		System.out.printf("1 ~ %d 후보자가 있습니다 . . . !", total);
		System.out.println();
		System.out.println();

		while (true) {
			System.out.print("몇 번 후보자를 선택하시겠습니까? ");
			int pick = input.nextInt();

			if (pick == -1) {
				System.out.println("프로그램이 종료됩니다 . .");
				break;
			}
			if (pick > total || pick < -1) {
				System.out.println("유효한 번호가 아닙니다!");
				System.out.printf("1 ~ %d 사이의 번호를 눌러주세요!\n", total);
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
