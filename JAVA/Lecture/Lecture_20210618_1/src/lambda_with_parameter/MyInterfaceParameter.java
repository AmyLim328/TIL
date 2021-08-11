package lambda_with_parameter;

@FunctionalInterface
public interface MyInterfaceParameter {
	// 추상 메소드를 하나만 작성할 수 있음
	public void method(int x); // 추상 메소드 (재정의 무조건 해줘야 함)
	
	public default void otherMethod(int x) {
		// 디폴트 메소드 내용 ..
	} 
	// 디폴트 메소드 (재정의 선택적)
	
	
	public static void otherMethod2(int x) {
		// 정적 메소드 내용 ..
	}
	
	
}
