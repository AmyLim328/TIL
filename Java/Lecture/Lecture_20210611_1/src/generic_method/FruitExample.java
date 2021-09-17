package generic_method;

import java.util.Comparator;

public class FruitExample  {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Fruit<String, Integer> fruit1 = 
				new Fruit<>("수박", 15000);
		
		Fruit<String, Integer> fruit2 = 
				new Fruit<>("수박", 15000);
		boolean res = 
				FruitExample.
				compare(fruit1, fruit2);
		
		System.out.println((res) ? "동일" : "다름");		
//		if(res) {
//			System.out.println("동일");
//		}
//		else {
//			System.out.println("다름");
//		}
		// 1) 객체 2개 생성
		// <String, Integer>
		// String: 과일 이름
		// Integer: 과일 가격
		
		// 2) 두 객체가 동일한 내용물을 갖는지 
		// 확인하는 compare 함수 
		// (FruitExample 클래스의 정적 메소드)를 작성
		// public static <T, P> 
		// boolean compare(Fruit<T, P>p1, Fruit<T, P>p2)
	} // main 함수 끝

	
	
	public static <T, P> boolean 
	compare(Fruit<T, P>p1, Fruit<T, P>p2) {
		return p1.getName().equals(p2.getName())
		&& p1.getPrice().equals(p2.getPrice());
		// ???????
	}

}
