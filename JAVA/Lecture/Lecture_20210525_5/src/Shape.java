/*
 * 추상 클래스 (abstract class)
 * : 클래스가 완성된 설계도라고 하면
 * '미완성 설계도'
 * 
 * : 추상 메서드를 포함하고 있는 클래스
 * (추상 메서드: 선언만 되어있고 구현하지 않은 메서드)
 * 
 * */
public abstract class Shape {
	int x, y;
	
	public void move(int x, int y) {
		this.x = x;
		this.y = y;
	}
	
	public abstract void draw();
}
