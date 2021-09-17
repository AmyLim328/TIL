package console_test;

import java.io.*;

public class ConsoleExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Console console = System.console();
		
		System.out.print("아이디 : ");
		String id = console.readLine(); 
		// 콘솔 출력
		
		System.out.print("패스워드 : ");
		char[] charPass = console.readPassword(); 
		// 콘솔 출력 X
		
		// char[] -> String
		String strPass = new String(charPass);
		
		System.out.println(id);
		System.out.println(strPass);
		
	}

}
