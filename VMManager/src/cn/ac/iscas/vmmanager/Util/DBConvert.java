package cn.ac.iscas.vmmanager.Util;

import java.util.*;
import cn.ac.iscas.vmmanager.DAO.*;
import cn.ac.iscas.vmmanager.ORM.*;

public class DBConvert {
	public static List instanceConvert(List dblist) {
		List viewlist = dblist;
		Iterator i = viewlist.iterator();
		while (i.hasNext()) {
			Instance ins = (Instance) i.next();
			
			if (ins.getHostOs().equals("Ubuntu") || ins.getHostOs().equals("CenterOS")){
				return viewlist;
			}else{
					switch (Integer.parseInt(ins.getHostOs())) {
					case 1:
						ins.setHostOs("Ubuntu");
						break;
					case 2:
						ins.setHostOs("CenterOS");
						break;
					}
					switch (Integer.parseInt(ins.getHostSize())){
					case 1:
						ins.setHostSize("Small");
						break;
					case 2:
						ins.setHostSize("Medium");
						break;
					case 3:
						ins.setHostSize("Large");
						break;
					case 4:
						ins.setHostSize("XLarge");
						break;
					case 5:
						ins.setHostSize("XXLarge");
						break;
					}
					
					switch (Integer.parseInt(ins.getPayMethod())){
					case 1:
						ins.setPayMethod("按月计费");
						break;
					case 2:
						ins.setPayMethod("按季度计费");
						break;
					case 3:
						ins.setPayMethod("按年计费");
						break;
					case 4:
						ins.setPayMethod("按实际使用时长计费");
						break;
					}
			}
		}
		return viewlist;
	}
}
