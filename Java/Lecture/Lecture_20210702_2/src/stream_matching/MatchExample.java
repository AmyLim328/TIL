package stream_matching;

import java.util.Arrays;

public class MatchExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// 모든 요소가 짝수인지 확인하는 프로그램
		int[] intArr = {2, 4, 6, 8, 10};
		
		boolean res = 
				Arrays.stream(intArr).allMatch(a -> a % 2 == 0);
		System.out.println(res);
		
		
		// 1. 하나라도 홀수가 있는지 확인 (anyMatch())
		res = Arrays.stream(intArr).anyMatch(a -> a % 2 != 0);
		System.out.println(res);
		
		// 2. 모두 20의 배수가 아닌지 확인 (noneMatch())
		res = Arrays.stream(intArr).noneMatch(a -> a % 20 == 0);
		System.out.println(res);
		
		
	}

}
