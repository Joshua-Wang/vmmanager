package cn.ac.iscas.vmmanager.ORM;

/**
 * Instance entity. @author MyEclipse Persistence Tools
 */

public class Instance implements java.io.Serializable {

	// Fields

	private Integer id;
	private Customer customer;
	private String hostSize;
	private String hostOs;
	private String payMethod;
	private String timeUsed;
	private String instanceIp;
	private String instanceId;
	private String instanceState;
	private Integer flag;

	// Constructors

	/** default constructor */
	public Instance() {
	}

	/** full constructor */
	public Instance(Customer customer, String hostSize, String hostOs,
			String payMethod, String timeUsed, String instanceIp,
			String instanceId, String instanceState, Integer flag) {
		this.customer = customer;
		this.hostSize = hostSize;
		this.hostOs = hostOs;
		this.payMethod = payMethod;
		this.timeUsed = timeUsed;
		this.instanceIp = instanceIp;
		this.instanceId = instanceId;
		this.instanceState = instanceState;
		this.flag = flag;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getHostSize() {
		return this.hostSize;
	}

	public void setHostSize(String hostSize) {
		this.hostSize = hostSize;
	}

	public String getHostOs() {
		return this.hostOs;
	}

	public void setHostOs(String hostOs) {
		this.hostOs = hostOs;
	}

	public String getPayMethod() {
		return this.payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public String getTimeUsed() {
		return this.timeUsed;
	}

	public void setTimeUsed(String timeUsed) {
		this.timeUsed = timeUsed;
	}

	public String getInstanceIp() {
		return this.instanceIp;
	}

	public void setInstanceIp(String instanceIp) {
		this.instanceIp = instanceIp;
	}

	public String getInstanceId() {
		return this.instanceId;
	}

	public void setInstanceId(String instanceId) {
		this.instanceId = instanceId;
	}

	public String getInstanceState() {
		return this.instanceState;
	}

	public void setInstanceState(String instanceState) {
		this.instanceState = instanceState;
	}

	public Integer getFlag() {
		return this.flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

}