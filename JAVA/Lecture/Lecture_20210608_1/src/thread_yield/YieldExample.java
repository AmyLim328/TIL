package thread_yield;

public class YieldExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/* - yield(): 다른 스레드에게 실행 양보
		 * 
		 * public void run(){
		 * 	while(true){
		 * 		if(work){
		 * 			sysout("작업 내용")
		 * 		}
		 * 		else {
		 * 			Thread.yield();
		 * 		}
		 * 	}
		 * }
		 * 
		 * 문제점?
		 * work == true: 작업을 함
		 * work == false: 무의미한 반복
		 * 다른 스레드에게 실행 양보
		 * 본인 실행 대기 상태
		 * >> 전체 프로그램 성능에 좋음
		 * 
		 * >> yield() 메소드를 호출한 스레드는 실행 대기 상태
		 * >> 동일한 우선순위나 높은 우선순위를 가지는
		 * 다른 스레드가 실행할 수 있도록 함
		 * 
		 * 
		 * */
		
		ThreadA ta = new ThreadA();
		ThreadB tb = new ThreadB();
		
		ta.start();
		tb.start();
		
		try {
			Thread.sleep(1000);
		}catch(InterruptedException e) {
			e.printStackTrace();
		}
		ta.work = false; // ThreadB만 실행
		
		try {
			Thread.sleep(1000);
		}catch(InterruptedException e) {
			e.printStackTrace();
		}
		ta.work = true; // ThreadA, B 모두 실행
		
		ta.stop = true;
		tb.stop = true;
		
	}

}
