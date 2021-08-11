package string_tokenizer;


import java.util.StringTokenizer;

public class StringTokenizerExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 * StringTokenizer 클래스의 생성자
		 * 첫 번째 매개변수: 전체 문자열
		 * 두 번째 매개변수: 구분자
		 * 
		 * StringTokenizer st 
		 * = new StringTokenizer("전체 문자열", "구분자");
		 * 
		 * ex) "홍길동,홍길순" --> "홍길동", "홍길순"
		 * 토큰 (tokens): 구분자에 의해 잘려난 문자열
		 * 
		 * 메소드
		 * int countTokens(): 남아있는 토큰 수
		 * boolean hasMoreTokens(): 남아있는 토큰이 있는지 여부
		 * String nextToken(): 토큰을 하나씩 꺼내옴
		 * -> 더 이상 가져올 토큰이 없으면 예외 발생
		 * (예외: java.util.NoSuchElementException)
		 * -> nextToken() 사용하기 전에 hasMoreTokens()으로 
		 * 꺼내올 토큰이 있는지 확인함!
		 * 
		 * */
		
		// how1: 전체 토큰 수를 얻어 for문 
		
		String text = "홍길동/이수홍/박연수";
		StringTokenizer st = new StringTokenizer(text, "/");
		int count = st.countTokens();
		
		for(int i = 0; i < count; i ++) {
			String token = st.nextToken();
			System.out.println(token);
		}
		System.out.println();
		
		// how2: 남아있는 토큰을 확인하고 while문
		st = new StringTokenizer(text, "/");
		
		while(st.hasMoreTokens()) {
			String token = st.nextToken();
			System.out.println(token);
		}
		// "홍길동/이수홍/박연수"
	}

}
