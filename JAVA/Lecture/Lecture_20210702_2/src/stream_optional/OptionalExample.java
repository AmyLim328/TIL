package stream_optional;

import java.util.*;
import java.util.stream.*;


public class OptionalExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		List<Integer> list = new ArrayList<>();
		// list의 요소가 비어있음
		
		// list의 요소가 비어있을 경우 average() 함수 실행
//		double avg = list.stream().mapToInt(s -> s.intValue())
//				.average().getAsDouble();
//				// Integer (객체) ->  int (기초자료형)
//		System.out.println(avg);
//		// NoSuchElementException: list안에 처리할 요소가 없음
//		System.out.println("Hello!"); // 
		
		
		// OptionalDouble average()
		// 요소가 없을 경우 디폴트 값 생성할 수 있음
		
		// 방법 1 (isPresent())
		// (OptionalDouble 
		// (isPresent(), ifPresent(), orElse()) -> double) 
		OptionalDouble op1
		= list.stream().mapToInt(s -> s.intValue()).average();
		if(op1.isPresent()) { // OptionalDouble의 isPresent() 값 있는지 확인
			System.out.println("평균 : " + op1.getAsDouble());
		}
		else {
			System.out.println("평균 : 0.0");
		}
		
		// 방법 2 (orElse())
		double avg
		= list.stream().mapToInt(s -> s.intValue())
		.average().orElse(0.0); // 요소값이 없을 경우 디폴트 값 지정
		System.out.println("평균 : " + avg);
		
		// 방법 3 (ifPresent(DoubleConsumer // 요소를 소비하는 코드))
		list.stream().mapToInt(s -> s.intValue())
		.average()
		.ifPresent(a -> System.out.println("평균 : " + a));
		// 값이 없을 때는 출력 자체가 X
		// 값이 있을 때만 요소 소비 코드를 통해 소비함
		
	}

}
