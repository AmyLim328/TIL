package day6ex1;

public class Book {

	protected String title;
	protected int page;
	protected String author;

	// �����ε� (overload)
	public Book() {
//		title = "";
//		page = 0;
//		author = "";

		this("", 0, "");
		// null : ������ ��ü�� ���� ��� (�ּҰ��� ����)
	}

	public Book(String title, int page, String author) {
		this.title = title;
		this.page = page;
		this.author = author;
	}

	/*
	 * �������̵� (override) : ��ӹ��� �޼����� ���� ���� 
	 * �����ε� (overload) : ������ �̸��� �޼��带 �ߺ� ���� 
	 * ��ȯ�� �Լ� �̸� (�Ű�����) 
	 * => �Ű������� Ÿ��, ����, ���� �� �ϳ��� �޶�� �� 
	 * => ��ȯ���� ������ ��ġ�� ���� 
	 * void method(String s, int i) - 1 
	 * void method(int i, String s) - 2 
	 * void method(int i, String s) - 3
	 * 
	 * final Car
	 * SportsCar extends Car
	 * 
	 * �޼ҵ� (�Լ�) - �������̵� (override, ������)
	 * 
	 * Car
	 * final method()
	 * 
	 * SportsCar extends Car
	 * method()(x) // final �޼ҵ� ������ �Ұ�
	 * 
	 * �ʵ� (����)
	 * ��� ����
	 * ���� ������ �Ұ���
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
		return "�̸��� " + title + ", ������ ���� " + page + ", ���ڴ� " + author;
	}

}
