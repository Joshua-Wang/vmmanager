package cn.ac.iscas.vmmanager.Action;

import com.opensymphony.xwork2.ActionSupport;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;
import cn.ac.iscas.vmmanager.Util.*;

public class VolumeAction extends ActionSupport{
	private static List volumelist = new LinkedList();
	private int size;
	private int volid;
	private String instanceid;
	private String volumeid;
	private String device;
	private List volinstancelist;
	
	public List getVolinstancelist() {
		return volinstancelist;
	}

	public void setVolinstancelist(List volinstancelist) {
		this.volinstancelist = volinstancelist;
	}

	public String getInstanceid() {
		return instanceid;
	}

	public void setInstanceid(String instanceid) {
		this.instanceid = instanceid;
	}

	public String getVolumeid() {
		return volumeid;
	}

	public void setVolumeid(String volumeid) {
		this.volumeid = volumeid;
	}

	public String getDevice() {
		return device;
	}

	public void setDevice(String device) {
		this.device = device;
	}
	
	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getVolid() {
		return volid;
	}

	public void setVolid(int volid) {
		this.volid = volid;
	}
	
	
	public List getVolumelist() {
		return volumelist;
	}

	public void setVolumelist(List volumelist) {
		this.volumelist = volumelist;
	}

	public String show(){
		InstanceAction insaction = new InstanceAction();
		this.setVolinstancelist(insaction.getInstancelist());
		String[] cmd = { "/bin/sh", "-c",  ShellProcess.setEnv + "euca-describe-volumes" };
		Runtime rt = Runtime.getRuntime();
		String message = null;
		try {
			Process p = rt.exec(cmd);
			if (p.waitFor() != 0) {
				System.out.println("Falied");
			}
			volumelist.clear();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					p.getInputStream()));
			while ((message = in.readLine()) != null) {
				Volume vol = new Volume();
				String[] split = message.split("	");
				vol.setVolume_id(split[1]);
				vol.setVolume_size(split[2]);
				vol.setZone(split[4]);
				vol.setStatus(split[5]);
				vol.setCreat_time(split[6]);
				
				if (vol.getStatus().equals("in-use")){
					String attach=in.readLine();
					String[] split2 = attach.split("	");
					vol.setAttachment("Attached");
					vol.setInstance_id(split2[2]);
					vol.setDevice(split2[3]);
					vol.setAttach_time(split2[4]);
					volumelist.add(vol);
				}else{
					volumelist.add(vol);
				}
			}
		} catch (IOException ex) {
			ex.printStackTrace();
												
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String creat(){
		String[] addcmd = { "/bin/sh", "-c",ShellProcess.path + "creat_volume.sh "+this.getSize()};
		Runtime rt2 = Runtime.getRuntime();
		try {
			Process p2 = rt2.exec(addcmd);
			if (p2.waitFor() != 0) {
				System.out.println("Falied");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String delete(){
	
	//	System.out.println(this.getVolid());
		
		String volume_id = ((Volume) (volumelist.get(volid))).getVolume_id();
		
	//	System.out.println(volume_id);
		
		String[] delcmd = { "/bin/sh", "-c", ShellProcess.setEnv + "euca-delete-volume "+volume_id};
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
	
	public String attach(){
	//	System.out.println(instanceid+"\t"+volumeid+"\t"+device);
		String[] attachcmd = { "/bin/sh", "-c", ShellProcess.setEnv + "euca-attach-volume -i "+this.instanceid+" -d "+this.device+" "+this.volumeid};
		Runtime rt3 = Runtime.getRuntime();
		try {
			Process p3 = rt3.exec(attachcmd);
			if (p3.waitFor() != 0) {
				System.out.println("Falied");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return this.show();
	}
	
	public String detach(){
		String volume_id = ((Volume) (volumelist.get(volid))).getVolume_id();
		String[] delcmd = { "/bin/sh", "-c", ShellProcess.setEnv + "euca-detach-volume "+volume_id};
		Runtime rt4 = Runtime.getRuntime();
		try {
			Process p4 = rt4.exec(delcmd);
			if (p4.waitFor() != 0) {
				System.out.println("Falied");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return this.show();
	}
}

class Volume{
	private String volume_id;
	private String volume_size;
	private String zone;
	private String status;
	private String creat_time;
	private String attachment;
	private String instance_id;
	private String device;
	private String attach_time;
	
	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	public String getInstance_id() {
		return instance_id;
	}
	public void setInstance_id(String instance_id) {
		this.instance_id = instance_id;
	}
	public String getDevice() {
		return device;
	}
	public void setDevice(String device) {
		this.device = device;
	}
	public String getAttach_time() {
		return attach_time;
	}
	public void setAttach_time(String attach_time) {
		this.attach_time = attach_time;
	}
	public String getVolume_id() {
		return volume_id;
	}
	public void setVolume_id(String volume_id) {
		this.volume_id = volume_id;
	}
	public String getVolume_size() {
		return volume_size;
	}
	public void setVolume_size(String volume_size) {
		this.volume_size = volume_size;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCreat_time() {
		return creat_time;
	}
	public void setCreat_time(String creat_time) {
		this.creat_time = creat_time;
	}
}