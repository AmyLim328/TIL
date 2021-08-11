package day5ex3;

public class Box {
	private int count = 0;
	private double height;
	private double width;
	private double depth;
	private boolean isEmpty = false;

	Box() {
		isEmpty = false;
		count++;
	}

	Box(double h, double w, double d) {
		height = h;
		width = w;
		depth = d;
		isEmpty = false;
		count++;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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
		return String.format("높이 : %.6f, 가로 : %.6f, 세로 : %.6f, empty : %b", height, width, depth, isEmpty);
	}

}