package interface_default;

public class MyClassB implements MyInterface{

	@Override
	public void method1() {
		// TODO Auto-generated method stub
		System.out.println("MyClassB - method1()");
	}

	// default 메서드는 
	// 재정의가 필수적이지 않지만 재정의도 할 수 있음
	@Override
	public void method2() {
		System.out.println("MyClassB - method2()");
	}
}
