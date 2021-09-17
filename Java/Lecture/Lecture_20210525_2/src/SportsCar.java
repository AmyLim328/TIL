
public class SportsCar extends Car {
	private int turbo;

	
	public SportsCar() {}
	public SportsCar(int ID, String model, 
			String color, int speed, int turbo) {
		// Car 클래스의 생성자 호출
		super(ID, model, color, speed);
		this.turbo = turbo;
	}
	
	
	public int getTurbo() {
		return turbo;
	}

	public void setTurbo(int turbo) {
		this.turbo = turbo;
	}
	@Override // annotation (인용)
	public String toString() {
		return super.toString() + ", 터보 : " + turbo;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof SportsCar) {
			if(ID == ((SportsCar)obj).ID &&
					model == ((SportsCar)obj).model &&
					color == ((SportsCar)obj).color &&
					speed == ((SportsCar)obj).speed &&
					turbo == ((SportsCar)obj).turbo) {
				return true;
			}
		}
		return false;
	}

	
}
