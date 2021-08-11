package synchronized_using_block;

public class MainThread {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		GameID gameID = new GameID(); // °øÀ¯ °´Ã¼
		User1 user1 = new User1();
		user1.setGameID(gameID);
		user1.start();
		
		User2 user2 = new User2(); 
		user2.setGameID(gameID);
		user2.start();
	}

}
