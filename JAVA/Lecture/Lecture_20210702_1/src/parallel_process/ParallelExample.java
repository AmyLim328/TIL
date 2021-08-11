package parallel_process;

import java.util.*; // Collection
import java.util.stream.Stream;


public class ParallelExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<String> list = Arrays.asList(
				"딸기", "수박", "파인애플");
		
		// 순차 처리
		Stream<String> stream = list.stream();
		stream.forEach(s -> print(s));
		System.out.println();
		
		// 병렬 처리
		Stream<String> pstream = list.parallelStream();
		pstream.forEach(s -> print(s));
	}
	public static void print(String str) {
		System.out.println(str + " : "
				+ Thread.currentThread().getName());
	}
}
