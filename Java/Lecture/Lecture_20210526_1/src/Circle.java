
public class Circle extends Shape {
	int radius;
	
	public Circle() {
		this(0, 0, 0);
	}
	
	public Circle(int x, int y, int r) {
		super(x, y);
		this.radius = r;
	}
	
	@Override
	public void draw() {
		System.out.println("Circle Draaw");
	}

	

}
