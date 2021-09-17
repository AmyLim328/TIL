package stream_aggregate;

import java.util.Arrays;
import java.util.stream.*;

public class AggregateExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int[] arr = {1, 2, 3, 4, 5};
		
		// 1. 2ÀÇ ¹è¼ö °³¼ö (filter(), count())
		// long count()
		IntStream intStream = Arrays.stream(arr);
		long count = intStream.filter(m -> m % 2 == 0).count();
		System.out.println("2ÀÇ ¹è¼ö °³¼ö : " + count + "°³");
		
		
		// 2. È¦¼öÀÇ ÇÕ (filter(), sum())
		// long sum()
		intStream = Arrays.stream(arr);
		long sum = intStream.filter(m -> m % 2 != 0).sum();
		System.out.println("È«¼öÀÇ ÇÕ : " + sum);
		
		
		// 3. È¦¼öÀÇ Æò±Õ (filter(), average())
		// OptionalXXX average()
		// average().getAsDouble()
		intStream = Arrays.stream(arr);
		double avg = intStream.filter(m -> m % 2 != 0)
				.average()
				.getAsDouble();
		System.out.println("È¦¼öÀÇ Æò±Õ : " + avg);
		
		// 4. ÃÖ´ñ°ª (max(), getAsInt())
		intStream = Arrays.stream(arr);
		int max = intStream.max().getAsInt();
		System.out.println("ÃÖ´ñ°ª : " + max);
		
		// 5. ÃÖ¼Ú°ª (min(), getAsInt())
		intStream = Arrays.stream(arr);
		int min = intStream.min().getAsInt();
		System.out.println("ÃÖ¼Ú°ª : " + min);
		
		// 6. Ã¹¹øÂ° Â¦¼ö (filter(), findFirst(), getAsInt())
		intStream = Arrays.stream(arr);
		int first = intStream.filter(n -> n % 2 == 0)
				.findFirst().getAsInt();
		System.out.println("Ã¹¹øÂ° Â¦¼ö : " + first);
		
	}

}
