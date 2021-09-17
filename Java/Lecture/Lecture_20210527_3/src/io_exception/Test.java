package io_exception;

//import java.io.FileWriter;
//import java.io.PrintWriter;
import java.io.*;
public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] list = new int[10];
		
		for(int i = 0; i < list.length; i ++) {
			list[i] = i;
		}
		
		PrintWriter out = null;
		
		try {
			out = new PrintWriter
					(new FileWriter("C:\\Users\\goott2\\Desktop\\outfile.txt"));
			for(int i = 0; i <= list.length; i ++) {
				out.println("배열 원소 : " + i + " => " + list[i]);
			}
		} 
		catch(ArrayIndexOutOfBoundsException e) {
			System.out.println(e);
		} 
		catch(IOException e) {
			System.out.println(e);
		}
		finally {
			out.close();
		}
	}

}
