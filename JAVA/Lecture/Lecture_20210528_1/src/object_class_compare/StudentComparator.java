package object_class_compare;

import java.util.Comparator;

public class StudentComparator 
implements Comparator<Student>{

	@Override
	public int compare(Student o1, Student o2) {
		// TODO Auto-generated method stub
		
		if(o1.score < o2.score) return -1;
		else if(o1.score == o2.score) return 0;
		else return 1;
		
	}

}
