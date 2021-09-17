package lab1;

import java.util.Scanner;

public class LAB1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);

		char[] seats = { 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O' };

		while (true) {
			System.out.println("======= SEATS =======");
			for (int i = 0; i < seats.length; i++) {
				System.out.print(i + 1 + " ");
			}
			System.out.println();
			System.out.println("=====================");
			for (int i = 0; i < seats.length; i++) {
				System.out.print(seats[i] + " ");
			}
			System.out.println();

			boolean sale = false; // 모두 SOLD OUT
			for (int i = 0; i < seats.length; i++) {
				if (seats[i] != 'X') {
					sale = true;
					break;
				}
			}
			if (sale == false) {
				System.out.println();
				System.out.println("모든 좌석이 꽉 찼습니다 . . . !");
				System.out.println("프로그램이 종료됩니다 . . !");
				break;
			}
			System.out.println();
			System.out.println("종료하고자 하면 -1을 입력하시오 . . ");
			System.out.print("좌석을 선택하시오 : ");
			int seat_no = input.nextInt();

			if (seat_no == -1) {
				System.out.println("종료됩니다 . .");
				break;
			} else if (1 > seat_no || seat_no > 10) {
				System.out.println("유효하지 않은 좌석입니다 !");
				continue;
			} else if (seats[(seat_no - 1)] == 'O') {
				seats[(seat_no - 1)] = 'X';
			} else {
				System.out.println("이미 예약된 좌석입니다 !");
				continue;
			}
		}

	}

}
