package interface_inheritance;


/*
 * 인터페이스끼리 상속이 가능함
 * 인터페이스끼리는 다중 상속 가능함
 * 
 * 인터페이스 --implements---> 클래스
 * 
 * public interface 하위 인터페이스 
 * extends 상위 인터페이스1, 상위 인터페이스2
 * 
 * 
 * */

public interface InterfaceA {
	public void methodA(); // 추상 메소드
}
