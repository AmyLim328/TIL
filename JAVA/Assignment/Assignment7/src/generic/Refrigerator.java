package generic;

public class Refrigerator {
	int id;

	public Refrigerator() {
	}

	public Refrigerator(int id) {
		this.id = id;
	}

	public String toString() {
		return String.format("Refrigerator : %d", id);
	}
}
