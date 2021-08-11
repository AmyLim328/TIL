package nested_class;


// 중첩 클래스 (nested class):
/* public class {
	 private class {
	 }
    }
*
*/
public class OuterClass {
	private String secret = "Time is money";
	
	// 생성자
	public OuterClass() {
		InnerClass obj = new InnerClass();
		obj.method();
	}
	
	private class InnerClass{
		public InnerClass() {
			System.out.println("내부 클래스 생성자");
		}
		
		public void method() {
			System.out.println(secret);
		}
	}
	
	
}
