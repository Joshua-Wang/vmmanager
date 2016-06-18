package cn.ac.iscas.vmmanager.ORM;

import java.util.HashSet;
import java.util.Set;

/**
 * Customer entity. @author MyEclipse Persistence Tools
 */

public class Customer implements java.io.Serializable {

	// Fields

	private Integer companyId;
	private String companyName;
	private Integer companySize;
	private String companyLocation;
	private String companyPostcode;
	private String companyTelphone;
	private String contactName;
	private String contactTelphone;
	private String contactEmail;
	private String contactDepartment;
	private String contactTitle;
	private String username;
	private String password;
	private Integer flag;
	private Set instances = new HashSet(0);

	// Constructors

	/** default constructor */
	public Customer() {
	}

	/** minimal constructor */
	public Customer(String companyName, String username, String password) {
		this.companyName = companyName;
		this.username = username;
		this.password = password;
	}

	/** full constructor */
	public Customer(String companyName, Integer companySize,
			String companyLocation, String companyPostcode,
			String companyTelphone, String contactName, String contactTelphone,
			String contactEmail, String contactDepartment, String contactTitle,
			String username, String password, Integer flag, Set instances) {
		this.companyName = companyName;
		this.companySize = companySize;
		this.companyLocation = companyLocation;
		this.companyPostcode = companyPostcode;
		this.companyTelphone = companyTelphone;
		this.contactName = contactName;
		this.contactTelphone = contactTelphone;
		this.contactEmail = contactEmail;
		this.contactDepartment = contactDepartment;
		this.contactTitle = contactTitle;
		this.username = username;
		this.password = password;
		this.flag = flag;
		this.instances = instances;
	}

	// Property accessors

	public Integer getCompanyId() {
		return this.companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return this.companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Integer getCompanySize() {
		return this.companySize;
	}

	public void setCompanySize(Integer companySize) {
		this.companySize = companySize;
	}

	public String getCompanyLocation() {
		return this.companyLocation;
	}

	public void setCompanyLocation(String companyLocation) {
		this.companyLocation = companyLocation;
	}

	public String getCompanyPostcode() {
		return this.companyPostcode;
	}

	public void setCompanyPostcode(String companyPostcode) {
		this.companyPostcode = companyPostcode;
	}

	public String getCompanyTelphone() {
		return this.companyTelphone;
	}

	public void setCompanyTelphone(String companyTelphone) {
		this.companyTelphone = companyTelphone;
	}

	public String getContactName() {
		return this.contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactTelphone() {
		return this.contactTelphone;
	}

	public void setContactTelphone(String contactTelphone) {
		this.contactTelphone = contactTelphone;
	}

	public String getContactEmail() {
		return this.contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public String getContactDepartment() {
		return this.contactDepartment;
	}

	public void setContactDepartment(String contactDepartment) {
		this.contactDepartment = contactDepartment;
	}

	public String getContactTitle() {
		return this.contactTitle;
	}

	public void setContactTitle(String contactTitle) {
		this.contactTitle = contactTitle;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getFlag() {
		return this.flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	public Set getInstances() {
		return this.instances;
	}

	public void setInstances(Set instances) {
		this.instances = instances;
	}

}