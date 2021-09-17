package string_builder;

public class StringBuilderExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		StringBuilder sb = new StringBuilder("Java ");
		
		// 문자열 추가
		sb.append("Programming Study");
		System.out.println(sb);
		System.out.println();
		
		sb.insert(4, "2");	
		System.out.println(sb);
		System.out.println();
		
		// 문자열 수정
		sb.setCharAt(4, '3');
		System.out.println(sb);
		System.out.println();
		
		// 인덱스 6 ~ 17-1 해당하는 문자열을 "Book"으로 대체
		//sb.replace(6, 17, "Book");
		sb.replace(6, "Programming".length() + 6, "Book");
		System.out.println(sb);
		System.out.println();
		
		// 문자열 삭제
		sb.delete(4, 5); // 인덱스 4부터 인덱스 5전까지 삭제
		System.out.println(sb);
		System.out.println();
		
		// 문자열의 길이
		int len = sb.length();
		System.out.println(len);
		System.out.println();
		
		// 버퍼에 있는 객체를 String 타입으로 변환
		String res = sb.toString();
		System.out.println(res);
		
		
	}

}
