package decimal_format_class;

import java.text.DecimalFormat;
public class DecimalFormatExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		double num = 123456.89;
		
		DecimalFormat df1 = new DecimalFormat
				("000000000.000");
		System.out.println(df1.format(num));
		
		DecimalFormat df2 = new DecimalFormat
				("#.###");
		System.out.println(df2.format(num));
		
		DecimalFormat df3 = new DecimalFormat
				("###,###.###");
		System.out.println(df3.format(num));
		
		DecimalFormat df4 = new DecimalFormat
				("#.#%");
		System.out.println(df4.format(num));
	}

}
