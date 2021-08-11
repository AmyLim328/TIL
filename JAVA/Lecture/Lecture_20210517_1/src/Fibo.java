import java.util.Scanner;
public class Fibo {

	public static void main(String[] args) {
		/*
		 * 항: 0 1 2 3 4 5 6 7... n
		 * 값: 0 1 1 2 3 5 8 13  
		 *    a b c
		 *      a b c
		 *        a b c
		 *          a b c
		 *            a b c
		 * */	
//		int a = 0;
//		int b = 1;
//		int c = 0;
//		int n;
		Scanner input = new Scanner(System.in);
//		System.out.print("n을 입력하시오 : ");
//		n = input.nextInt();
//		
//		for(int i = 2; i <= n; i++) {
//			c = a + b;
//			a = b;
//			b = c;
//		}
//		if (n == 0) {
//			c = 0;
//		}
//		else if (n == 1) {
//			c = 1;
//		}
//		System.out.printf("%d항 => %d", n, c);
		
		// PI = 3.1415927 .....
		// PI = 3.14 ......
		// 무한 수열
		
		int loop_count;
		double denominator = 1; // 분모
		double numerator = 4; // 분자
		double sum = 0; 
		System.out.print("반복 횟수를 입력하시오 : ");
		loop_count = input.nextInt();
		
		while(loop_count > 0) {
			sum += numerator / denominator;
			// sum = sum + numerator / denominator;
			denominator += 2;
			// denominator = denominator + 2;
			numerator *= -1;
			// numerator = numerator * -1;
			loop_count --;
		}
		System.out.println("PI = " + sum);
	}

}
