package operator;

public class CalAdd implements Calculator{
	
	@Override
	public int operator(int left, int right) {
		return left + right;
	}
}