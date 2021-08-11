import java.util.Scanner;
public class Lab {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 입력변수: 수도인지 아닌지, 인구의 수, 부자의 수
		
		// Lab1
		boolean isCapital;
		int citizen;
		int riches;
		boolean isMetro;
		Scanner input = new Scanner(System.in);
		
		System.out.print("수도입니까? (true or false) ");
		isCapital = input.nextBoolean();
		
		System.out.print("인구의 수 ? (단위: 만) ");
		citizen = input.nextInt();
		
		System.out.print("부자의 수 ? (단위: 만) ");
		riches = input.nextInt();
		
		// 1. 한 나라의 수도이고, 인구가 100만 이상
		// 2. 부자인 인구가 50만 이상
		isMetro = ((isCapital == true) && (citizen >= 100)) 
				|| (riches >= 50);
		System.out.println("메트로폴리스 여부 : " + isMetro);
		
		input.close();
		
		// Lab2
		int year = 2021;
		boolean leapYear;
//		leapYear = ((year % 4 == 0) && (year % 100 != 0)) ||
//				;
		
		
	}

}
