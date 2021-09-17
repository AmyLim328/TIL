package serializable;

import java.io.Serializable;


// Serializable 인터페이스는 
// 사용자 정의 클래스에서 필드들을 직렬화할 수 있게 만듦
// 모든 필드들을 바이트로 변환해도 좋다는 표시!

public class Student implements Serializable {
	
	// serialVersionUID 필드: 클래스의 식별자
	// 자바 자동 생성
	// 직렬화했던 클래스 UID  필드값 == 역직렬화 클래스 UID 필드값
	// 클래스 이름이 같으면 UID 값은 같음
	// 클래스 이름이 같아도 클래스의 내용이 변경되면 UID 변경될 수 있음
	
	// 클래스의 내용이 변경되더라도 UID 값이 설정되어있으면 오류 발생 X
	// 명시적으로 UID 지정
	static final long serialVersionUID = 1234;
	
	// 직렬화에서 제외
	// 키워드를 static
	String name; // 힙 영역
	String id; // 힙 영역
	static String pass; // 데이터 영역
	// 패스워드 (보안정보) 직렬화 과정에서 제외
	// 필드는 유지가 되지만 값이 null값 설정
}
