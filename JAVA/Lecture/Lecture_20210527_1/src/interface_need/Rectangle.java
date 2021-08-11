package interface_need;

public class Rectangle extends Shape implements Drawable{
	private int width, height;
	
	@Override
	public void draw() {
		// TODO Auto-generated method stub
		System.out.println("Rectangle Draw");
	}

}
