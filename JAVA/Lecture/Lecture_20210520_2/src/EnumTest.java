import java.util.Calendar;

public class EnumTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/* 열거형 (Enum, enumerate)
		 * : 자주 사용되는 상수에 이름을 붙인 형
		 * 
		 * */
		
		Week today = Week.THURSDAY;
		System.out.println(today);
		
		Calendar now = Calendar.getInstance();
		System.out.println(now.get(Calendar.YEAR)); // 년
		System.out.println(now.get(Calendar.MONTH) + 1); // 월
		// 1 ~ 12
		// 0 ~ 11
		System.out.println(now.get(Calendar.DAY_OF_MONTH)); // 일
		System.out.println(now.get(Calendar.DAY_OF_WEEK)); // 요일
		// 0
		// 일: 1
		// 월: 2
		// 화: 3
		// 수: 4
		// 목: 5
		System.out.println(now.get(Calendar.HOUR)); // 시간
		System.out.println(now.get(Calendar.MINUTE)); // 분
		System.out.println(now.get(Calendar.SECOND)); // 초
		
		int week = now.get(Calendar.DAY_OF_WEEK);
		
		switch(week) {
		case 1:
			today = Week.SUNDAY;
			break;
		case 2:
			today = Week.MONDAY;
			break;
		case 3:
			today = Week.TUESDAY;
			break;
		case 4:
			today = Week.WEDNESDAY;
			break;
		case 5:
			today = Week.THURSDAY;
			break;
		case 6:
			today = Week.FRIDAY;
			break;
		case 7:
			today = Week.SATURDAY;
			break;
		}
		System.out.println("오늘 요일 : " + today);
		// final double PI = 3.14;
	}
}
