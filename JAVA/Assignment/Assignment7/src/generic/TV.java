package generic;

public class TV {
	int id;

	public TV() {
	}

	public TV(int id) {
		this.id = id;
	}

	public String toString() {
		return String.format("TV : %d", id);
	}

}
