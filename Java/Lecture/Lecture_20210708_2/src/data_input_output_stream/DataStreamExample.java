package data_input_output_stream;

import java.io.*;

public class DataStreamExample {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		FileOutputStream fos = new FileOutputStream(".\\src"
				+ "\\data_input_output_stream\\test.dat"); // 이진파일
		DataOutputStream dos = new DataOutputStream(fos);
		
		dos.writeUTF("김자바");
		dos.writeDouble(90.1);
		dos.writeInt(1);
		
		dos.writeUTF("이클립");
		dos.writeDouble(80.1);
		dos.writeInt(2);
		
		dos.flush();
		fos.flush();
		dos.close();
		fos.close();
		
		FileInputStream fis = new FileInputStream(".\\src"
				+ "\\data_input_output_stream\\test.dat"); // 이진파일
		DataInputStream dis = new DataInputStream(fis);
		
		
		// while(read() != -1) // 파일이 끝나기 전까지 반복
		
		for(int i = 0; i < 2; i ++) {
			String n = dis.readUTF();
			double s = dis.readDouble();
			int o = dis.readInt();
			System.out.println(n + " : " + s + " : " + o);
		}
		dis.close();
		fis.close();
		
		
		
	}

}
