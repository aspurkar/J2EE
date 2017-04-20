package com.aditya.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class RequestVO implements Serializable {

	public String status;
	public int iid;
	public String username;
	public String id;
	public String fname;
	public String lname;
	public String contact;
	public String email;
	public String address;
	public RequestVO(String username, String id, String fname, String lname,
			String contact, String email, String address) {
		super();
		this.username = username;
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.contact = contact;
		this.email = email;
		this.address = address;
	}
	public RequestVO() {
		super();
	}
	
	public String getStatus(){
		return status;
	}
	
	public void setStatus(String status){
		this.status = status;
	}
	
	
	
	public int getIid(){
		return iid;
	}
	
	public void setIid(int iid){
		this.iid = iid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
