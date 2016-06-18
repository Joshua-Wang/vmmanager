package cn.ac.iscas.vmmanager.Action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import cn.ac.iscas.vmmanager.ORM.*;
import cn.ac.iscas.vmmanager.DAO.*;
import cn.ac.iscas.vmmanager.Util.*;
import java.util.*;

public class RegisterAction extends ActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8917535497289382325L;
	private String company_name;
	private String company_size;
	private String company_location;
	private String company_postcode;
	private String company_phone;
	private String contact_name;
	private String contact_telphone;
	private String contact_email;
	private String contact_department;
	private String contact_title;
	private String username;
	private String password;
	private String confirm_password;
	private static Customer NewRegister = new Customer();
	
	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String companyName) {
		company_name = companyName;
	}

	public String getCompany_size() {
		return company_size;
	}

	public void setCompany_size(String companySize) {
		company_size = companySize;
	}

	public String getCompany_location() {
		return company_location;
	}

	public void setCompany_location(String companyLocation) {
		company_location = companyLocation;
	}

	public String getCompany_postcode() {
		return company_postcode;
	}

	public void setCompany_postcode(String companyPostcode) {
		company_postcode = companyPostcode;
	}

	public String getCompany_phone() {
		return company_phone;
	}

	public void setCompany_phone(String companyPhone) {
		company_phone = companyPhone;
	}

	public String getContact_name() {
		return contact_name;
	}

	public void setContact_name(String contactName) {
		contact_name = contactName;
	}

	public String getContact_telphone() {
		return contact_telphone;
	}

	public void setContact_telphone(String contactTelphone) {
		contact_telphone = contactTelphone;
	}

	public String getContact_email() {
		return contact_email;
	}

	public void setContact_email(String contactEmail) {
		contact_email = contactEmail;
	}

	public String getContact_department() {
		return contact_department;
	}

	public void setContact_department(String contactDepartment) {
		contact_department = contactDepartment;
	}

	public String getContact_title() {
		return contact_title;
	}

	public void setContact_title(String contactTitle) {
		contact_title = contactTitle;
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

	public String getConfirm_password() {
		return confirm_password;
	}

	public void setConfirm_password(String confirmPassword) {
		confirm_password = confirmPassword;
	}

	public void validateFinish_step1(){
		if (this.company_name == null || this.company_name.length() == 0){
			addFieldError(company_name,"公司名称不能为空");
		}
		if (this.company_location == null || this.company_location.length() == 0){
			addFieldError(company_location,"公司地址不能为空");
		}
		if (this.company_postcode == null || this.company_postcode.length() == 0){
			addFieldError(company_postcode,"公司邮编不能为空");
		}else if (!CheckFormat.isPost(this.company_postcode)){
			addFieldError(company_postcode,"公司邮编格式错误，正确格式为六位数字！");
			System.out.println(company_postcode);
		}
		
		if (this.company_phone == null || this.company_phone.length() == 0){
			addFieldError(company_phone,"公司电话不能为空");
		}else if (!CheckFormat.isPhone(this.company_phone)){
			addFieldError(company_phone,"电话格式错误，正确格式：xxx-xxxx-xxxx！");
		}
	}
	
	@InputConfig(resultName="input_step1")
	public String finish_step1() {
		NewRegister.setCompanyLocation(this.company_location);
		NewRegister.setCompanyName(this.company_name);
		NewRegister.setCompanyPostcode(this.company_postcode);
		NewRegister.setCompanySize(Integer.parseInt(this.company_size));
		NewRegister.setCompanyTelphone(this.company_phone);
		
		//System.out.println(NewRegister.getCompanyName()+"step1");
		return "input_step2";
	}
	
	public void validateFinish_step2(){
		if (this.contact_name == null || this.contact_name.length() == 0){
			addFieldError(contact_name,"联系人姓名不能为空！");
		}
		
		if (this.contact_telphone == null || this.contact_telphone.length() == 0){
			addFieldError(contact_telphone,"联系电话不能为空！");
		}else if (!CheckFormat.isMobile(contact_telphone)){
			addFieldError(contact_telphone,"手机号码格式错误！");
		}
		
		if (this.contact_email == null || this.contact_email.length() == 0){
			addFieldError(contact_email,"邮箱不能为空！");
		}else if (!CheckFormat.isEmail(contact_email)){
			addFieldError(contact_email,"邮箱格式错误！");
		}
	}
	
	@InputConfig(resultName="input_step2")
	public String finish_step2(){
		NewRegister.setContactName(this.contact_name);
		NewRegister.setContactDepartment(this.contact_department);
		NewRegister.setContactEmail(this.contact_email);
		NewRegister.setContactTelphone(this.contact_telphone);
		NewRegister.setContactTitle(this.contact_title);
		//System.out.println(NewRegister.getCompanyName()+"step2");
		return "input_step3";
	}
	
	public String step2_back(){
		return "input_step1";
	}
	
	public void validateFinish_step3(){
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
	
	@InputConfig(resultName="input_step3")
	public String finish_step3(){
		
		NewRegister.setUsername(this.username);
		NewRegister.setPassword(this.password);
		NewRegister.setFlag(0);
		
		CustomerDAO cus = new CustomerDAO();
		List list = cus.findByProperty("username", this.username);
		Iterator i = list.iterator();
		if (i.hasNext()){
			addFieldError(username,"该用户名已注册，请重新输入用户名！");
			return "input_step3";
		}else{
				cus.save(NewRegister);
				Map<String,Object> session = ActionContext.getContext().getSession();
				session.put("user", this.username);
		}
		addFieldError(confirm_password,"注册成功，您已自动登录，可以继续注册主机服务！");
		return "input_step3";
	}
	
	public String step3_back(){
		return "input_step2";
	}
}











