package cn.ac.iscas.vmmanager.Action;

import cn.ac.iscas.vmmanager.DAO.*;
import cn.ac.iscas.vmmanager.ORM.*;
import cn.ac.iscas.vmmanager.Util.*;

import java.io.IOException;
import java.io.PrintStream;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ServiceAction extends ActionSupport {
	private String select;
	private String select2;
	private String select3;
	private Instance instance = new Instance();
	private static List UserIndexlist = new LinkedList();
	private static List userApplist = new LinkedList();
	private int id;
	private int deleteid;
	private int hostid;
	private String apply=null;

	public int getDeleteid() {
		return deleteid;
	}

	public void setDeleteid(int deleteid) {
		this.deleteid = deleteid;
	}
	
	public String getApply() {
		return apply;
	}

	public void setApply(String apply) {
		this.apply = apply;
	}

	public int getHostid() {
		return hostid;
	}

	public void setHostid(int hostid) {
		this.hostid = hostid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List getUserApplist() {
		return userApplist;
	}

	public void setUserApplist(List userApplist) {
		this.userApplist = userApplist;
	}

	public Instance getInstance() {
		return instance;
	}

	public void setInstance(Instance instance) {
		this.instance = instance;
	}

	public List getUserIndexlist() {
		return UserIndexlist;
	}

	public void setUserIndexlist(List userIndexlist) {
		UserIndexlist = userIndexlist;
	}

	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}

	public String getSelect2() {
		return select2;
	}

	public void setSelect2(String select2) {
		this.select2 = select2;
	}

	public String getSelect3() {
		return select3;
	}

	public void setSelect3(String select3) {
		this.select3 = select3;
	}

	public String save() {
		/*
		 * System.out.println(this.select); System.out.println(this.select2);
		 * System.out.println(this.select3);
		 */
		Map<String, Object> session = ActionContext.getContext().getSession();
		String user = session.get("user").toString();
		CustomerDAO cusdao = new CustomerDAO();
		Customer cus = new Customer();
		try {
			List list = cusdao.findByProperty("username", user);
			cus = (Customer) list.get(0);
		} catch (Exception e) {
			System.out.println("数据库中没有该用户！");
		}
		/*
		 * System.out.println("当前登录用户："+user);
		 * System.out.println("数据库中查的用户："+cus.getUsername());
		 */

		instance.setCustomer(cus);
		instance.setFlag(0);
		instance.setHostOs(this.select);
		instance.setHostSize(select2);
		instance.setPayMethod(select3);
		instance.setInstanceState("待审核");
		
		//instance.setTimeUsed(0);
		String DATE_FORMAT = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		Calendar c1 = Calendar.getInstance();
		if (this.select3.equals("按月计费")){
			c1.add(Calendar.MONTH, 1);
		}else if (this.select3.equals("按季度计费")){
			 c1.add(Calendar.MONTH, 3);
		}else if (this.select3.equals("按年计费")){
			c1.add(Calendar.YEAR, 1);
		}
		
		instance.setTimeUsed(sdf.format(c1.getTime()));
		
		InstanceDAO insdao = new InstanceDAO();
		insdao.save(instance);
		addFieldError("select", "服务申请成功，您可以到主界面查看服务申请信息！");
		return INPUT;
	}

	public String showUserIndex() {
		return execute();
	}

	public String execute() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		String user = session.get("user").toString();
		CustomerDAO cusdao = new CustomerDAO();
		Customer cus = new Customer();
		try {
			List list = cusdao.findByProperty("username", user);
			cus = (Customer) list.get(0);
		} catch (Exception e) {
			System.out.println("数据库中没有该用户！");
		}
		/*if (UserIndexlist != null){
			UserIndexlist.clear();
		}*/
		InstanceDAO insdao = new InstanceDAO();
		this.setUserIndexlist(insdao.findByProperty("customer", cus));

		return "user_index";
	}

	public String ShowUserApp() {
		InstanceDAO insdao = new InstanceDAO();
		List templist = insdao.JoinFind();
		userApplist.clear();
		Iterator i = templist.iterator();
		while (i.hasNext()) {
			Object[] o = (Object[]) i.next();
			Service ser = new Service();
			ser.setCompanyId(Integer.parseInt(o[0].toString()));
			ser.setCompanyName((String) o[1]);
			ser.setInstanceId(Integer.parseInt(o[2].toString()));
			ser.setHostSize((String) o[3]);
			ser.setHostOs((String) o[4]);
			ser.setPayMethod((String) o[5]);
			ser.setTimeUsed((String)o[6]);
			ser.setInstanceIp((String) o[7]);
			ser.setInstanceState((String) o[8]);
			userApplist.add(ser);
		}

		return "user_app";
	}
	
	public String grant(){
		int instanceid = ((Service) (userApplist.get(id))).getInstanceId();
		InstanceDAO insdao = new InstanceDAO();
		insdao.updateByid(instanceid, "审核通过");
		return this.ShowUserApp();
	}
	
	public String detail() throws IOException{
		int companyid = ((Service) (userApplist.get(id))).getCompanyId();
		CustomerDAO cusdao = new CustomerDAO();
		List company = cusdao.findByProperty("companyId", companyid);
		Customer cus = (Customer)company.get(0);
		
		String companysize = null;
		switch (cus.getCompanySize()) {
		case 1:
			companysize = "100人以下";
			break;
		case 2:
			companysize = "100~200人";
			break;
		case 3:
			companysize = "200~500人";
			break;
		case 4:
			companysize = "500人以上";
			break;
		}

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintStream out = new PrintStream(response.getOutputStream());//获取out输出对象
		String str = cus.getCompanyName()+"$"+companysize+"$"+cus.getCompanyLocation()+"$"+cus.getCompanyPostcode()+"$";
		str += cus.getCompanyTelphone()+"$"+cus.getContactName()+"$"+cus.getContactTelphone()+"$";
		str += cus.getContactEmail()+"$"+cus.getContactDepartment()+"$"+cus.getContactTitle();
		out.println(str);
		return null;
	}
	
	public String drop(){
		//System.out.println(this.deleteid);
		
		int delid = ((Instance)(UserIndexlist.get(this.deleteid))).getId();
		
		//System.out.println(delid);
		
		InstanceDAO insdao = new InstanceDAO();
		insdao.deleteById(delid);
		return this.execute();
	}
	
	public String admin_drop(){
		//System.out.println(this.deleteid);
		
		int instanceid = ((Service) (userApplist.get(this.deleteid))).getInstanceId();
		InstanceDAO insdao = new InstanceDAO();
		insdao.deleteById(instanceid);
		return this.execute();
	}
	
	public String new_register(){
		InstanceDAO insdao = new InstanceDAO();
		List list = insdao.findAll();
		Iterator i = list.iterator();
		while (i.hasNext()){
			Instance ins = (Instance)i.next();
			String state = ins.getInstanceState();
			if (state.equals("待审核")){
				apply = "新消息提醒：有待审核的主机申请！";
			}
		}
		return "top";
	}
}

class Service {
	private Integer companyId;
	private String companyName;
	private Integer instanceId;
	private String hostSize;
	private String hostOs;
	private String payMethod;
	private String timeUsed;
	private String instanceIp;
	private String instanceState;

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Integer getInstanceId() {
		return instanceId;
	}

	public void setInstanceId(Integer instanceId) {
		this.instanceId = instanceId;
	}

	public String getHostSize() {
		return hostSize;
	}

	public void setHostSize(String hostSize) {
		this.hostSize = hostSize;
	}

	public String getHostOs() {
		return hostOs;
	}

	public void setHostOs(String hostOs) {
		this.hostOs = hostOs;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public String getTimeUsed() {
		return timeUsed;
	}

	public void setTimeUsed(String timeUsed) {
		this.timeUsed = timeUsed;
	}

	public String getInstanceIp() {
		return instanceIp;
	}

	public void setInstanceIp(String instanceIp) {
		this.instanceIp = instanceIp;
	}

	public String getInstanceState() {
		return instanceState;
	}

	public void setInstanceState(String instanceState) {
		this.instanceState = instanceState;
	}
}
