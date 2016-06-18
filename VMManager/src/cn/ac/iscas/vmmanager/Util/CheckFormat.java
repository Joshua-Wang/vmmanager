package cn.ac.iscas.vmmanager.Util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CheckFormat {
	public static String postCodeRegexp = "[0-9]{6}";  //邮政编码的匹配模式 
	public static String phoneRegexp = "([0-9]{3})+-([0-9]{4})+-([0-9]{4})+";//固话的匹配模式    
	public static String mobileRegexp = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$"; //手机的匹配模式 
	public static String emailRegexp = "\\w+(\\.\\w+)*@\\w+(\\.\\w+)+";
	
	public static boolean isPost(String postcode){
		Pattern p = Pattern.compile(postCodeRegexp);
		Matcher m = p.matcher(postcode);
		return m.matches();
	}
	
	public static boolean isPhone(String phone){
		Pattern p = Pattern.compile(phoneRegexp);
		Matcher m = p.matcher(phone);
		return m.matches();
	}
	
	public static boolean isMobile(String mobile){
		Pattern p = Pattern.compile(mobileRegexp);
		Matcher m = p.matcher(mobile);
		return m.matches();
	}
	
	public static boolean isEmail(String email){
		Pattern p = Pattern.compile(emailRegexp);
		Matcher m = p.matcher(email);
		return m.matches();
	}
}
