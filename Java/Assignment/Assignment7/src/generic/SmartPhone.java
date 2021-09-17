package generic;

public class SmartPhone {
	int id;

	public SmartPhone() {
	}

	public SmartPhone(int id) {
		this.id = id;
	}

	public String toString() {
		return String.format("SmartPhone : %d", id);
	}

}
