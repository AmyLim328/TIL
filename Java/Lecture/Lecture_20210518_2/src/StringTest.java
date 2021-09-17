
public class StringTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s1 = new String("Hello");
		String s2 = new String("Hello");
		String s3 = "Hello";
		String s4 = "Hello";
		
		// String (참조변수)에서 '=='는 주소값의 비교 
		// 내용물의 비교 X
		System.out.println(s1 == s2);
		System.out.println(s3 == s4);
		
		s3 = "Hi";
		System.out.println(s3 == s4);
		System.out.println(); // enter
		
		// String에서 내용물의 비교는 어떻게 하나요?
		// equals() 함수 이용
		System.out.println(s1.equals(s2));
		System.out.println(s3.equals(s4));
		
	}

}
