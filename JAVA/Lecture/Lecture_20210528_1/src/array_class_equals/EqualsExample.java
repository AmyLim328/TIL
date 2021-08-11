package array_class_equals;

import java.util.Arrays;

public class EqualsExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[][] original = {{1, 2}, {3, 4}};
		System.out.println(original); // 주소값
		System.out.println(original[0]); // 주소값
		System.out.println(original[1]); // 주소값
		System.out.println(original[0][0]);
		System.out.println(original[0][1]);
		System.out.println(original[1][0]);
		System.out.println(original[1][1]);
		
		// 얕은 복사
		int[][] cloned1 
		= Arrays.copyOf(original, original.length);
		
		System.out.println(original == cloned1); // 1
		System.out.println(original[0] == cloned1[0]); // 2
		System.out.println(original[1] == cloned1[1]); // 3
		System.out.println(original[0][0] == cloned1[0][0]); // 4
		System.out.println(original[0][1] == cloned1[0][1]); // 5
		System.out.println(original[1][0] == cloned1[1][0]); // 6
		System.out.println(original[1][1] == cloned1[1][1]); // 7
		
		// 1번이 동일한지 확인 (주소값 비교)
		System.out.println(original.equals(cloned1));
		// 2, 3번이 동일한지 확인 (주소값 비교)
		System.out.println(Arrays.equals(original, cloned1));
		// 4, 5, 6, 7 내용물이 동일한지 확인 (내용값 비교)
		System.out.println(Arrays.deepEquals(original, cloned1));
		
		// 깊은 복사
		int[][] cloned2 
		= Arrays.copyOf(original, original.length);
		cloned2[0] 
				= Arrays.copyOf(original[0], original[0].length);
		cloned2[1] 
				= Arrays.copyOf(original[1], original[1].length);
	
		System.out.println(original == cloned2); // 1
		System.out.println(original[0] == cloned2[0]); // 2
		System.out.println(original[1] == cloned2[1]); // 3
		System.out.println(original[0][0] == cloned2[0][0]); // 4
		System.out.println(original[0][1] == cloned2[0][1]); // 5
		System.out.println(original[1][0] == cloned2[1][0]); // 6
		System.out.println(original[1][1] == cloned2[1][1]); // 7
		
		// 1번이 동일한지 확인 (주소값 비교)
		System.out.println(original.equals(cloned2));
		// 2, 3번이 동일한지 확인 (주소값 비교)
		System.out.println(Arrays.equals(original, cloned2));
		// 4, 5, 6, 7번이 동일한지 확인 (내용값 비교)
		System.out.println(Arrays.deepEquals(original, cloned2));
				
	}

}
