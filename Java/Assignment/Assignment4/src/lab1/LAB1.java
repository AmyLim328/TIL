package lab1;

import java.util.Scanner;

public class LAB1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);

		String str1;
		int cnt1 = 0, cnt2 = 0, cnt3 = 0;

		System.out.print("���ڿ��� �Է��Ͻÿ� : ");
		str1 = input.nextLine();

		for (int i = 0; i < str1.length(); i++) {
			if (str1.charAt(i) >= 'a' && str1.charAt(i) <= 'z') {
				cnt1++;
			}
			if (str1.charAt(i) >= 'A' && str1.charAt(i) <= 'Z') {
				cnt2++;
			}
			if (str1.charAt(i) == 'E' || str1.charAt(i) == 'e') {
				cnt3++;
			}
		}

		System.out.println("�ҹ����� ���� : " + cnt1);
		System.out.println("�빮���� ���� : " + cnt2);
		System.out.println("���� E(e)�� ���� : " + cnt3);

		String str2;
		int s_cnt = 0, c_cnt = 0, e_cnt = 0;

		System.out.print("���ڿ��� �Է��Ͻÿ� : ");
		str2 = input.nextLine();

		for (int i = 0; i < str2.length(); i++) {
			if (str2.charAt(i) >= 'a' && str2.charAt(i) <= 'z') {
				s_cnt++;
			}
			if (str2.charAt(i) >= 'A' && str2.charAt(i) <= 'Z') {
				c_cnt++;
			}
			if (str2.charAt(i) == 'E' || str2.charAt(i) == 'e') {
				e_cnt++;
			}
		}

		System.out.println("�ҹ����� ���� : " + s_cnt);
		System.out.println("�빮���� ���� : " + c_cnt);
		System.out.println("���� E(e)�� ���� : " + e_cnt);

	}

}