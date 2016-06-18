package cn.ac.iscas.vmmanager.Action;

import com.opensymphony.xwork2.ActionSupport;
import cn.ac.iscas.vmmanager.Util.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class InstanceAction extends ActionSupport{
	private static List instancelist = new LinkedList();
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List getInstancelist() {
		return instancelist;
	}

	public void setInstancelist(List instancelist) {
		this.instancelist = instancelist;
	}

	public String show(){
		String[] cmd = { "/bin/sh", "-c", ShellProcess.setEnv + "euca-describe-instances" };
		Runtime rt = Runtime.getRuntime();
		String message = null;
		int count = 0;
		try {
			Process p = rt.exec(cmd);
			if (p.waitFor() != 0) {
				System.out.println("Falied");
			}
			instancelist.clear();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					p.getInputStream()));
			while ((message = in.readLine()) != null) {
				count++;
				if (count%2 == 0){
					String[] split = message.split("	");
					DecInstance dec = new DecInstance();
					dec.setInstanceid(split[1]);
					dec.setEMI(split[2]);
					dec.setPublic_dns(split[3]);
					dec.setPrivate_dns(split[4]);
					dec.setState(split[5]);
					dec.setType(split[9]);
					dec.setCreat_time(split[10]);
					instancelist.add(dec);
					
				}
				
			}
		} catch (IOException ex) {
			ex.printStackTrace();
												
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	public String reboot(){
		String instanceid = ((DecInstance)(instancelist.get(this.id))).getInstanceid();
		System.out.println("Reboot "+instanceid);
		String[] rebootcmd = { "/bin/sh", "-c", ShellProcess.setEnv + "euca-reboot-instances "+instanceid };
		Runtime rt1 = Runtime.getRuntime();
		try {
			Process p1 = rt1.exec(rebootcmd);
			if (p1.waitFor() != 0) {
				System.out.println("Falied");
			}
		} catch (IOException ex) {
			ex.printStackTrace();
												
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.show();
	}
	
	public String shut(){
		String instanceid = ((DecInstance)(instancelist.get(this.id))).getInstanceid();
		//System.out.println("Shut "+instanceid);
		String[] shutcmd = { "/bin/sh", "-c", ShellProcess.setEnv + "euca-terminate-instances "+instanceid };
		Runtime rt2 = Runtime.getRuntime();
		try {
			Process p2 = rt2.exec(shutcmd);
			if (p2.waitFor() != 0) {
				System.out.println("Falied");
			}
		} catch (IOException ex) {
			ex.printStackTrace();
												
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.show();
	}
}

class DecInstance{
	private String instanceid;
	private String EMI;
	private String public_dns;
	private String private_dns;
	private String state;
	private String type;
	private String creat_time;
	
	public String getInstanceid() {
		return instanceid;
	}
	public void setInstanceid(String instanceid) {
		this.instanceid = instanceid;
	}
	public String getEMI() {
		return EMI;
	}
	public void setEMI(String eMI) {
		EMI = eMI;
	}
	public String getPublic_dns() {
		return public_dns;
	}
	public void setPublic_dns(String public_dns) {
		this.public_dns = public_dns;
	}
	public String getPrivate_dns() {
		return private_dns;
	}
	public void setPrivate_dns(String private_dns) {
		this.private_dns = private_dns;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCreat_time() {
		return creat_time;
	}
	public void setCreat_time(String creat_time) {
		this.creat_time = creat_time;
	}
}
