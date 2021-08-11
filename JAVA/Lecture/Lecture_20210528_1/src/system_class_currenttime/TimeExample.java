package system_class_currenttime;

public class TimeExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		long time1 = System.currentTimeMillis();
		
		try {
			Thread.sleep(5000); // 5√ 
		}
		catch(InterruptedException e) {
			System.out.println(e);
		}
		
		long time2 = System.currentTimeMillis();
		
		System.out.println((time2 - time1) / 1000 + "sec");
		System.out.println((time2 - time1) + "millisec");
	
	}

}
