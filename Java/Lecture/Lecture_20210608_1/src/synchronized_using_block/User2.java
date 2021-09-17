package synchronized_using_block;

public class User2 extends Thread {
	GameID gameID;
	
	public User2() {
		setName("User2 Thread");
	}
	
	// 공유 객체인 GameID를 User2 필드에 저장
	public void setGameID(GameID gameID) {
		this.gameID = gameID;
	}
	
	// User2 Thread 작업 내용
	public void run() {
		// 공유 객체인 GameID의 아이템을 50으로 저장
		gameID.setItem(50); 
	}
}
