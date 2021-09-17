package comparator_test;

import java.util.Comparator;

public class GradeComparator implements Comparator<Student> {

	// 1. 학년 내림차순 정렬
	// 2. 학년 같다면 id 오름차순 정렬

	@Override
	public int compare(Student o1, Student o2) {
		if (o1.grade < o2.grade)
			return 1;
		else if (o1.grade == o2.grade) {
			if (o1.id < o2.id)
				return -1;
			else if (o1.id == o2.id)
				return 0;
			else
				return 1;
		} else {
			return -1;
		}
	}

}
