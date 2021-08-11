package server_client_test;

import java.io.IOException;
import java.net.*;

// localhost 5001 포트로 연결 요청
// connect() 정상 리턴 -> 연결 성공!

public class ServerExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ServerSocket serverSocket = null;
		
		try {
			serverSocket = new ServerSocket();
//			System.out.println("[연결 요청]");
			serverSocket.bind
			(new InetSocketAddress("localhost", 5009));
			
			while(true) {
				System.out.println("[연결 기다림]");
				Socket socket 
				= serverSocket.accept(); // 클라이언트 연결 수락
				
				InetSocketAddress isa 
				= (InetSocketAddress)socket
				.getRemoteSocketAddress();
				
				System.out.println("[연결 수락함] " 
				+ isa.getHostName());
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		// ServerSocket이 닫혀 있지 않은 경우
		if(!serverSocket.isClosed()) {
			try {
				serverSocket.close(); // ServerSocket 닫기
			}
			catch(IOException e) {
				e.printStackTrace();
			}
		}
	}

}
