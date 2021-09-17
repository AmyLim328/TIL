package server_client_test;

import java.io.IOException;
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
					5009));
			System.out.println("[연결 수락]");
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
