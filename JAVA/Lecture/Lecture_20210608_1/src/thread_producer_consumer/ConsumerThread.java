package thread_producer_consumer;

public class ConsumerThread extends Thread {
	private Buffer buffer;
	
	public ConsumerThread(Buffer buffer) {
		this.buffer = buffer;
	}
	
	@Override
	public void run() {
		for(int i = 1; i <= 3; i ++) {
			String data = buffer.getData();
		}
	}
}
