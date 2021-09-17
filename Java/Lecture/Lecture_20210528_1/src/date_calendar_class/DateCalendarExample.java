package date_calendar_class;

import java.util.Date;
import java.util.Calendar;

public class DateCalendarExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Date d = new Date(); // 생성자 만들 수 있음
		System.out.println(d);
		
		//Calendar c = new Calendar(); 
		// 추상 클래스여서 생성자 호출 X
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH); // 0 ~ 11
		int day = c.get(Calendar.DAY_OF_MONTH);
		int week = c.get(Calendar.DAY_OF_WEEK);
		System.out.println(year);
		System.out.println(month);
		System.out.println(day);
		System.out.println(week);
		
		switch(week) {
		case Calendar.MONDAY:
			System.out.println("월요일");
			break;
		case Calendar.TUESDAY:
			System.out.println("화요일");
			break;
		case Calendar.WEDNESDAY:
			System.out.println("수요일");
			break;
		case Calendar.THURSDAY:
			System.out.println("목요일");
			break;
		case Calendar.FRIDAY:
			System.out.println("금요일");
			break;
		case Calendar.SATURDAY:
			System.out.println("토요일");
			break;
		case Calendar.SUNDAY:
			System.out.println("일요일");
			break;
		}
		
		int hour = c.get(Calendar.HOUR);
		int min = c.get(Calendar.MINUTE);
		int sec = c.get(Calendar.SECOND);
		System.out.println(hour);
		System.out.println(min);
		System.out.println(sec);
	}

}
