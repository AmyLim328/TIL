package thread_state;

public class TargetThread extends Thread{
	
	@Override
	public void run() {
		for(long i = 0; i < 2000000000; i++ ) {
			
		}
		
		try {
			Thread.sleep(1500); // 1.5초 일시 정지
		}
		catch(InterruptedException e) {
			System.out.println(e.getMessage());
		}
		
		for(long i = 0; i < 2000000000; i++ ) {
			
		}
		
	}

}
