package cn.ac.iscas.vmmanager.ORM;

import java.sql.Timestamp;

/**
 * InstanceLog entity. @author MyEclipse Persistence Tools
 */

public class InstanceLog implements java.io.Serializable {

	// Fields

	private Integer id;
	private String instanceId;
	private Integer opType;
	private Timestamp opTime;
	private Integer authorType;
	private Integer authorId;

	// Constructors

	/** default constructor */
	public InstanceLog() {
	}

	/** full constructor */
	public InstanceLog(String instanceId, Integer opType, Timestamp opTime,
			Integer authorType, Integer authorId) {
		this.instanceId = instanceId;
		this.opType = opType;
		this.opTime = opTime;
		this.authorType = authorType;
		this.authorId = authorId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getInstanceId() {
		return this.instanceId;
	}

	public void setInstanceId(String instanceId) {
		this.instanceId = instanceId;
	}

	public Integer getOpType() {
		return this.opType;
	}

	public void setOpType(Integer opType) {
		this.opType = opType;
	}

	public Timestamp getOpTime() {
		return this.opTime;
	}

	public void setOpTime(Timestamp opTime) {
		this.opTime = opTime;
	}

	public Integer getAuthorType() {
		return this.authorType;
	}

	public void setAuthorType(Integer authorType) {
		this.authorType = authorType;
	}

	public Integer getAuthorId() {
		return this.authorId;
	}

	public void setAuthorId(Integer authorId) {
		this.authorId = authorId;
	}

}