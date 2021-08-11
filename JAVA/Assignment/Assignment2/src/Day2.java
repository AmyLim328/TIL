import java.util.Scanner;
public class Day2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner input = new Scanner(System.in);
		
		
		
		// 1. 메트로폴리스
		
//		int pop, rich; 
//		boolean isCap, isMetro;
//		
//		System.out.print("수도입니까? (true or false): ");
//		isCap = input.nextBoolean();
//
//		System.out.print("인구 : (단위 : 만) : ");
//		pop = input.nextInt();
//		
//		System.out.print("부자의 수 (단위 : 만) : ");
//		rich = input.nextInt();  
//		
//		isMetro = (isCap == true && pop >= 100) || (rich >=50);
//		System.out.println("메트로폴리스 여부 : " + isMetro);
		
		
		
		// 2. 윤년
		
		int year;
		boolean isLeap;
		
		System.out.print("연도 : ");
		year = input.nextInt();
		
		isLeap = (year % 4 == 0 && year % 100 != 0
				  || year % 400 == 0);
		
		System.out.print("윤년인가? : " + isLeap);
	
		
		
		// 3. 
		
//		double AC, AE, BC, DE;
//		
//		System.out.print("선분 AC를 입력하시오 : ");
//		AC = input.nextDouble();
//		
//		System.out.print("선분 AE를 입력하시오 : ");
//		AE = input.nextDouble();
//		
//		System.out.print("선분 BC를 입력하시오 : ");
//		BC = input.nextDouble();
//		
//		DE = AE * BC / AC;
//		System.out.printf("선분 DE를 입력하시오 : %f ", DE);
		

		
		
	}

}
