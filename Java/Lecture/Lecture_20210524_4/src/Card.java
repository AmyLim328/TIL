
public class Card {
	private final String kind; // 무늬
	private final int num; // 숫자
	
	private final static int width = 100;
	private final static int height = 250;
	/*
	 * final: 더 이상 데이터를 바꿀 수 없음 (상수 정의)
	 * 
	 * static: 동일 클래스 안에서 모든 객체들이 
	 * 동일한 width, height를 가짐
	 * 
	 * */
	
	public Card(String k, int n) {
		this.kind = k;
		this.num = n;
	}
	public String getKind() {
		return kind;
	}
	
	public int getNum() {
		return num;
	}
	
	public static int getWidth() {
		return width;
	}
	public static int getHeight() {
		return height;
	}
	
	public String toString() {
//		return "무늬 : " + this.kind + ", " +
//				"숫자 : " + this.num + ", " +
//				"가로 : " + Card.width + ", " +
//				"세로 : " + Card.height;
		return String.format("무늬 : %5s, 숫자 : %2d, "
				+ "가로 : %3d, 세로 : %3d", 
				this.kind, this.num, Card.width, Card.height);
	}
	
	
}
