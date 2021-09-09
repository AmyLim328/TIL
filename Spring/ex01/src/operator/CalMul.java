package operator;

public class CalMul implements Calculator{
	
	@Override
	public int operator(int left, int right) {
		return left * right;
	}
}