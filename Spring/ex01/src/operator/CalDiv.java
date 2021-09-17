package operator;

public class CalDiv implements Calculator{
	
	@Override
	public int operator(int left, int right) {
		return right != 0 ? left / right : 0;
	}
}