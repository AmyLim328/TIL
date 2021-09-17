package comparator_test;

import java.util.*;

public class ScoreComparator 
implements Comparator<Student>{

	
	// 1. 성적을 내림차순으로 정렬
	// 2. 성적이 같다면 id를 오름차순으로 정렬
	@Override
	public int compare(Student o1, Student o2) {
		// TODO Auto-generated method stub

		// score을 기준으로 내림차순
		// 큰 놈 왼쪽 (-1), 작은 놈은 오른쪽 (1)
		if(o1.score < o2.score) return 1;
		else if(o1.score == o2.score) {
			
			// id를 기준으로 오름차순
			// 큰 놈 오른쪽 (1), 작은 놈은 왼쪽 (-1)
			if(o1.id < o2.id) return -1;
			else if(o1.id == o2.id) return 0;
			else return 1;
		}
		else return -1;
	}

}
