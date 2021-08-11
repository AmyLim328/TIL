package comparator_test;

public class Student implements Comparable<Student> {
	int id;
	String name;
	int grade;
	int score;

	public Student() {
	}

	public Student(int id, String name, int grade, int score) {
		this.id = id;
		this.name = name;
		this.grade = grade;
		this.score = score;
	}

	@Override
	public String toString() {
		return String.format("id : %d, name : %s, grade : %d, score : %d", id, name, grade, score);
	}

	@Override
	public int compareTo(Student o) {
		// id 기준으로 오름차순
		if (this.id < o.id)
			return -1;
		else if (this.id == o.id)
			return 0;
		else {
			return 1;
		}

	}
}
