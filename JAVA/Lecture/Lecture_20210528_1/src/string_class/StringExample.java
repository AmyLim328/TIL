package string_class;

public class StringExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s1 = new String("Hello");
		String s2 = new String("Java");
		
		// 인덱스: 문자열 0 ~ 번호를 매김
		// 인덱싱: 해당 인덱스의 문자를 추출
		//System.out.println(s1[1]); // 불가
		System.out.println(s1.charAt(1));
		// s1.charAt(1) = 'E'; // 불가
		
		
		System.out.println(s1.equals(s2));
		System.out.println(s1.substring(1, 4));
		
		
		String s3 = s1.toLowerCase();
		String s4 = s2.toUpperCase();
		
		System.out.println(s3);
		System.out.println(s4);
	}

}
