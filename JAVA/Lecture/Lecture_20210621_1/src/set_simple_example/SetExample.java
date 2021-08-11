package set_simple_example;

import java.util.*;

public class SetExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Set<String> set = new HashSet<>();
		// 인터페이스는 상수, 추상 메소드
		
		set.add("Java");
		set.add("HTML");
		set.add("CSS");
		set.add("JavaScript");
		set.add("Java"); // 중복 
		
		int size = set.size();
		System.out.println("객체수 : " + size);
		
		// 반복자
		Iterator<String> iterator = set.iterator();
		while(iterator.hasNext()) {
			String element = iterator.next();
			System.out.println("\t" + element);
			// \t: tab 만큼 띄어쓰기
		}
		
		//set.remove(3); 
		// ? 인덱스 개념이 없어서 인덱스를 통한 삭제 불가
		set.remove("JavaScript");
		set.remove("HTML");
		
		size = set.size();
		System.out.println("객체수 : " + size);
		
		// 반복자
		iterator = set.iterator();
		while(iterator.hasNext()) {
			String element = iterator.next();
			System.out.println("\t" + element);
			// \t: tab 만큼 띄어쓰기
		}
		
		System.out.println(set.contains("HTML"));
		set.clear(); // 전체 삭제
		
		// 반복자
		size = set.size();
		System.out.println("객체수 : " + size);
		
		iterator = set.iterator();
		while(iterator.hasNext()) {
			String element = iterator.next();
			System.out.println("\t" + element);
			// \t: tab 만큼 띄어쓰기
		}
		System.out.println(set.isEmpty() ? 
				"비어있음" : "비어있지 않음");
	}
}
