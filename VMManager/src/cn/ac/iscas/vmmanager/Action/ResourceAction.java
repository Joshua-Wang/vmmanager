package cn.ac.iscas.vmmanager.Action;

import com.opensymphony.xwork2.ActionSupport;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Iterator;
import java.util.*;
import cn.ac.iscas.vmmanager.Util.*;

public class ResourceAction extends ActionSupport{
	private List resourcelist = new LinkedList();
	public static final String setEnv = ". /home/joshua/.euca/eucarc;";
	
	public List getResourcelist() {
		return resourcelist;
	}

	public void setResourcelist(List resourcelist) {
		this.resourcelist = resourcelist;
	}

	public String show(){
		String[] cmd = { "/bin/sh", "-c", setEnv + "euca-describe-availability-zones verbose" };
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
				Resource res = new Resource();
				String[] split = message.split("	");
				/*for (int i=0;i<split.length;i++){
					System.out.println(split[i]);
				}*/
				
				res.setAvai(split[0]);
				res.setVmtype(split[1]);
				res.setFree(split[2]);
				resourcelist.add(res);
			}
			// System.out.println("wel");
		} catch (IOException ex) {
			ex.printStackTrace();
												
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
}

class Resource{
	
	private String avai;
	private String vmtype;
	private String free;
	
	public String getAvai() {
		return avai;
	}
	public void setAvai(String avai) {
		this.avai = avai;
	}
	public String getVmtype() {
		return vmtype;
	}
	public void setVmtype(String vmtype) {
		this.vmtype = vmtype;
	}
	public String getFree() {
		return free;
	}
	public void setFree(String free) {
		this.free = free;
	}
	
}
