package lab4;

import java.util.Scanner;

public class LAB4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);

		String str;
		int fir, sec;
		System.out.print("문자열을 입력하시오 : ");
		str = input.nextLine();

		System.out.printf("문자열의 인덱스 범위 0 ~ %d \n", str.length() - 1);

		System.out.print("검색할 첫번째 위치 입력하시오 : ");
		fir = input.nextInt();

		System.out.print("검색할 두번째 위치 입력하시오 : ");
		sec = input.nextInt();

		char[] res = new char[sec - fir + 1];

		int j = 0;
		for (int i = fir; i <= sec; i++) {

			res[j] = str.charAt(i);
			j++;
		}

		String str_res = new String(res);
		System.out.println(">> 문자열 substring 결과 : " + str_res);

	}

}
