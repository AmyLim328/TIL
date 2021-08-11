package stream_pipelines;

import java.util.*;
import java.util.stream.Stream;


public class PipelinesExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<Student> sList = Arrays.asList(
				new Student("홍길동", 30),
				new Student("이클립", 50),
				new Student("김자바", 80)
				);
		
		// 학생들의 성적 평균을 계산
		// 1) 중간 처리: 
		// (학생 객체 -> 점수 매핑) 
		// mapToInt((s)->{s.getScore()})
		
		// 메소드 참조 (Method Reference)
		// : 불필요한 매개변수 제거하기 위해
		// mapToInt(클래스 이름 :: static 메소드이름)
		// mapToInt(객체변수 이름 :: 메소드이름)
		
		// 2) 최종 처리: average()
		
		double avg = sList.stream() // 원본 스트림
				.mapToInt(s -> s.getScore()) // 중간처리 스트림
				.average() // 최종처리 스트림
				.getAsDouble();
		
		System.out.println("평균 점수 : " + avg);
	}

}
