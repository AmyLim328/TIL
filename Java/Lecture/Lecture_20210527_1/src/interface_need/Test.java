package interface_need;


/* 인터페이스 (interface)
 * 
 * 객체와 객체 사이에 상호작용을 나타냄
 * 객체에 필요한 것들을 정의해논 타입
 * 
 * 인터페이스에 올 수 있는 것 (2가지 + 2가지)
 * - 상수
 * - 추상 메소드 (abstract): 인터페이스에서 구현이 안되어있음 (선언)
 * abstract void method();
 * 인터페이스를 implements 받은 클래스에서 무조건 재정의해야함
 * 
 * - 디폴트 메소드 (default): 인터페이스에서 구현이 되어있음
 * 인터페이스를 implements 받은 클래스에서 재정의 가능
 * 
 * - 정적 메소드 (static)
 * 
 * 인터페이스의 역할
 * : 개발 코드를 수정하지 않고 사용하는 객체를 변경할 수 있게 하기 위해서
 * 
 * */

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// Drawable interface
		// Circle, Triangle, Rectangle implements
		
		Drawable[] array = new Drawable[3];
		array[0] = new Circle();
		array[1] = new Triangle();
		array[2] = new Rectangle();
		
		array[0] = new Triangle(); // 객체의 변경
		
		for(int i = 0; i < array.length; i ++) {
			array[i].draw();
		}
		

	}

}
