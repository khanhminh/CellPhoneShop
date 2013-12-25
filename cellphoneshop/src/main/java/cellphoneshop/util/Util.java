package cellphoneshop.util;

public class Util {
	public static boolean tryParseInt(String number){		
		try {
			Integer.parseInt(number);
		} catch (Exception e) {
			return false;
		}
		
		return true;
	}
}
