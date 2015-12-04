package com.ft.model;

//import java.util.Date;
import java.sql.Date;

public class File {
	
    private int file_id;
    private String file_name;
    private String file_no;
    private String file_type;
    private String description;
    private int owner_dept;
    private int owner_sec;
    private int owner;
    private int from_user;
    private int to_user;
    private int from_section;
    private int to_section;
    private int priority;
    private Date created_date;
    private int status;
    private int workflow_id;
    private Date completed_date;
    private Date due_date;
    private Date forwarded_date;
    private Date received_date;
    private String is_active;
    private String barcode_string;
    private String tags;
    private String remarks;
    private int instance_id;
    private Date updated_date;
    private String updated_type;
    private int updated_by;
    
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_no() {
		return file_no;
	}
	public void setFile_no(String file_no) {
		this.file_no = file_no;
	}
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getOwner_dept() {
		return owner_dept;
	}
	public void setOwner_dept(int owner_dept) {
		this.owner_dept = owner_dept;
	}
	public int getOwner_sec() {
		return owner_sec;
	}
	public void setOwner_sec(int owner_sec) {
		this.owner_sec = owner_sec;
	}
	public int getOwner() {
		return owner;
	}
	public void setOwner(int owner) {
		this.owner = owner;
	}
	public int getFrom_user() {
		return from_user;
	}
	public void setFrom_user(int from_user) {
		this.from_user = from_user;
	}
	public int getTo_user() {
		return to_user;
	}
	public void setTo_user(int to_user) {
		this.to_user = to_user;
	}
	public int getFrom_section() {
		return from_section;
	}
	public void setFrom_section(int from_section) {
		this.from_section = from_section;
	}
	public int getTo_section() {
		return to_section;
	}
	public void setTo_section(int to_section) {
		this.to_section = to_section;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getWorkflow_id() {
		return workflow_id;
	}
	public void setWorkflow_id(int workflow_id) {
		this.workflow_id = workflow_id;
	}
	public Date getCompleted_date() {
		return completed_date;
	}
	public void setCompleted_date(Date completed_date) {
		this.completed_date = completed_date;
	}
	public Date getDue_date() {
		return due_date;
	}
	public void setDue_date(Date due_date) {
		this.due_date = due_date;
	}
	public String getIs_active() {
		return is_active;
	}
	public void setIs_active(String is_active) {
		this.is_active = is_active;
	}
	public String getBarcode_string() {
		return barcode_string;
	}
	public void setBarcode_string(String barcode_string) {
		this.barcode_string = barcode_string;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public int getInstance_id() {
		return instance_id;
	}
	public void setInstance_id(int instance_id) {
		this.instance_id = instance_id;
	}
	public Date getUpdated_date() {
		return updated_date;
	}
	public void setUpdated_date(Date updated_date) {
		this.updated_date = updated_date;
	}
	public String getUpdated_type() {
		return updated_type;
	}
	public void setUpdated_type(String updated_type) {
		this.updated_type = updated_type;
	}
	public int getUpdated_by() {
		return updated_by;
	}
	public void setUpdated_by(int updated_by) {
		this.updated_by = updated_by;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Date getForwarded_date() {
		return forwarded_date;
	}
	public void setForwarded_date(Date forwarded_date) {
		this.forwarded_date = forwarded_date;
	}
	public Date getReceived_date() {
		return received_date;
	}
	public void setReceived_date(Date received_date) {
		this.received_date = received_date;
	}

    
//...constructors, getters and setters

}
