package thread_join;

public class PIThread extends Thread{
	double PI;
	
	// PI = 4/1 - 4/3 + 4/5 - 4/7 .... (1000¹ø)
	public void run() {
		int x = 4;
		int y = 1;
		for(int i = 0; i < 1000; i ++) {
			PI += x / (double)y;
			x = -x;
			y = y + 2;
		}
	}

	public double getPI() {
		return PI;
	}

	public void setPI(double pI) {
		PI = pI;
	}
	
	
}
