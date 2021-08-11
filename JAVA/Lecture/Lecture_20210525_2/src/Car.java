
public class Car {
	protected int ID; // 자동차 일련번호
	protected String model; // 모델 이름
	protected String color; // 자동차 색깔
	protected int speed; // 현재 속도
	
	public Car() {}
	
	public Car(int ID, String model, 
			String color, int speed) {
		this.ID = ID;
		this.model = model;
		this.color = color;
		this.speed = speed;
	}
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getSpeed() {
		return speed;
	}
	public void setSpeed(int speed) {
		this.speed = speed;
	}
	
	// toString 함수: Object 클래스
	// 상속받은 Car 클래스에서 다시 정의 (재정의, override)
	
	// 오버라이딩 (재정의, overriding): 상속받은 함수 내용 재정의
	
	@Override // annotation (인용)
	public String toString() {
		return "일련번호 :" + ID +
				", 모델 이름 :" + model +
				", 색상 : " + color +
				", 속도 : " + speed;
	}
	
}
