package file_copy;

import java.io.*;

public class FileCopyTest {

	public static void main(String[] args) 
			throws FileNotFoundException, IOException {
		// TODO Auto-generated method stub
		FileReader in 
		= new FileReader("C:\\Users\\goott2"
				+ "\\Desktop"
				+ "\\testtest.txt");
		FileWriter out 
		= new FileWriter("testtest7.txt", true);

		
		
		int c;
		char[] ch = new char[100];
		while ((c = in.read(ch)) != -1) {
			out.write(ch);
			out.write("ssss");
		}
//		
		out.flush();
		in.close();
		out.close();

	}

}
