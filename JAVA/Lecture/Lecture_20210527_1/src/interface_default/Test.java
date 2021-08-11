package interface_default;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyInterface mi1 = new MyClassA();
		MyInterface mi2 = new MyClassB();
		
		mi1.method1();
		mi1.method2();
		
		mi2.method1();
		mi2.method2();
	}

}
