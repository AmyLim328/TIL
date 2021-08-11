package generic_multi_type;

public class SmartPhone {
	int id;

	public SmartPhone() {}
	public SmartPhone(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String toString() {
		return "¸ðµ¨ ¹øÈ£: " + id ;
	}
}
