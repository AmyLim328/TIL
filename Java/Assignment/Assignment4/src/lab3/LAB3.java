package lab3;

import java.util.Scanner;

public class LAB3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);

		String str;

		System.out.print("메세지를 입력하시오 : ");
		str = input.nextLine();

		char[] res = new char[str.length()];

		for (int i = 0; i < str.length(); i++) {
			res[i] = str.charAt(i);

			if (i == 0 || str.charAt(i - 1) == ' ') {
				if (str.charAt(i) >= 'A' && str.charAt(i) <= 'Z') {
					res[i] = (char) (str.charAt(i) + ('a' - 'A'));
				}
			} else {
				if (str.charAt(i) >= 'a' && str.charAt(i) <= 'z') {
					res[i] = (char) (str.charAt(i) + ('A' - 'a'));
				}
			}
		}
		System.out.println(res);

	}

}
