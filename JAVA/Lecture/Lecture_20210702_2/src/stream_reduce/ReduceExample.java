package stream_reduce;

import java.util.*;
import java.util.stream.*;


public class ReduceExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] arrInt = {10, 2, 5};
		
		int sub = Arrays.stream(arrInt).
				reduce((a, b) -> a - b).getAsInt();
		// (a, b)
		// (10, 2) => 8
		// (8, 5) => 3
		
		System.out.println(sub);
		
		List<String> words = Arrays.asList(
				"banana",
				"watermelon",
				"apple"
				);
		
		// reduce(람다식 (삼항 연산자)) 함수를 통해서 
		// words 중 가장 긴 단어를 반환
		
		String longestStr = words.stream()
				.reduce("", (str1, str2) 
						-> str1.length() 
						> str2.length() ? 
								str1 : str2);
		System.out.println(longestStr);
		System.out.println();
		
		// "banana watermelon apple"
		System.out.println("[디폴트형이 있는 경우 (String으로 반환)]");
		String concateStrwithDefault = words.stream()
				.reduce("", (str1, str2) 
						// "banana", "watermelon"
						// "banana watermelon", "apple"
						-> str1 + " " + str2);
		System.out.println(concateStrwithDefault);
		System.out.println();
		
		System.out.println("[디폴트형이 없는 경우 (Optional<String> 클래스로 반환)]");
		
		// "banana watermelon apple"
		Optional<String> concateStr = words.stream()
				.reduce((str1, str2) 
						// "banana", "watermelon"
						// "banana watermelon", "apple"
						-> str1 + " " + str2);
		
		
		// 방법 1 (isPresent())
		System.out.print("1) isPresent() : ");
		if(concateStr.isPresent()) 
			System.out.println(concateStr.get());
		
		
		// 방법 2 (orElse)
		System.out.print("2) orElse() : ");
		String str = words.stream()
		.reduce((str1, str2) 
				// "banana", "watermelon"
				// "banana watermelon", "apple"
				-> str1 + " " + str2).orElse("");
		System.out.println(str);
		
		
		// 방법 3 (ifPresent())
		System.out.print("3) ifPresent() : ");
		words.stream()
		.reduce((str1, str2) 
				// "banana", "watermelon"
				// "banana watermelon", "apple"
				-> str1 + " " + str2)
		.ifPresent(s -> System.out.println(s));
		
		
		
		
	}

}
