package system_property;

public class PropertyExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String osName = System.getProperty("os.name");
		String userName = System.getProperty("user.name");
		String userHome = System.getProperty("user.home");
		
		System.out.println(osName);
		System.out.println(userName);
		System.out.println(userHome);
	}

}
