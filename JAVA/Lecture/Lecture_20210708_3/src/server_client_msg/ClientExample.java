package server_client_msg;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.*;

// localhost 5001 포트로 연결 요청
// connect() 정상 리턴 -> 연결 성공!

public class ClientExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Socket socket = new Socket();
		
		try {
			
			System.out.println("[연결 요청]");
			socket.connect
			(new InetSocketAddress("localhost", 
					5011));
			System.out.println("[연결 수락]");
			
			// 메세지 보냄 (클라이언트 -> 서버)
			OutputStream os = socket.getOutputStream();
			String msg = "Hello Server~!";
			byte[] bytes = msg.getBytes("UTF-8");
			os.write(bytes);
			os.flush();
			
			
			System.out.println("[데이터 보내기 성공!]");
			
			InputStream is 
			= socket.getInputStream();
			
			bytes = new byte[100];
			int readByte = is.read(bytes);
			msg = new String(bytes, 0, readByte, "UTF-8");
			System.out.println("[데이터 받기 성공 !] " + msg);
			
			os.close();
			is.close();
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		// 현재 연결되어있으면
		if(!socket.isClosed()) {
			try {
				socket.close(); // 연결 끊기
			}
			catch(IOException e) {
				e.printStackTrace();
			}
		}
	}

}
