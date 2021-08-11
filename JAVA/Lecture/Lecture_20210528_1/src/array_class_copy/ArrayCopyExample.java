package array_class_copy;

import java.util.Arrays;

public class ArrayCopyExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		char[] arr1 = {'J', 'A', 'V', 'A'};
		
		// 방법 1
		char[] arr2 = Arrays.copyOf(arr1, arr1.length);
		
		System.out.println(arr1 == arr2);
		System.out.println(Arrays.toString(arr2));
		/*
		 * "[값 1, 값 2 ...]"
		 * */
		
		// 방법 2
		char[] arr3 = Arrays.copyOfRange(arr1, 1, 3);
		System.out.println(arr1 == arr3);
		System.out.println(arr2 == arr3);
		System.out.println(Arrays.toString(arr3));
		
		/*
		 * Arrays 클래스의 copyOf(), copyOfRange() 함수는
		 * 새로운 공간을 할당 (원본과 주소가 다름)
		 * 
		 * */
		
		// 방법 3
		char[] arr4 = new char[arr1.length];
		System.arraycopy(arr1, 0, arr4, 0, arr1.length);
		// System.arraycopy
		// (원본 배열, 원본 시작 인덱스, 타겟 배열, 타겟 배열 인덱스, 복사 개수)
		
		System.out.println(Arrays.toString(arr4));
	}

}
