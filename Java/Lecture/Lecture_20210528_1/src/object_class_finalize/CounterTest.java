package object_class_finalize;

public class CounterTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Counter c = null;
		
		for(int i = 1; i <= 20; i ++) {
			c = new Counter(i);
			
			c = null; // 참조하고 있는 객체가 없음
			System.gc(); // 쓰레기 수집기 호출
		}
	}

}
