package math_class;

public class MathClassExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int v1 = Math.abs(-5);
		double v2 = Math.abs(-3.14);
		
		System.out.println(v1);
		System.out.println(v2);
		System.out.println();
		
		double v3 = Math.ceil(5.3);
		double v4 = Math.ceil(-5.3);
		
		System.out.println(v3);
		System.out.println(v4);
		System.out.println();
		
		double v5 = Math.floor(5.3);
		double v6 = Math.floor(-5.3);
		
		System.out.println(v5);
		System.out.println(v6);
		System.out.println();
		
		int v7 = Math.max(5, 9);
		double v8 = Math.max(5.3, 2.5);
		System.out.println(v7);
		System.out.println(v8);
		System.out.println();
		
		int v9 = Math.min(5, 9);
		double v10 = Math.min(5.3, 2.5);
		System.out.println(v9);
		System.out.println(v10);
		System.out.println();
		
		double v11 = Math.random();
		System.out.println(v11);
		System.out.println();
		
		// 1 ~ 45 사이 랜덤값
		// 1 ~ 6 사이 랜덤값
		int lotto = (int)(Math.random() * 45) + 1;
		int dice = (int)(Math.random() * 6) + 1;
		System.out.println(lotto);
		System.out.println(dice);
		System.out.println();
		
		double v12 = Math.rint(5.3); // 가까운 정수의 실수값 
		double v13 = Math.rint(-5.7);
		System.out.println(v12);
		System.out.println(v13);
		System.out.println();
		
		long v14 = Math.round(5.3); // 반올림
		long v15 = Math.round(-5.7);
		System.out.println(v14);
		System.out.println(v15);
		System.out.println();
		
	}

}
