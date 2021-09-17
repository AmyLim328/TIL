package thread_wait_notify;

public class ThreadB extends Thread {
	SharedObject obj;
	
	public ThreadB(SharedObject obj) {
		this.obj = obj;
	}
	
	@Override
	public void run() {
		for(int i = 0; i < 10; i ++) {
			obj.methodB();
		}
	}
}
