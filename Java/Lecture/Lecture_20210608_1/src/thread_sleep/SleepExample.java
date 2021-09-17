package thread_sleep;

public class SleepExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// sleep(): 주어진 시간동안 일시 정지
		
		for(int i = 0; i < 10; i ++) {
			System.out.println("화이팅 !" + (i + 1));
			
			try {
				Thread.sleep(1000);
			}catch(InterruptedException e) {
				System.out.println(e.getMessage());
			}
		}
	}

}
