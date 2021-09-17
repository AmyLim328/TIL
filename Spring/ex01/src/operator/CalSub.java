package operator;

public class CalSub implements Calculator{
	
	@Override
	public int operator(int left, int right) {
		return left - right;
	}
}