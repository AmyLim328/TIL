package interface_need;

public class Triangle extends Shape implements Drawable{
	private int base, height;

	@Override
	public void draw() {
		// TODO Auto-generated method stub
		System.out.println("Triangle Draw");
	}
	
}
