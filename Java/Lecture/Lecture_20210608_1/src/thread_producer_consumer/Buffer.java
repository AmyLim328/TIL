package thread_producer_consumer;

public class Buffer {
	private String data;

	// 소비자가 호출
	public synchronized String getData() {
		
		// 소비자가 소비할 data가 없음!
		if(this.data == null) {
			try {
				wait();
			}
			catch(InterruptedException e) {
				System.out.println(e.getMessage());
			}
			
		}
		//
		String res = data;
		System.out.println("소비자가 소비한 데이터 : " 
				+ res);
		
		data = null;
		notify();
		return res;
	}

	// 생산자가 호출
	public synchronized void setData(String data) {
		
		// 소비자가 data를 소비하지 않았으면
		if(this.data != null) {
			try{
				wait(); // 생산자 일시 정지
			}
			catch(InterruptedException e) {
				System.out.println(e.getMessage());
			}
		}
		//
		
		this.data = data; // 데이터 생성
		System.out.println("생산자가 생성한 데이터 : "
				+ data);
		notify(); // 소비자에게 알림 (실행 대기 상태)
	
	}
	
}
