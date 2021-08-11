
public class Triangle extends Shape {
	int base, height;
	
	public Triangle() {
		this(0, 0, 0, 0);
	}
	
	public Triangle(int x, int y, int b, int h) {
		super(x, y);
		base = b;
		height = h;
	}
	@Override
	public void draw() {
		System.out.println("Triangle Draw");
	}
	
	

}
