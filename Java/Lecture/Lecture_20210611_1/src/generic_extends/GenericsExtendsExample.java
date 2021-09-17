package generic_extends;

public class GenericsExtendsExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int res1 = compare(10, 20);
		System.out.println(res1);
		
		res1 = compare(10.0, 10);
		System.out.println(res1);
		
//		int res2 = compare("홍길순", "홍길동");
//		System.out.println(res2);	
	}
	// 두 수를 비교하는 함수
	// t1 < t2 => -1
	// t1 == t2 => 0
	// t1 > t2 => 1
	public static <T extends Number> 
	int compare(T t1, T t2) 
	{
		double v1 = t1.doubleValue(); 
		// Number 클래스 함수
		double v2 = t2.doubleValue();
		
		if(v1 < v2) return -1;
		else if(v1 == v2) return 0;
		else return 1;
		
	}
	
}
