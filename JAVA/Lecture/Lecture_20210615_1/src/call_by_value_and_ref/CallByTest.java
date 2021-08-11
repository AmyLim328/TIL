package call_by_value_and_ref;

import java.util.Arrays;

public class CallByTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] arr = {1, 2, 3};
		System.out.println(arr); // 주소값이 출력
		
		// for-each 구문
		for(int i : arr) {
			System.out.println(i);
		}
		
		// for문
		for(int i = 0; i < arr.length; i ++) {
			System.out.println(arr[i]);
		}
		
		System.out.println(Arrays.toString(arr));
		
		function_call_by_ref(arr); // 주소값이 전달
		// 1. 함수를 찾음
		// 2. a = arr (주소값이 복사)
		// 3. 함수 실행
		// 4. 반환값이 있으면 값 반환
		
		System.out.println(Arrays.toString(arr));
		
		int x = 10;
		int y = 20;
		System.out.println("x : " + x + ", y = " + y);
		function_call_by_value(x, y);
		// 1. 함수를 찾음
		// 2. a = x, b = y; (데이터 값 전달)
		// 3. 함수 실행
		// 4. 반환값이 있으면 값 반환
		System.out.println("x : " + x + ", y = " + y);
	}
	// 주소값이 복사
	public static void function_call_by_ref(int[] a) {
		a[0] = 10;
	}
	// 데이터값이 복사
	// 참조변수가 아닌 경우에 메인함수가 변환된 값을 알게 하려면 ?
	// return 값을 줘야 함!
	// return a, b; (x)
	public static void function_call_by_value(int a, int b) {
		a = 20;
		b = 10;
	}

}
