package cn.ac.iscas.vmmanager.Action;

import com.opensymphony.xwork2.ActionSupport;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

import cn.ac.iscas.vmmanager.Util.*;

public class KeypairAction extends ActionSupport{
	
	private static List keypairlist = new LinkedList();
	private int keyid;
	private String keyname;
	public static final String setEnv = ". /home/joshua/.euca/eucarc;";
	public static final String path = "/home/joshua/VMManager/shell-script/";
	
	public String getKeyname() {
		return keyname;
	}


	public void setKeyname(String keyname) {
		this.keyname = keyname;
	}


	public int getKeyid() {
		return keyid;
	}


	public void setKeyid(int keyid) {
		this.keyid = keyid;
	}


	public List getKeypairlist() {
		return keypairlist;
	}


	public void setKeypairlist(List keypairlist) {
		this.keypairlist = keypairlist;
	}

	public String show(){
		String[] cmd = { "/bin/sh", "-c", setEnv + "euca-describe-keypairs" };
		Runtime rt = Runtime.getRuntime();
		String message = null;
		try {
			Process p = rt.exec(cmd);
			if (p.waitFor() != 0) {
				System.out.println("Falied");
			}
			keypairlist.clear();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					p.getInputStream()));
			while ((message = in.readLine()) != null) {
				Keypair key = new Keypair();
				String[] split = message.split("	");
				key.setName(split[1]);
				key.setFingerprint(split[2]);
				keypairlist.add(key);
			}
			
		} catch (IOException ex) {
			ex.printStackTrace();
												
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	public String delete(){
		
		String keypair_id = ((Keypair) (keypairlist.get(keyid))).getName();
		String[] delcmd = { "/bin/sh", "-c", setEnv + "euca-delete-keypair "+keypair_id};
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
	
	public String add(){
		
		String[] addcmd = { "/bin/sh", "-c",path + "add_keypair.sh "+this.getKeyname()};
		Runtime rt2 = Runtime.getRuntime();
		try {
			Process p2 = rt2.exec(addcmd);
			if (p2.waitFor() != 0) {
				System.out.println("Falied");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return this.show();
	}
}

class Keypair{
	
	private String name;
	private String fingerprint;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFingerprint() {
		return fingerprint;
	}
	public void setFingerprint(String fingerprint) {
		this.fingerprint = fingerprint;
	}
}
