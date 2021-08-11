package ex1;


/*
 * */

public class Book {
	protected String title;
	protected int page;
	protected String author;
	
	// 생성자 두 개는 오버로딩 (overload)
	public Book() {
//		title = null;
//		page = 0;
//		author = null;
		
		this(null, 0, null);
		// null: 참조할 객체가 없을 경우 (주소값이 없음)
		
	}
	
	public Book(String title, int page, String author) {
		this.title = title;
		this.page = page;
		this.author = author;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	/*
	 * 오버라이딩 (override): 상속받은 메서드의 내용 변경
	 * 오버로딩 (overload): 동일한 이름의 메서드를 중복 정의
	 * 
	 * 반환형 함수이름 (매개변수)
	 * => 함수 이름 동일
	 * => 매개변수의 타입, 개수, 순서 중 하나가 달라야 함
	 * => 반환형은 영향을 미치지 않음
	 * 
	 * void method(String s, int i) - 1
	 * void method(int i, String s) - 2
	 * int method(int i, String s) - 3
	 * 
	 * */
	@Override
	public String toString() {
		return "제목 :" + title + ", 페이지수 : " + page + ", 저자 : " + author;
	}

}
