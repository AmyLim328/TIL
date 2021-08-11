package stream_collect;

import java.util.*; // Collection
import java.util.stream.*; // Stream


public class CollectExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<Member> m = Arrays.asList(
				new Member("홍길동", Member.Gender.MALE, 
						Member.City.Pusan , 30),
				new Member("홍길순", Member.Gender.FEMALE, 
						Member.City.Seoul , 25),
				new Member("박박박", Member.Gender.MALE, 
						Member.City.Seoul , 40),
				new Member("이클립", Member.Gender.MALE, 
						Member.City.Seoul , 45),
				new Member("김자바", Member.Gender.FEMALE, 
						Member.City.Pusan , 35)
				);
		
		// 남성 회원만 묶어서 List 생성 (collect())
		List<Member> maleList = m.stream()
				.filter(s -> s.getGender() == Member.Gender.MALE)
				.collect(Collectors.toList());
		maleList.stream()
		.forEach(s -> System.out.println(s.getName()));
		System.out.println();
		
		// 여성 회원만 묶어서 Set 생성 (collect())
		Set<Member> femaleList = m.stream()
				.filter(s -> s.getGender() == Member.Gender.FEMALE)
				.collect(Collectors.toSet());
		
		femaleList.stream()
		.forEach(s -> System.out.println(s.getName()));
		System.out.println();
		
		// 서울에 살고 있는 여성 회원만 묶어서 Set 생성 (collect())
		Set<Member> femaleList2 = m.stream()
				.filter(s -> s.getGender() == Member.Gender.FEMALE)
				.filter(s -> s.getCity() == Member.City.Seoul)
				.collect(Collectors.toSet());
		
		femaleList2.stream()
		.forEach(s -> System.out.println(s.getName()));
		System.out.println();
		
		// 나이가 30이상인 여성 회원만 묶어서 Set 생성 (collect())
		Set<Member> femaleList3 = m.stream()
				.filter(s -> s.getGender() == Member.Gender.FEMALE)
				.filter(s -> s.getAge() >= 30)
				.collect(Collectors.toSet());
		femaleList3.stream()
		.forEach(s -> System.out.println(s.getName()));
		System.out.println();
	}

}
