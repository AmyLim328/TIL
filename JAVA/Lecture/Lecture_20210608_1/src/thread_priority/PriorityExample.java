package thread_priority;

public class PriorityExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		for(int i = 1; i <= 20; i ++) {
			CalcThread thread = new CalcThread("thread" + i);
			
			if(i == 20) {
				thread.setPriority(Thread.MAX_PRIORITY);
			}
			else {
				thread.setPriority(Thread.MIN_PRIORITY);
			}
			thread.start();
		}
	}

}
