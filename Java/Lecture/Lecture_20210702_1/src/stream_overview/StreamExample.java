package stream_overview;

import java.util.*;
import java.util.stream.Stream;

public class StreamExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		List<String> list = Arrays.asList(
				"딸기", "수박", "파인애플");
		
		// Iterator를 통해 반복 (외부 반복자)
		Iterator<String> iterator = list.iterator();
		
		while(iterator.hasNext()) {
			String s = iterator.next();
			System.out.println(s);
		}
		System.out.println();
		
		
		// Stream을 이용 반복 (내부 반복자) => 간단
		Stream<String> stream = list.stream();
		// 스트림 객체를 얻음
		stream.forEach(name -> System.out.println(name));
		
		
	}

}
