package lab3;

import java.util.Scanner;

public class LAB3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);

		String ox;
		int sum = 0;
		int plus = 0;

		System.out.print("O X ���� ä�� : ");
		ox = input.next();

		for (int i = 0; i < ox.length(); i++) {
			if (ox.charAt(i) == 'O') {
				plus++;
				sum += plus;
			} else if (ox.charAt(i) == 'X') {
				plus = 0;
			}
		}

		System.out.println("���� ���� ��� : " + sum);

	}

}
