import java.util.Scanner;

public class Test {

	public static void main(String[] args) {

		// TODO Auto-generated method stub
		// 증감 연산자
		// ++a, a++ : a = a + 1
		// --a, a-- : a = a - 1
		
		int x = 1;
		int y = 1;
		
		int nextx = ++x;
		// 1. ++x // x = x + 1
		// 2. nextx = x
		System.out.println("nextx : " + nextx);
		System.out.println("x : " + x);
		
		int nexty = y++;
		// 1. nexty = y
		// 2. y++
		System.out.println("nexty : " + nexty);
		System.out.println("y : " + y);
		
		x = 3;
		y = 2;
		x ++; // ++x;
		y ++; // ++y;
		
		
		Scanner input = new Scanner(System.in);
	
		
		/* 1. 구트 학원 시험을 봤는데 합격할 수 있을까요 ?
		 * 프로그래밍 기초 필기 / 실기 성적을 입력받음
		 * - 1) 필기나 실기를 90점 이상 받거나
	       - 2) 필기와 실기 점수의 평균이 70점 이상이거나
		 */
		
		int written_score; // 90 80 70 
		int prac_score;
		int avg; // average
		boolean isPass; // true or false
		
		System.out.print("프로그래밍 기초 필기 성적을 입력하시오 : ");
		written_score = input.nextInt();
		
		System.out.print("프로그래밍 기초 실기 성적을 입력하시오 : ");
		prac_score = input.nextInt();
		
		avg = (written_score + prac_score) / 2;
		
		isPass = ((written_score >= 90) || (prac_score >= 90)) 
				|| (avg >= 70);
	
		
		System.out.println("합격여부 : " + isPass);
		
		/* 2. 유치원 학생 A가 있는데, 초등학교에 가려면 아래의 조건에 만족해야합니다.
		 * - 1) 키가 140cm 이상이거나
		 * - 2) 나이가 8살 이상이거나
		 * 
		 * 학생 A는 초등학교에 갈 수 있을까요?
		 * */
		
		int height, age;
		boolean isSchool;
		
		System.out.print("키를 입력하시오 : ");
		height = input.nextInt();
		
		System.out.print("나이를 입력하시오 : ");
		age = input.nextInt();
		
		isSchool = (height >= 140) || (age >= 8);
		
		System.out.println("학생 A의 초등학교 여부 : " + isSchool);
		
		
		/*3. 삼각형이 될 수 있을까요?
		 * 세 변의 길이를 입력받아 a, b, c
		 * a + b > c가 만족하는지 여부를 출력해보자!
		 * 
		 * 또한, 사용자에게 입력받은 a, b, c를 가지고
		 * 직각 삼각형이 될 수 있는지 출력해보자
		 * (직각 삼각형이 되는 조건 (피타고라스): 
		 *   a * a + b * b == c * c)
		 * 
		 * */
		
		int triA, triB, triC; // 가장 긴 변
		boolean isTri, isPytha;
		
		System.out.print("삼각형의 A 길이는? ");
		triA = input.nextInt();
		
		System.out.print("삼각형의 B 길이는? ");
		triB = input.nextInt();
		
		System.out.print("삼각형의 C 길이는? ");
		triC = input.nextInt();
		
		isTri = triA + triB > triC;
		System.out.println("삼각형 여부 : " + isTri);
		
		isPytha = (isTri == true) &&
				(triA * triA + triB * triB == triC * triC);
		System.out.println("직각 삼각형 여부 : " + isPytha);
		
		
		
	}
}
