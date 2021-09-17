package thread_producer_consumer;

public class PCExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Buffer buffer = new Buffer();
		ProducerThread p = new ProducerThread(buffer);
		ConsumerThread c = new ConsumerThread(buffer);
		
		p.start();
		c.start();
		
	}

}
