package ex2;

public class Plane {
	/*
	 * new
	 * int: 0
	 * String: null
	 * char: null
	 * boolean: false
	 * */
	private static int planes = 0;
	private String producer;
	private String model;
	private int maxPassenger;
	
	// 디폴트 생성자
	Plane() {planes++;}
	
	Plane(String p, String m, int max) {
		producer = p;
		model = m;
		maxPassenger = max;
		planes++;
	}
	
	public static int getPlanes() {
		return planes;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public int getMaxPassenger() {
		return maxPassenger;
	}

	public void setMaxPassenger(int maxPassenger) {
		this.maxPassenger = maxPassenger;
	}
	
	public String toString() {
		return "제작사 : " + producer + 
				", 모델 : " + model + 
				", 최대 승객수 : " + maxPassenger;
	}
	
}
