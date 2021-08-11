package ex3;

public class Box {
	private static int count = 0;
	private double height;
	private double width;
	private double depth;
	private boolean isEmpty;
	
	Box (){
		isEmpty = false;
		count ++;
	}
	Box (double h, double w, double d){
		height = h;
		width = w;
		depth = d;
		isEmpty = false;
		count ++;
	}
	public static int getCount() {
		return count;
	}
	
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public double getWidth() {
		return width;
	}
	public void setWidth(double width) {
		this.width = width;
	}
	public double getDepth() {
		return depth;
	}
	public void setDepth(double depth) {
		this.depth = depth;
	}
	public boolean isEmpty() {
		return isEmpty;
	}
	public void setEmpty(boolean isEmpty) {
		this.isEmpty = isEmpty;
	}
	public String toString() {
		return "높이 : " + height + ", 가로 : " + width + ", 세로 : " + depth + ", empty : " + isEmpty;
	}
	
	
	
}
