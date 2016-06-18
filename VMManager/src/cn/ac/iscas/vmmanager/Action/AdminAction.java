package cn.ac.iscas.vmmanager.Action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.*;

import cn.ac.iscas.vmmanager.DAO.*;
import cn.ac.iscas.vmmanager.ORM.*;

public class AdminAction extends ActionSupport{
	private Integer id;
	private String username;
	private String password;
	private String confirm_password;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getConfirm_password() {
		return confirm_password;
	}

	public void setConfirm_password(String confirmPassword) {
		confirm_password = confirmPassword;
	}

	private List adminlist;
	
	
	public List getAdminlist() {
		return adminlist;
	}

	public void setAdminlist(List adminlist) {
		this.adminlist = adminlist;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String show(){
		AdminDAO admindao = new AdminDAO();
		this.setAdminlist(admindao.findAll());
		return "show";
	}
	
	public String add(){
		Admin admin = new Admin();
		admin.setName(this.username);
		admin.setPassword(this.password);
		
		AdminDAO admindao = new AdminDAO();
		List list = admindao.findByProperty("name", this.username);
		Iterator i = list.iterator();
		if (i.hasNext()){
			addFieldError(username,"该用户名已注册，请重新输入用户名！");
			return INPUT;
		}else{
				admindao.save(admin);
		}
		addFieldError(confirm_password,"管理员添加成功！");
		return INPUT;
	}
	
	public void validateAdd(){
		if (this.username == null || this.username.length() == 0){
			addFieldError(username,"用户名不能为空！");
		}
		
		if (this.password == null || this.password.length() == 0){
			addFieldError(password,"密码不能为空！");
		}
		
		if (this.password.length() != 0 && this.confirm_password.length() != 0 && !this.password.equals(this.confirm_password)){
			addFieldError(confirm_password,"密码输入不一致，请重新输入！");
		}
	}
	
	public String delete(){
		AdminDAO admindao = new AdminDAO();
		admindao.deleteById(this.id);
		return this.show();
	}
}
