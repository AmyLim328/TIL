package lab4;

import java.util.Scanner;

public class LAB4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);

		String str;
		int fir, sec;
		System.out.print("���ڿ��� �Է��Ͻÿ� : ");
		str = input.nextLine();

		System.out.printf("���ڿ��� �ε��� ���� 0 ~ %d \n", str.length() - 1);

		System.out.print("�˻��� ù��° ��ġ �Է��Ͻÿ� : ");
		fir = input.nextInt();

		System.out.print("�˻��� �ι�° ��ġ �Է��Ͻÿ� : ");
		sec = input.nextInt();

		char[] res = new char[sec - fir + 1];

		int j = 0;
		for (int i = fir; i <= sec; i++) {

			res[j] = str.charAt(i);
			j++;
		}

		String str_res = new String(res);
		System.out.println(">> ���ڿ� substring ��� : " + str_res);

	}

}
