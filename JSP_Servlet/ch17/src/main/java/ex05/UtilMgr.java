package ex05;

import java.io.File;

public class UtilMgr {
	public static void delete(String s) {
		File file = new File(s);
		if (file.isFile()) {
			file.delete();
		}
	}
}