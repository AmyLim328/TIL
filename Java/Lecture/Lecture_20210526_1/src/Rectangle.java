
public class Rectangle extends Shape {
	int width, height;
	
	public Rectangle() {
		this(0, 0, 0, 0);
	}
	
	public Rectangle(int x, int y, int w, int h) {
		super(x, y);
		this.width = w;
		this.height = h;
	}
	
	@Override
	public void draw() {
		System.out.println("Rectangle Draw");
	}
	
}
