package thread_state;

public class ThreadStateExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		StatePrintThread state = 
				new StatePrintThread(new TargetThread());
		state.start();
	}

}
