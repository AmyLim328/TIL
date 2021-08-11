package hash_set_hashcode;

import java.util.*;
public class HashSetExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Set<Member> set = new HashSet<Member>();
		// 불가능한 이유 ?
		// Set 인터페이스 추상메소드 -> 객체 생성 불가능
		
		set.add(new Member("홍길동", 40)); // 1
		set.add(new Member("홍길동", 40)); // 2
		
		// 1번 객체 == 2번 객체: 다름 (주소값)
		// 1번 객체.equals(2번 객체): 같음 (내용물)
		// set에 저장된 객체 수 ? 1개
		System.out.println(set.size());
	}

}
