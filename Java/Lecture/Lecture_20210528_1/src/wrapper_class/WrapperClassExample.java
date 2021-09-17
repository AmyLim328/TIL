package wrapper_class;

public class WrapperClassExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// Boxing (기초 자료형 -> 객체)
		Integer obj1 = new Integer(100); // 사용 권장하지 않음
		Integer obj2 = new Integer("100"); // 사용 권장하지 않음
		Integer obj3 = Integer.valueOf(100);
		Integer obj4 = Integer.valueOf("100");
		System.out.println(obj1);
		System.out.println(obj2);
		System.out.println(obj3);
		System.out.println(obj4);
		
		// Unboxing (객체 -> 기초 자료형)
		int value1 = obj1.intValue();
		int value2 = obj2.intValue();
		int value3 = obj3.intValue();
		int value4 = obj4.intValue();
		
		System.out.println(value1);
		System.out.println(value2);
		System.out.println(value3);
		System.out.println(value4);
		
		// 자동 박싱, 언박싱
		Integer obj5 = 100; // 자동 박싱
		int value5 = obj5; // 자동 언박싱
		
		// Wrapper 클래스 객체의 비교
		Integer obj6 = 300; // 자동 박싱
		Integer obj7 = 300; // 자동 박싱
		System.out.println(obj6 == obj7); // 주소값은 다름
		System.out.println(obj6.equals(obj7)); // 내용값은 같음
		System.out.println(obj6.intValue() == obj7.intValue());
		
		// 작은 숫자일수록 (0과 가까울수록) 출현빈도가 높음
		// -128 ~ 127는 동일한 주소를 가리키게 함
		// -128 ~ 127은 이미 메모리에 저장되어있음
		Integer obj8 = 10;
		Integer obj9 = 10;
		System.out.println(obj8 == obj9); // 주소값은 다름
		System.out.println(obj8.equals(obj9)); // 내용값은 같음
		System.out.println(obj8.intValue() == obj9.intValue());
		
		
		// String -> int, float, double
		// "parse + 기본타입" (정적 메소드)
		// 문자열을 매개값으로 받아 기본 타입으로 변환
		int value6 = Integer.parseInt("10");
		double value7 = Double.parseDouble("3.14");
		boolean value8 = Boolean.parseBoolean("true");
		
		System.out.println(value6);
		System.out.println(value7);
		System.out.println(value8);
	}

}
