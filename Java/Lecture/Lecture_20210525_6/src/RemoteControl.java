
/* 인터페이스 (interface)
 * : 일종의 추상 클래스, 추상 클래스보다 더 추상화 정도 높음
 * : 실제로 구현된 것이 없는 설계도
 * : 상수, 추상메서드 
 * : 상수: public static final ==> 생략 가능
 * : 추상 메서드: public abstract ==> 생략 가능
 * 
 * : 클래스를 만들기 위해서 도움을 줄 목적
 * */
public interface RemoteControl {

	
	public abstract void turnOn();
	public abstract void turnOff();
//	public default void defaultMethod() {
//		System.out.println("default");
//	}

}
