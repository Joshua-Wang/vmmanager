package cn.ac.iscas.vmmanager.Util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class ShellProcess {
	public static final String path = "/home/joshua/VMManager/shell-script/";
	public static final String setEnv = ". /home/joshua/.euca/eucarc;";
	private static List<String> list = new LinkedList();
	
	public static List print(String str) {
		list.clear();
		String[] cmd = { "/bin/sh", "-c", setEnv + str };
		Runtime rt = Runtime.getRuntime();
		String message = null;
		try {
			Process p = rt.exec(cmd);
			if (p.waitFor() != 0) {
				System.out.println("Falied");
			}
			BufferedReader in = new BufferedReader(new InputStreamReader(
					p.getInputStream()));
			while ((message = in.readLine()) != null) {
				message = message.replace("	", "&nbsp;&nbsp;&nbsp;");
				list.add(message);
			}
			return list;
		} catch (IOException ex) {
			System.out.println("Shell not found!"); 
												
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
