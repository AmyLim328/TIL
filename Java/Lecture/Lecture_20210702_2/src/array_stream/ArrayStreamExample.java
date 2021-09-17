package array_stream;

import java.util.Arrays;
import java.util.stream.Stream;
import java.util.stream.IntStream;

public class ArrayStreamExample {
	static int sum = 0; // 전역변수, 정적 변수 (static)
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// String[]
		String[] strArray = {"홍길동", "홍길순", 
				"김자바", "홍순순", "홍길동"};
		// stream 만들고 forEach를 통해 요소 출력
		Stream<String> strStream1 = Arrays.stream(strArray);
		strStream1.forEach(s -> System.out.println(s));
		System.out.println(); // enter
		
		Stream<String> strStream2 = Arrays.stream(strArray);
		strStream2.filter(n -> n.startsWith("홍길"))
		.forEach(n -> System.out.println(n));
		System.out.println();
		// startsWith("홍")
		// charAt
		
		// distinct(): 중복 제거 후 필터링
		Stream<String> strStream3 = Arrays.stream(strArray);
		strStream3.distinct().filter(n -> n.charAt(0) == '홍' 
				&& n.charAt(1) == '길')
		.forEach(n -> System.out.println(n));
		System.out.println();
		
		Stream<String> strStream4 = Arrays.stream(strArray);
		strStream4.distinct().filter(n -> n.startsWith("홍길"))
		.forEach(n -> System.out.println(n));
		System.out.println();
		
		
		// int[]
		int[] intArrays = {1, 2, 3, 4, 5};
		// stream 만들고 forEach를 통해 요소 출력
		IntStream intStream1 = Arrays.stream(intArrays);
		intStream1.forEach(s -> System.out.println(s));
		//int sum = 0; 
		// static으로 되어야하는 이유 ..?
		// forEach() 함수에서 알게 하기 위함
		IntStream intStream2 = Arrays.stream(intArrays);
		intStream2.forEach(s -> sum += s);
		System.out.println("총합 : " + sum);

		//IntStream.range(1, 5); // 1 <=    < 5
		//IntStream.rangeClosed(1, 5); // 1 <=     <= 5
		
		IntStream intStream3 = IntStream.rangeClosed(1, 5);
		intStream3.forEach(s -> sum += s);
		System.out.println("총합 : " + sum);
		
		
	}

}
