package comparator_test;

import java.util.Comparator;

public class ScoreComparator implements Comparator<Student> {

	// 1. 성적 내림차순 정렬
	// 2. 성적 같다면 id 오름차순 정렬

	@Override
	public int compare(Student o1, Student o2) {
		if (o1.score < o2.score)
			return 1;
		else if (o1.score == o2.score) {
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
