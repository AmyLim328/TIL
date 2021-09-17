import java.util.Scanner;

public class SwitchTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * 
		 * switch(정수, 문자, 문자열) {
		 * 
		 * case 정수, 문자, 문자열:
		 * 
		 * case 정수, 문자, 문자열:
		 * 
		 * case 정수, 문자, 문자열:
		 * 
		 * 
		 * }
		 * 
		 * int a = 4;
		 * switch(a) {
		 * 
		 * case 1:
		 * 	문장 1;
		 * 	break;
		 * 
		 * case 2:
		 * 	문장 2;
		 * 	break;
		 * 
		 * case 3:
		 * 	문장 3;
		 * 	break;
		 * 
		 * default:
		 * 	문장 4;
		 * 	// break; // 생략이 가능
		 * }
		 * 
		 *
		 *switch 문 종료
		 *break의 용법: switch 종료, 반복문 종료 (***)

		 * */
		
//		int num;
//		Scanner input = new Scanner(System.in);
//		
//		System.out.print("숫자를 입력하시오 : ");
//		num = input.nextInt();
//		
//		/* switch문 제약사항
//		 * 1. 실수 X
//		 * 2. == (equals)만 사용이 가능
//		 * */
//		
//		switch(num) { 
//
//		case 0:
//			System.out.println("숫자 0");
//			break;
//			
//		case 1:
//			System.out.println("숫자 1");
//			break;
//			
//		case 2:
//			System.out.println("숫자 2");
//			break;
//			
//		default:
//			System.out.println("0, 1, 2는 아님 !!");
//			//break;
//		}
//		System.out.println("switch문 밖");
//		//
		
		// 사용자에게 jan, feb, mar ==> 1, 2, 3
//		String month;
//		Scanner input = new Scanner(System.in);
//		
//		System.out.print("월을 문자열로 입력하시오 : (jan, feb, mar) ");
//		month = input.next();
//		
//		switch (month) {
//		case "jan":
//			System.out.println("1월");
//			break;
//			
//		case "feb":
//			System.out.println("2월");
//			break;
//			
//		case "mar":
//			System.out.println("3월");
//			break;
//			
//		default:
//			System.out.println("1, 2, 3월이 아님!");
//			break;	
//		}
		
		// 문자 하나를 입력받아 모음과 자음을 분별하는 프로그램
//		char ch;
//		String ch_str;
//		Scanner input = new Scanner(System.in);
//		
//		System.out.print("문자 하나를 입력하시오 : ");
//		ch = input.next().charAt(0);
//		// if (ch == 'a' || ch == 'e' || ch == 'i' ||
//		// ch == 'o' || ch == 'u')
//		
//		// ==: switch로 작성하시는 게 가독성이 좋을 때도 있음
//		
//		if (ch >= 'A' && ch <= 'Z') {
//			ch = (char)(ch + ('a' - 'A'));
//		}
//		
//		switch(ch) {
//		case 'a', 'e', 'i', 'o', 'u': 
//			ch_str = "모음";
//			break;
//		
//		default:
//			ch_str = "자음";
//			break;
//		}
//		System.out.println(ch_str);
//		
		
		// 사용자에게 1 ~ 12월 사이의 정수값으로 연도와 월을 입력받아
		// 해당 월에 총 일수를 계산하는 프로그램을 작성해주세요!
		// 1, 3, 5, 7, 8, 10, 12 => 31
		// 4, 6, 9, 11 => 30
		// 2 => 29 (윤년), 28 (평년)
		
		// * 윤년을 판단하는 방법
		// 1. 연도가 4의 배수이고 동시에 100의 배수가 아님
		// 2. 연도가 400의 배수
		
		// 연도, 월
		int year, month, days;
		Scanner input = new Scanner(System.in);
		
		System.out.print("연도를 입력하시오 : ");
		year = input.nextInt();
		
		System.out.print("월을 입력하시오 : ");
		month = input.nextInt();
		
		switch(month) {
		case 1, 3, 5, 7, 8, 10, 12:
			days = 31;
			break;
		
		case 4, 6, 9, 11:
			days = 30;
			break;
		
		
		case 2:
			if ((year % 4 == 0) && (year % 100 != 0)
					|| (year % 400 == 0)) { // 윤년
				days = 29;
			}
			else { // 평년
				days = 28;
			}
			break;
			
		default:
			days = -1; // 오류
		
		}
		
		if (days == -1) {
			System.out.println("유효하지 않은 월입니다.");
			System.out.println("1 ~ 12 사이의 값을 입력하시오.");
		}
		else {
			System.out.printf("%d월 총 일수 = %d", month, days);
		}
	}

}
