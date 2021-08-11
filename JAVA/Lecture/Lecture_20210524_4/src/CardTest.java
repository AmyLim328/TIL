
public class CardTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println(Card.getHeight());
		System.out.println(Card.getWidth());
		
		Card c1 = new Card("스페이드", 10);
		Card c2 = new Card("하트", 7);
		
		System.out.println(Card.getHeight());
		System.out.println(Card.getWidth());
		System.out.println(c1);
		System.out.println(c2);
	}

}
