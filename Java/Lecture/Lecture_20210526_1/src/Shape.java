
// extends ___, ____ (다중 상속 X)
public class Shape implements Movable, AreaCalc{
	protected int x, y;
	
	public Shape() {
		this(0, 0);
	}
	
	public Shape(int x, int y) {
		this.x = x;
		this.y = y;
	}
	
	public void draw() {
		System.out.println("Shape Draw");
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	@Override
	public void move(int dx, int dy) {
		// TODO Auto-generated method stub
		this.x += dx;
		this.y += dy;
		
	}

	@Override
	public double areaCalc() {
		// TODO Auto-generated method stub
		
		
		// arrayofShapes[i].
		if(this instanceof Rectangle) {
			int w = ((Rectangle)this).width;
			int h = ((Rectangle)this).height;
			
			return (double)w * h;
		}
		
		else if(this instanceof Triangle) {
			int b = ((Triangle)this).base;
			int h = ((Triangle)this).height;
			
			return b * h * 0.5; // 1 - double
			//return (b * h) / 2.0; // 2 - int
		}
		
		else if(this instanceof Circle) {
			final double PI = 3.14;
			int r = ((Circle)this).radius;
			
			return r * r * PI;
		}
		return 0;
		
	}	
}
