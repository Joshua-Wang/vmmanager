package cn.ac.iscas.vmmanager.Action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

import com.opensymphony.xwork2.ActionSupport;

import cn.ac.iscas.vmmanager.DAO.*;
import cn.ac.iscas.vmmanager.Util.*;

public class ImageAction extends ActionSupport {
	private List imagelist = new LinkedList();
	public static final String setEnv = ". /home/joshua/.euca/eucarc;";
	
	public List getImagelist() {
		return imagelist;
	}
	public void setImagelist(List imagelist) {
		this.imagelist = imagelist;
	}
	public String show(){
		String[] cmd = { "/bin/sh", "-c", setEnv + "euca-describe-images" };
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
				Image img = new Image();
				String[] split = message.split("	");
				img.setIamgeid(split[1]);
				img.setManifest(split[2]);
				img.setOwner(split[3]);
				img.setAvailble(split[4]);
				img.setVisibility(split[5]);
				img.setArchitecture(split[7]);
				imagelist.add(img);
			}
		} catch (IOException ex) {
			ex.printStackTrace();
												
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
}

class Image{
	
	private String iamgeid;
	private String manifest;
	private String availble;
	private String owner;
	private String visibility;
	private String architecture;
	
	public String getIamgeid() {
		return iamgeid;
	}
	public void setIamgeid(String iamgeid) {
		this.iamgeid = iamgeid;
	}
	public String getManifest() {
		return manifest;
	}
	public void setManifest(String manifest) {
		this.manifest = manifest;
	}
	public String getAvailble() {
		return availble;
	}
	public void setAvailble(String availble) {
		this.availble = availble;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getVisibility() {
		return visibility;
	}
	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}
	public String getArchitecture() {
		return architecture;
	}
	public void setArchitecture(String architecture) {
		this.architecture = architecture;
	}
	
	
}
