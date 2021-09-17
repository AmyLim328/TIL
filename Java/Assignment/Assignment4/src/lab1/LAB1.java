package lab1;

import java.util.Scanner;

public class LAB1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);

		String str1;
		int cnt1 = 0, cnt2 = 0, cnt3 = 0;

		System.out.print("문자열을 입력하시오 : ");
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

		System.out.println("소문자의 개수 : " + cnt1);
		System.out.println("대문자의 개수 : " + cnt2);
		System.out.println("문자 E(e)의 개수 : " + cnt3);

		String str2;
		int s_cnt = 0, c_cnt = 0, e_cnt = 0;

		System.out.print("문자열을 입력하시오 : ");
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

		System.out.println("소문자의 개수 : " + s_cnt);
		System.out.println("대문자의 개수 : " + c_cnt);
		System.out.println("문자 E(e)의 개수 : " + e_cnt);

	}

}