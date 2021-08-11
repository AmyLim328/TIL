package day6ex1;

public class Book {

	protected String title;
	protected int page;
	protected String author;

	// 오버로딩 (overload)
	public Book() {
//		title = "";
//		page = 0;
//		author = "";

		this("", 0, "");
		// null : 참조할 객체가 없을 경우 (주소값이 없음)
	}

	public Book(String title, int page, String author) {
		this.title = title;
		this.page = page;
		this.author = author;
	}

	/*
	 * 오버라이딩 (override) : 상속받은 메서드의 내용 변경 
	 * 오버로딩 (overload) : 동일한 이름의 메서드를 중복 정의 
	 * 반환형 함수 이름 (매개변수) 
	 * => 매개변수의 타입, 개수, 순서 중 하나가 달라야 함 
	 * => 반환형은 영향을 미치지 않음 
	 * void method(String s, int i) - 1 
	 * void method(int i, String s) - 2 
	 * void method(int i, String s) - 3
	 * 
	 * final Car
	 * SportsCar extends Car
	 * 
	 * 메소드 (함수) - 오버라이딩 (override, 재정의)
	 * 
	 * Car
	 * final method()
	 * 
	 * SportsCar extends Car
	 * method()(x) // final 메소드 재정의 불가
	 * 
	 * 필드 (변수)
	 * 상수 정의
	 * 값의 변경이 불가능
	 */

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

	public String toString() {
		return "이름은 " + title + ", 페이지 수는 " + page + ", 저자는 " + author;
	}

}
