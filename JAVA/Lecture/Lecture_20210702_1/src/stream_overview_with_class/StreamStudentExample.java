package stream_overview_with_class;

import java.util.*; // 컬렉션 사용
import java.util.stream.Stream; // Stream 클래스


public class StreamStudentExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		List<Student> list = Arrays.asList(
				new Student("홍길동", 90),
				new Student("이클립", 90)
				);
				
		// 1. Stream<Student> 
		// 각 Student 객체를 반복하는 스트림을 얻음
		// 2. Student 객체의 필드 (이름과 성적)을 출력
		Stream<Student> stream = list.stream();
		stream.forEach((s) -> { 
				System.out.println(s.getName());
				System.out.println(s.getScore());
		});
		// s: list에 저장된 각 객체 (Student 형의)
		
	}

}
