package cn.ac.iscas.vmmanager.Action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

import com.opensymphony.xwork2.ActionSupport;

import cn.ac.iscas.vmmanager.DAO.*;
import cn.ac.iscas.vmmanager.ORM.*;
import cn.ac.iscas.vmmanager.Util.ShellProcess;

public class ServiceAdmin extends ActionSupport{
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String launch(){
		InstanceDAO insdao = new InstanceDAO();
		Instance ins = new Instance();
		ins = (Instance)(insdao.findByProperty("id", id).get(0));
		String launch_os = ins.getHostOs();
		String launch_size = ins.getHostSize();
		String dec_id = null;
		int count = 0;
		int flag = 0;
		
		if (launch_os.equals("Ubuntu")){
			launch_os = "emi-B1B80FA7";
		}else if (launch_os.equals("CenterOS")){
			launch_os = "emi-6AF90E8D";
		}
		
		if (launch_size.equals("Small")){
			launch_size = "m1.small";
		}else if (launch_size.equals("Medium")){
			launch_size = "c1.medium";
		}else if (launch_size.equals("Large")){
			launch_size = "m1.large";
		}else if (launch_size.equals("XLarge")){
			launch_size = "m1.xlarge";
		}else if (launch_size.equals("XXLarge")){
			launch_size = "c1.xlarge";
		}
		/*
		System.out.println(launch_os);
		System.out.println(launch_size);
		*/
		String[] cmd = { "/bin/sh", "-c", ShellProcess.setEnv + "euca-run-instances "+launch_os+" -k mykey -t "+launch_size };
		Runtime rt = Runtime.getRuntime();
		try {
			Process p = rt.exec(cmd);
			if (p.waitFor() != 0) {
				System.out.println("Falied");
			}
			BufferedReader in = new BufferedReader(new InputStreamReader(
					p.getInputStream()));
			String str = null;
			while ((str = in.readLine()) != null) {
					if (str.contains("INSTANCE")){
						String[] split = str.split("	");
						dec_id = split[1];
					}
				
			}
		} catch (IOException ex) {
			ex.printStackTrace();
												
		} catch (Exception e) {
			e.printStackTrace();
		}

		while (true){
			count++;
			if (count >= 10 || flag == 1){
				break;
			}
			String[] des = { "/bin/sh", "-c", ShellProcess.setEnv + "euca-describe-instances "+dec_id};
			Runtime rt1 = Runtime.getRuntime();
			String message = null;
			try {
				Process p = rt1.exec(des);
				if (p.waitFor() != 0) {
					System.out.println("Falied");
				}
				BufferedReader in = new BufferedReader(new InputStreamReader(
						p.getInputStream()));
				while ((message = in.readLine()) != null) {
					if (message.contains("192.168.9")){
						String[] split = message.split("	");
						save_launch(split[3],dec_id);
						flag  = 1;
						break;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}	
			 try 
			 {
			        Thread.sleep(1000);                 //由类名调用
			  } catch (InterruptedException e) {
			        e.printStackTrace();
			 }  
		}
		return "user_index";
	}
	
	public void save_launch(String ip,String instanceid){
		//System.out.println(ip);
		InstanceDAO insdao = new InstanceDAO();
		insdao.updateByid(id, "运行中");
		insdao.updateip(id, ip);
		insdao.updateid(id, instanceid);
	}
	
	public String shut(){
		InstanceDAO insdao = new InstanceDAO();
		Instance ins = new Instance();
		ins = (Instance)(insdao.findByProperty("id", id).get(0));
		String terminate_id = ins.getInstanceId();
		// System.out.println(terminate_id);
		String[] cmd = { "/bin/sh", "-c", ShellProcess.setEnv + "euca-terminate-instances "+terminate_id};
		Runtime rt = Runtime.getRuntime();
		try {
			Process p = rt.exec(cmd);
			if (p.waitFor() != 0) {
				System.out.println("Falied");
			}
		} catch (IOException ex) {
			ex.printStackTrace();
												
		} catch (Exception e) {
			e.printStackTrace();
		}
		insdao.updateByid(id, "已停止");
		insdao.updateip(id, null);
		return "user_index";
	}
}















