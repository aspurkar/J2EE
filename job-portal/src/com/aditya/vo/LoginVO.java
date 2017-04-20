package com.aditya.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class LoginVO implements Serializable {
	

	public String username;
	public String password;
	public String fname;
	public String lname;
	public String address;
	public String email;
	public String contact;
	
	
	public LoginVO(String username, String password, String fname,
			String lname, String address, String email, String contact) {
		super();
		this.username = username;
		this.password = password;
		this.fname = fname;
		this.lname = lname;
		this.address = address;
		this.email = email;
		this.contact = contact;
	}
	
	public LoginVO() {
		super();
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	
	
}
