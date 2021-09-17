package interface_default;

public interface MyInterface {
//	int A = 3;
	public void method1(); // abstract method
	
	// 인터페이스 추가 메소드 구현
	// abstract: MyInterface를 implements 받는 ClassA, B를 수정
	// default: MyInterface를 implements 받는 ClassA, B를 수정하지 않아도 O
	public default void method2() {
		System.out.println("MyInterface - method2()");
	}
}
