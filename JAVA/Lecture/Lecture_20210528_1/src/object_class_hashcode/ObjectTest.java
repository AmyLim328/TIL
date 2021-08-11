package object_class_hashcode;


/* java.lang 패키지 
 * - import 하지 않아도 기본으로 import
 * 
 * Object
 * - boolean equals(Object obj): 객체의 내용이 동일한지 확인
 * - String toString(): 객체 정보를 문자열로 반환 (print()가 호출)
 * 
 * 
 * String
 * Math
 * Wrapper
 * 
 * */
public class ObjectTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Person p1 = new Person("홍길동", 35, "Male");
		Person p2 = new Person("홍길동", 35, "Male");
		
		System.out.println(p1 == p2); // 주소값
		System.out.println(p1.equals(p2)); // 내용값
		
		System.out.println(p1.hashCode());
		System.out.println(p2.hashCode());
		
		p1 = p2;
		System.out.println(p1.hashCode());
		System.out.println(p2.hashCode());
		
		System.out.println(p1.getClass().getName());
		
	}

}
