package thread_producer_consumer;

public class ProducerThread extends Thread {
	private Buffer buffer;
	
	public ProducerThread(Buffer buffer) {
		this.buffer = buffer;
	}
	
	@Override
	public void run() {
		for(int i = 1; i <= 3; i++) {
			String data = "Data " + i;
			buffer.setData(data);
		}
	}
}
