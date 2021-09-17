package day5ex2;

public class Plane {
	private static int planes;
	private String producer;
	private String model;
	private int maxPassenger;

	// 디폴트 생성자
	Plane() {
		planes++;
	}

	Plane(String p, String m, int max) {
		producer = p;
		model = m;
		maxPassenger = max;
		planes++;
	}

	public static int getPlanes() {
		return planes;
	}

	public static void setPlanes(int planes) {
		Plane.planes = planes;
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
		return String.format("제작사 : %s \n모델의 이름 : %s \n최대 승객 수 : %d", producer, model, maxPassenger);
	}

}