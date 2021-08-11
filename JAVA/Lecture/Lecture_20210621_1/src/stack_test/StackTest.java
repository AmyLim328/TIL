package stack_test;

import java.util.*;

public class StackTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Stack<Book> book = new Stack<>();
		book.push(new Book("해리포터"));
		book.push(new Book("노인과 바다"));
		book.push(new Book("위대한 개츠비"));
		
		System.out.println(book.peek().getTitle());
		
		while(!book.isEmpty()) {
			Book popBook = book.pop();
			System.out.println("꺼낸 책 이름 : " 
			+ popBook.getTitle());
		}
		
	}

}
