package cn.ac.iscas.vmmanager.Action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;

import cn.ac.iscas.vmmanager.DAO.*;
import cn.ac.iscas.vmmanager.ORM.*;
import java.util.*;

public class LoginAction extends ActionSupport {
	private String username;
	private String password;
	private String admin_username;
	private String admin_password;
	
	public String getAdmin_username() {
		return admin_username;
	}
	public void setAdmin_username(String adminUsername) {
		admin_username = adminUsername;
	}
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_password(String adminPassword) {
		admin_password = adminPassword;
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

	@InputConfig(resultName="user_input")
	public String userCheck(){
		CustomerDAO cusdao = new CustomerDAO();
		Customer cus = new Customer();
		List list = cusdao.findByProperty("username", this.username);
		Iterator i = list.iterator();
		if (i.hasNext()){
			cus = (Customer)i.next();
			if (this.password.equals(cus.getPassword())){
				Map<String,Object> session = ActionContext.getContext().getSession();
				session.put("user", this.username);
				return "user_index";
			}else{
				addFieldError(username,"用户名密码不匹配，请重新输入！");
				return "user_input";
			}
		}else{
			addFieldError(username,"用户名密码不匹配，请重新输入！");
			return "user_input";
		}
	}
	
	public void validateUserCheck(){
		if (this.username == null || this.username.length() == 0){
			addFieldError(username,"用户名不能为空！");
		}
		
		if (this.password == null || this.password.length() == 0){
			addFieldError(password,"密码不能为空");
		}
	}
	
	@InputConfig(resultName="admin_input")
	public String adminCheck(){
		AdminDAO admindao = new AdminDAO();
		Admin ad = new Admin();
		List list = admindao.findByProperty("name", this.admin_username);
		Iterator i = list.iterator();
		if (i.hasNext()){
			ad = (Admin)i.next();
			if (this.admin_password.equals(ad.getPassword())){
				Map<String,Object> session = ActionContext.getContext().getSession();
				session.put("admin", this.admin_username);
				return "admin_index";
			}else{
				addFieldError(admin_username,"用户名密码不匹配，请重新输入！");
				return "admin_input";
			}
		}else{
			addFieldError(admin_username,"用户名密码不匹配，请重新输入！");
			return "admin_input";
		}
	}
	
	public void validateAdminCheck(){
		if (this.admin_username == null || this.admin_username.length() == 0){
			addFieldError(admin_username,"用户名不能为空！");
		}
		
		if (this.admin_password == null || this.admin_password.length() == 0){
			addFieldError(admin_password,"密码不能为空");
		}
	}
	
	public String AdminLogout(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		session.remove("admin");
		return "admin_input";
	}
	
	public String UserLogout(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		session.remove("user");
		return "user_input";
	}
}








