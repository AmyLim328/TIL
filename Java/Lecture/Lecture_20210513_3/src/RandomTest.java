import java.util.Random;
public class RandomTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 * 랜덤값을 추출하는 방법
		 * 1. Random 클래스
		 * import java.util.Random
		 * 
		 * 2. Math 클래스 (**)
		 * : import 받으시지 않으셔도 기본적으로
		 * : 현재 코드 공간에 import 되어있음
		 * 
		 * */
		
//		Random rand = new Random();
//		System.out.println(rand.nextBoolean());
//		// true or false
//		System.out.println(rand.nextFloat());
//		// 0.0 <=       < 1.0
//		System.out.println(rand.nextInt());
//		// 4byte = 32bit
//		// int가 표현할 수 있는 2^32개
//		System.out.println(rand.nextInt(100));
//		// 0 <=    < 100
		
//		int random = (Math.random())
		// 0.0 <= Math.random() < 1.0 (double 값 반환)
		// 0.0 <= (Math.random() * 45) < 45.0
		// 1.0 <= (Math.random() * 45) + 1 < 46.0
		// 1 <= (int)((Math.random() * 45) + 1) < 46
		
		// 0 <= (int)(Math.random()) < 1
		// 0 <= (int)(Math.random() * 45) < 45 // 0 ~ 44
		// 1 <= (int)(Math.random() * 45) + 1 < 46 // 1 ~ 45
		
		int a, b, c, d, e, f;
		a = (int)(Math.random() * 45 + 1);
		b = (int)(Math.random() * 45 + 1);
		c = (int)(Math.random() * 45 + 1);
		d = (int)(Math.random() * 45 + 1);
		e = (int)(Math.random() * 45 + 1);
		f = (int)(Math.random() * 45 + 1);
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		System.out.println(d);
		System.out.println(e);
		System.out.println(f);
		
		
		
		/* 1. 
		 * 1 ~ 10 사이의 랜덤값 하나 추출하여
		 * 1 ~ 4 "작음"
		 * 5, 6 "중간"
		 * 7 ~ 10 "큼"
		 */
		 
		
		// 1. 
		
		int num = (int)(Math.random() * 10) + 1;
		if (num <= 4) {
			System.out.println("작음");
		}
		// num > 4
		else if(num <= 6) {
			System.out.println("중간");
		}
		// num > 6
		else {
			System.out.println("큼");
		}
		
		/* 2. 주사위를 한번 던져서 나오는 눈을 출력
		 * (주사위는 정육면체로 되어있고 1 ~ 6사이의 눈 존재)
		 * */
		int dice = (int)(Math.random() * 6) + 1;
		System.out.println("주사위 눈 : " + dice);
	}

}
