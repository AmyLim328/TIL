package lambda_with_parameter;

public class MyInterfaceParamExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyInterfaceParameter fi;
		
		// MyInterfaceParameter 안에 있는 추상 메소드 정의 (구현)
		fi = (x) -> System.out.println(x * 5);
		fi.method(2);
		// x = 2;
		
		fi = x -> System.out.println(x * 5);
		fi.method(2);
		
		// ? ㅠㅠ
		fi = x -> {
			System.out.println(x * 5);
			System.out.println(x * 6);
			
		};
		fi.method(2);
		
		// 추상메소드: 두 정수의 매개변수
		// 두 정수의 더한 값을 출력하는 람다식을 작성하시오.
		MyInterfaceTwoParameter fii;
		
		// return문만 있을 경우, return과 함께 중괄호 생략가능
		fii = (a, b) -> a + b;
		
		int res = fii.add(3, 5);
		System.out.println(res);
		
		System.out.println(fii.add(3, 5));
		
		fii = (a, b) -> {
			System.out.println("a = " + a 
					+ ", b = " + b);
			return a + b; // return 생략 불가
		};
		System.out.println(fii.add(3, 5));
	}

}
