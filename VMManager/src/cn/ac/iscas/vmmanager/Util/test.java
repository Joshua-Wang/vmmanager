package cn.ac.iscas.vmmanager.Util;

import java.security.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

import cn.ac.iscas.vmmanager.DAO.*;
import cn.ac.iscas.vmmanager.ORM.*;


public class test {

	public static void main(String[] args) {
		   String DATE_FORMAT = "yyyy-MM-dd";
		   SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		   Calendar c1 = Calendar.getInstance();
		   System.out.println("Date    is    :    " + sdf.format(c1.getTime()));
		   
		   /*c1.add(Calendar.DATE, 366);
		   System.out.println("Date    +    366    days    is    :    "
		     + sdf.format(c1.getTime()));
		   System.out.println("----------------------------");*/
		  
		  /* c1.set(1999, 0, 31);
		   System.out.println("Date    is    :    " + sdf.format(c1.getTime()));*/
		   /*c1.roll(Calendar.MONTH, false); // 月份减去一个月，true 为加一个月，年、日不动
		   System.out.println("Date    roll    down    1    month    :    "
		     + sdf.format(c1.getTime()));*/
		   
		  // c1.set(1999, 2, 31);
		  // System.out.println("Date    is    :    " + sdf.format(c1.getTime()));
		   
		   c1.add(Calendar.MONTH, 1); // 月份减去一个月
		   System.out.println("Date plus 1 month : " + sdf.format(c1.getTime())); 
		   c1.add(Calendar.MONTH, 3);
		   System.out.println("Date plus 3 month: " + sdf.format(c1.getTime()));
		   c1.add(Calendar.YEAR, 1);
		   System.out.println("Date plus 1 year : " + sdf.format(c1.getTime()));
	}
}










