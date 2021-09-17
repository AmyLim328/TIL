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

			boolean sale = false; // ��� SOLD OUT
			for (int i = 0; i < seats.length; i++) {
				if (seats[i] != 'X') {
					sale = true;
					break;
				}
			}
			if (sale == false) {
				System.out.println();
				System.out.println("��� �¼��� �� á���ϴ� . . . !");
				System.out.println("���α׷��� ����˴ϴ� . . !");
				break;
			}
			System.out.println();
			System.out.println("�����ϰ��� �ϸ� -1�� �Է��Ͻÿ� . . ");
			System.out.print("�¼��� �����Ͻÿ� : ");
			int seat_no = input.nextInt();

			if (seat_no == -1) {
				System.out.println("����˴ϴ� . .");
				break;
			} else if (1 > seat_no || seat_no > 10) {
				System.out.println("��ȿ���� ���� �¼��Դϴ� !");
				continue;
			} else if (seats[(seat_no - 1)] == 'O') {
				seats[(seat_no - 1)] = 'X';
			} else {
				System.out.println("�̹� ����� �¼��Դϴ� !");
				continue;
			}
		}

	}

}
