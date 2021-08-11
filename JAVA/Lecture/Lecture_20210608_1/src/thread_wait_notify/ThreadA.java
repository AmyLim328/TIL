package thread_wait_notify;

public class ThreadA extends Thread {
	SharedObject obj;
	
	public ThreadA(SharedObject obj) {
		this.obj = obj;
	}
	
	@Override
	public void run() {
		for(int i = 0; i < 10; i ++) {
			obj.methodA();
		}
	}
}
