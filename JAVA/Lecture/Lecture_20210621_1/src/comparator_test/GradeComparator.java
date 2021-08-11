package comparator_test;

import java.util.Comparator;

public class GradeComparator 
implements Comparator<Student>{

		
	// 1. 학년을 내림차순으로 정렬
	// 2. 학년이 같다면 id를 오름차순으로 정렬
	@Override
	public int compare(Student o1, Student o2) {
		// grade을 기준으로 내림차순
		// 큰 놈 왼쪽 (-1), 작은 놈은 오른쪽 (1)
		if(o1.grade < o2.grade) return 1;
		else if(o1.grade == o2.grade) {
			
			// id를 기준으로 오름차순
			// 큰 놈 오른쪽 (1), 작은 놈은 왼쪽 (-1)
			if(o1.id < o2.id) return -1;
			else if(o1.id == o2.id) return 0;
			else return 1;
		}
		else return -1;
	}
}
