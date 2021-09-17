package thread_join;

public class JoinExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 * join(): 다른 스레드의 종료를 기다림
		 * 
		 * why?
		 * 계산 작업을 하는 스레드가 따로 정의되어있을 경우,
		 * 계산의 결과값을 받아 메인 스레드 (호출한 스레드)
		 * 에서 이용하는 경우
		 *  
		 * */
		
		PIThread piThread = new PIThread();
		piThread.start();
		
//		try {
//			piThread.join();
//		}
//		catch(InterruptedException e) {
//			System.out.println(e.getMessage());
//		}
		System.out.println("PI = " + piThread.getPI());
	}

}
