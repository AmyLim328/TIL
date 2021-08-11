package stream_sorted;

import java.util.*;

public class NameOrderComparator implements Comparator<Student> {

	@Override
	public int compare(Student o1, Student o2) {
		// TODO Auto-generated method stub
		return o1.name.compareTo(o2.name); // 이름 기준 오름차순
	}

}
