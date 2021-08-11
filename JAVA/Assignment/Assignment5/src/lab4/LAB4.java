
package lab4;

import java.util.Scanner;

public class LAB4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);

		System.out.print("주사위 게임 횟수를 입력하시오 : ");
		int numOfGames = input.nextInt();
		System.out.println();

		int[] res = { 0, 0, 0, 0, 0, 0 };

		for (int i = 0; i < numOfGames; i++) {
			int dice = (int) (Math.random() * 6) + 1;
			res[dice - 1]++;

		}
		System.out.println("====== 주사위 게임 결과 ======");
		for (int i = 0; i < res.length; i++) {
			System.out.print("        " + (i + 1) + "        " + res[i] + "\n");
		}
		System.out.println("===========================");

	}

}
