package interface_need;

public class Circle extends Shape implements Drawable{
	private int radius;
	
	@Override
	public void draw() {
		// TODO Auto-generated method stub
		System.out.println("Circle Draw");
	}

}
