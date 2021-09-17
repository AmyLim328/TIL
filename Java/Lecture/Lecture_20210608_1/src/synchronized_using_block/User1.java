package synchronized_using_block;

public class User1 extends Thread {
	GameID gameID;
	
	public User1() {
		setName("User1 Thread");
	}
	
	// 공유 객체인 GameID를 User1 필드에 저장
	public void setGameID(GameID gameID) {
		this.gameID = gameID;
	}
	
	// User1 Thread 작업 내용
	public void run() {
		// 공유 객체인 GameID의 아이템을 100으로 저장
		gameID.setItem(100); 
	}
}
