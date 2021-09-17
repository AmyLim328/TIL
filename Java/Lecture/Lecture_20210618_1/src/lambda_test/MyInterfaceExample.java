package lambda_test;

public class MyInterfaceExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyInterface fi;
		
		// 익명 객체
		fi = () -> {
			// 추상 메소드를 정의
			String str = "method call1";
			System.out.println(str);
		};
		fi.method();
		
		fi = () -> {System.out.println("method call2");};
		fi.method();
		
		fi = () -> System.out.println("method call3");
		fi.method();
	}

}
