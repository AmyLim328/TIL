
public class StringTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s1 = new String("Hello");
		String s2 = new String("Hello");
		String s3 = "Hello";
		String s4 = "Hello";
		
		// String (��������)���� '=='�� �ּҰ��� �� 
		// ���빰�� �� X
		System.out.println(s1 == s2);
		System.out.println(s3 == s4);
		
		s3 = "Hi";
		System.out.println(s3 == s4);
		System.out.println(); // enter
		
		// String���� ���빰�� �񱳴� ��� �ϳ���?
		// equals() �Լ� �̿�
		System.out.println(s1.equals(s2));
		System.out.println(s3.equals(s4));
		
	}

}
