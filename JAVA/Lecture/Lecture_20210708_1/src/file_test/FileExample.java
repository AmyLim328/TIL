package file_test;

import java.io.*;

public class FileExample {

	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub

		File dir1 = new File(".");
		File dir2 = new File("./src");
		File dir3 = new File(dir2.toString()
				+ "/file_test/newfolder");
		File file1 = new File(dir3.toString() + "/file1.txt");
		File file2 = new File(dir3.toString() + "/file2.txt");
		File file3 = new File(dir3.toString() + "/file3.txt");
		
		// mkdir: make directory (弃歹 积己)
		if(!(dir1.exists())) dir1.mkdir();
		if(!(dir2.exists())) dir2.mkdir();
		if(!(dir3.exists())) dir3.mkdir();
		
		// createNewFile() (颇老 积己)
		if(!(file1.exists())) file1.createNewFile();
		if(!(file2.exists())) file2.createNewFile();
		if(!(file3.exists())) file3.createNewFile();
		
		File[] contents = dir3.listFiles();
		for(File file : contents) {
			System.out.println(file.toString());
		}
	}

}
