package cn.ac.iscas.vmmanager.Action;

import com.opensymphony.xwork2.ActionSupport;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.util.*;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.ac.iscas.vmmanager.Util.*;

public class NetworkAction extends ActionSupport{
	private static List iplist = new LinkedList();
	private String id;
	private String address;
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List getIplist() {
		return iplist;
	}

	public void setIplist(List iplist) {
		this.iplist = iplist;
	}
	
	public String show(){
		String[] cmd = { "/bin/sh", "-c", ShellProcess.setEnv + "euca-describe-addresses" };
		Runtime rt = Runtime.getRuntime();
		String message = null;
		try {
			Process p = rt.exec(cmd);
			if (p.waitFor() != 0) {
				System.out.println("Falied");
			}
			iplist.clear();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					p.getInputStream()));
			while ((message = in.readLine()) != null) {
				IP ip = new IP();
				String[] split = message.split("	");
				ip.setAddress(split[1]);
				ip.setInstance_id(split[2]);
				iplist.add(ip);
			}
			
		} catch (IOException ex) {
			ex.printStackTrace();
												
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	public String allocate(){
		
		// String address = ((IP) (iplist.get(Integer.parseInt(id)))).getAddress();
		
		String[] delcmd = { "/bin/sh", "-c", ShellProcess.setEnv + "euca-allocate-address"};
		Runtime rt1 = Runtime.getRuntime();
		try {
			Process p1 = rt1.exec(delcmd);
			if (p1.waitFor() != 0) {
				System.out.println("Falied");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return this.show();
	}
	
	public String release() throws IOException{
			String[] cmd = { "/bin/sh", "-c", ShellProcess.setEnv + "euca-release-address "+this.address};
			Runtime rt = Runtime.getRuntime();
			String message = null;
			String result = "success";
			try {
				Process p = rt.exec(cmd);
				if (p.waitFor() != 0) {
					System.out.println("Falied");
				}
				BufferedReader in = new BufferedReader(new InputStreamReader(
						p.getInputStream()));
				while ((message = in.readLine()) != null) {
					if (message.contains("denied")){
						result = "failed";
					}
				}
				
			} catch (IOException ex) {
				ex.printStackTrace();
													
			} catch (Exception e) {
				e.printStackTrace();
			}
			return this.show();
	}
	
	public String disassociate(){
		String addr = ((IP) (iplist.get(Integer.parseInt(id)))).getAddress();
		String[] discmd = { "/bin/sh", "-c", ShellProcess.setEnv + "euca-disassociate-address "+addr};
		Runtime rt3 = Runtime.getRuntime();
		try {
			Process p3 = rt3.exec(discmd);
			if (p3.waitFor() != 0) {
				System.out.println("Falied");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return this.show();
	}
	
	public String associate(){
		//System.out.println(address);
		String ins = ((IP) (iplist.get(Integer.parseInt(id)))).getInstance_id();
		//  System.out.println(ins);
		String insid = ins.substring(0, 10);
		// System.out.println(insid);
		String[] assocmd = { "/bin/sh", "-c", ShellProcess.setEnv + "euca-associate-address -i "+insid+" "+this.address};
		Runtime rt4 = Runtime.getRuntime();
		try {
			Process p4 = rt4.exec(assocmd);
			if (p4.waitFor() != 0) {
				System.out.println("Falied");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}

class IP{
	private String address;
	private String instance_id;
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getInstance_id() {
		return instance_id;
	}
	public void setInstance_id(String instance_id) {
		this.instance_id = instance_id;
	}
}
	
