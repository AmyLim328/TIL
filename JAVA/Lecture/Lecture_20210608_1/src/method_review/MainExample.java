package method_review;

public class MainExample {
	// 필드
	
	
	// 함수
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int x = 10;
		int y = 20;
		
		// 1
		int res = add(10, 20);
		System.out.println(res);
		
		// 2
		add_void(10, 20);
		
		
	}
	
	public static int add(int a, int b) {
		return a + b;
	}
	
	public static void add_void(int a, int b) {
		System.out.println(a + b);
	}
	
}
