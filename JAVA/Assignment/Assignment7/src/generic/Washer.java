package generic;

public class Washer {
	int id;

	public Washer() {
	}

	public Washer(int id) {
		this.id = id;
	}

	public String toString() {
		return String.format("Washer : %d", id);
	}

}
