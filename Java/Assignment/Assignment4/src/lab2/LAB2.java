package lab2;

import java.util.Scanner;

public class LAB2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);

		String str;
		boolean check = true;

		System.out.print("���ڿ��� �Է��Ͻÿ� : ");
		str = input.next();

		int j = str.length() - 1;

		for (int i = 0; i < str.length(); i++) {
			if (str.charAt(i) != str.charAt(j)) {
				check = false;
				break;
			}
			j--;
		}
		System.out.println((check == true) ? "ȸ���� �½��ϴ�" : "ȸ���� �ƴմϴ�");

	}

}
